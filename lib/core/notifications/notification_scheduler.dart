import 'package:app_platform_core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../features/medications/medication_management/models/enums/medication_enums.dart';
import '../../features/medications/medication_management/models/medication_schedule_model.dart';
import '../../features/medications/medication_management/repositories/medication_repository.dart';
import 'notification_constants.dart';
import 'notification_payload.dart';
import 'notification_queue_manager.dart';
import 'notification_service.dart';
import 'next_occurrence_calculator.dart';

/// Orchestrates scheduling/cancelling of notifications for all medications.
///
/// This class:
/// - Reads schedules from [MedicationRepository]
/// - Uses [NextOccurrenceCalculator] to compute firing times
/// - Uses [NotificationQueueManager] to respect the iOS 64-limit
/// - Delegates platform calls to [NotificationService]
///
/// All public APIs return [Result<T>] to surface errors safely.
class NotificationScheduler {
  final NotificationService _service;
  final MedicationRepository _repository;
  final NextOccurrenceCalculator _calculator;
  final NotificationQueueManager _queueManager;

  NotificationScheduler({
    required this._service,
    required this._repository,
    required this._calculator,
    required this._queueManager,
  });

  /// Whether a full reschedule is currently in progress.
  bool _isRescheduling = false;

  // ── Public API ─────────────────────────────────────────────────────────

  /// Schedules all notifications for a single medication.
  ///
  /// Returns [Success] with the count of scheduled notifications,
  /// or [Failure] if the repository read fails.
  Future<Result<int>> scheduleForMedication(String medicationUuid) async {
    final schedulesResult = await _repository.getSchedules(medicationUuid);
    if (schedulesResult case Failure(:final error)) {
      return Failure(error);
    }
    final schedules = (schedulesResult as Success).data;

    final medResult = await _repository.getMedication(medicationUuid);
    final isCritical = medResult is Success &&
        (medResult as Success).data.priority == MedicationPriority.high;

    final available = await _queueManager.availableSlots;
    var slotsUsed = 0;

    // Cache current time once to avoid repeated TZDateTime.now() calls.
    final now = tz.TZDateTime.now(tz.local);
    final today = DateTime(now.year, now.month, now.day);

    for (final schedule in schedules) {
      if (schedule.repeatType == RepeatType.asNeeded) continue;
      if (_isExpired(schedule, today)) continue;
      if (slotsUsed >= available) break;

      final count = await _scheduleSingleSchedule(
        medicationUuid: medicationUuid,
        schedule: schedule,
        slotsRemaining: available - slotsUsed,
        isCritical: isCritical,
      );
      slotsUsed += count;
    }

    return Success(slotsUsed);
  }

  /// Cancels all notifications for a medication.
  ///
  /// Returns [Success] on completion, or [Failure] if the repository read fails.
  Future<Result<void>> cancelForMedication(String medicationUuid) async {
    final result = await _repository.getSchedules(medicationUuid);
    if (result case Failure(:final error)) {
      return Failure(error);
    }

    final schedules = (result as Success).data;
    for (final schedule in schedules) {
      await _cancelSingleSchedule(schedule);
    }

    return const Success(null);
  }

  /// Cancels a single schedule's notifications.
  Future<Result<void>> cancelSchedule(
    String scheduleUuid,
    RepeatType repeatType,
    List<int> weekdays,
  ) async {
    final now = tz.TZDateTime.now(tz.local);
    final occurrenceDate = DateTime(now.year, now.month, now.day);

    if (repeatType == RepeatType.specificDays) {
      for (final weekday in weekdays) {
        final id = NextOccurrenceCalculator.generateNotificationId(
          medicationId: '',
          scheduleId: scheduleUuid,
          occurrenceDate: occurrenceDate,
          weekday: weekday,
        );
        await _service.cancel(id);
      }
    } else {
      final id = NextOccurrenceCalculator.generateNotificationId(
        medicationId: '',
        scheduleId: scheduleUuid,
        occurrenceDate: occurrenceDate,
      );
      await _service.cancel(id);
    }

    return const Success(null);
  }

  /// Cancels + re-schedules a single medication.
  Future<Result<int>> rescheduleForMedication(String medicationUuid) async {
    final cancelResult = await cancelForMedication(medicationUuid);
    if (cancelResult case Failure(:final error)) {
      return Failure(error);
    }
    return scheduleForMedication(medicationUuid);
  }

  /// Schedules a one-time snooze notification.
  ///
  /// Returns [Success] with the snooze notification ID, or [Failure] on error.
  Future<Result<int>> scheduleSnooze({
    required String medicationUuid,
    required String scheduleUuid,
    required int snoozeMinutes,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    final occurrenceDate = DateTime(now.year, now.month, now.day);

    final id = NextOccurrenceCalculator.generateSnoozeId(
      medicationId: medicationUuid,
      scheduleId: scheduleUuid,
      occurrenceDate: occurrenceDate,
      snoozeMinutes: snoozeMinutes,
    );

    final fireAt = now.add(Duration(minutes: snoozeMinutes));

    final payload = NotificationPayload(
      medicationId: medicationUuid,
      scheduleId: scheduleUuid,
      notificationId: id,
      actionType: NotificationConstants.actionOpenApp,
    );

    await _service.scheduleOneShot(
      notificationId: id,
      title: 'Medication Reminder',
      body: 'Time to take your medication',
      scheduledDate: fireAt,
      payload: payload.toJsonString(),
    );

    return Success(id);
  }

  /// Cancels a specific snooze notification.
  Future<Result<void>> cancelSnooze(
    String scheduleUuid,
    int snoozeMinutes,
  ) async {
    final now = tz.TZDateTime.now(tz.local);
    final occurrenceDate = DateTime(now.year, now.month, now.day);

    final id = NextOccurrenceCalculator.generateSnoozeId(
      medicationId: '',
      scheduleId: scheduleUuid,
      occurrenceDate: occurrenceDate,
      snoozeMinutes: snoozeMinutes,
    );

    await _service.cancel(id);
    return const Success(null);
  }

  /// Schedules all active medications.
  ///
  /// Returns [Success] with total notifications scheduled, or [Failure].
  Future<Result<int>> scheduleAll() async {
    final result = await _repository.getAllMedications();
    if (result case Failure(:final error)) {
      return Failure(error);
    }

    final medications = (result as Success).data;
    var totalScheduled = 0;

    // Query pending count once and decrement locally to avoid N×getPending().
    var slotsRemaining = _queueManager.maxOccurrencesThatFit(
      await _queueManager.availableSlots,
    );

    for (final medication in medications) {
      if (slotsRemaining <= 0) break;

      final count = await scheduleForMedication(medication.uuid);
      if (count case Success(:final data)) {
        totalScheduled += data;
        slotsRemaining -= data;
      }
    }

    return Success(totalScheduled);
  }

  /// Cancel everything and re-schedule. Used on timezone change / boot.
  ///
  /// Returns [Success] with total notifications scheduled, or [Failure].
  Future<Result<int>> rescheduleAll() async {
    if (_isRescheduling) {
      debugPrint(
        'NotificationScheduler — rescheduleAll already in progress, skipping',
      );
      return const Success(0);
    }

    _isRescheduling = true;
    try {
      await _service.cancelAll();
      return scheduleAll();
    } finally {
      _isRescheduling = false;
    }
  }

  // ── Internal scheduling ────────────────────────────────────────────────

  Future<int> _scheduleSingleSchedule({
    required String medicationUuid,
    required MedicationScheduleModel schedule,
    required int slotsRemaining,
    bool isCritical = false,
  }) async {
    final title = isCritical ? '⚠️ تنبيه دواء حرج' : 'تذكير بموعد الدواء';
    final body = isCritical
        ? 'حان وقت تناول دوائك الحرج الآن، نرجو عدم التأخير'
        : 'حان وقت تناول الدواء';

    final occurrences = _calculator.upcomingOccurrences(
      schedule,
      maxCount: slotsRemaining,
    );

    var scheduled = 0;
    for (final occurrence in occurrences) {
      if (scheduled >= slotsRemaining) break;

      final payload = NotificationPayload(
        medicationId: medicationUuid,
        scheduleId: schedule.uuid,
        notificationId: 0, // will be overwritten
        actionType: NotificationConstants.actionOpenApp,
      );

      switch (schedule.repeatType) {
        case RepeatType.daily:
          final id = NextOccurrenceCalculator.generateNotificationId(
            medicationId: medicationUuid,
            scheduleId: schedule.uuid,
            occurrenceDate: occurrence,
          );
          final finalPayload = payload.copyWithNotificationId(id);

          await _service.scheduleDaily(
            notificationId: id,
            title: title,
            body: body,
            scheduledDate: occurrence,
            isCritical: isCritical,
            payload: finalPayload.toJsonString(),
          );
          scheduled++;
          break;

        case RepeatType.specificDays:
          final id = NextOccurrenceCalculator.generateNotificationId(
            medicationId: medicationUuid,
            scheduleId: schedule.uuid,
            occurrenceDate: occurrence,
            weekday: occurrence.weekday,
          );
          final finalPayload = payload.copyWithNotificationId(id);

          await _service.scheduleWeekly(
            notificationId: id,
            title: title,
            body: body,
            scheduledDate: occurrence,
            isCritical: isCritical,
            payload: finalPayload.toJsonString(),
          );
          scheduled++;
          break;

        case RepeatType.interval:
          final id = NextOccurrenceCalculator.generateNotificationId(
            medicationId: medicationUuid,
            scheduleId: schedule.uuid,
            occurrenceDate: occurrence,
          );
          final finalPayload = payload.copyWithNotificationId(id);

          await _service.scheduleOneShot(
            notificationId: id,
            title: title,
            body: body,
            scheduledDate: occurrence,
            isCritical: isCritical,
            payload: finalPayload.toJsonString(),
          );
          scheduled++;
          break;

        case RepeatType.asNeeded:
          break;
      }
    }

    return scheduled;
  }

  Future<void> _cancelSingleSchedule(MedicationScheduleModel schedule) async {
    final now = tz.TZDateTime.now(tz.local);
    final occurrenceDate = DateTime(now.year, now.month, now.day);

    if (schedule.repeatType == RepeatType.specificDays) {
      for (final weekday in schedule.weekdays) {
        final id = NextOccurrenceCalculator.generateNotificationId(
          medicationId: schedule.medicationUuid,
          scheduleId: schedule.uuid,
          occurrenceDate: occurrenceDate,
          weekday: weekday,
        );
        await _service.cancel(id);
      }
    } else {
      final id = NextOccurrenceCalculator.generateNotificationId(
        medicationId: schedule.medicationUuid,
        scheduleId: schedule.uuid,
        occurrenceDate: occurrenceDate,
      );
      await _service.cancel(id);
    }
  }

  bool _isExpired(MedicationScheduleModel schedule, DateTime today) {
    if (schedule.endDate == null) return false;
    return schedule.endDate!.isBefore(today);
  }
}

/// Extension to set notificationId on the payload.
extension _PayloadCopy on NotificationPayload {
  NotificationPayload copyWithNotificationId(int id) => NotificationPayload(
    medicationId: medicationId,
    scheduleId: scheduleId,
    notificationId: id,
    actionType: actionType,
  );
}
