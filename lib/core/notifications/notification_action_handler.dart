import 'package:app_platform_core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../features/medications/medication_management/models/dose_log_model.dart';
import '../../features/medications/medication_management/models/enums/medication_enums.dart';
import '../../features/medications/medication_management/repositories/medication_repository.dart';
import 'notification_payload.dart';
import 'notification_scheduler.dart';

/// Processes notification actions (taken / skipped / snooze / open) in the
/// background, updating repositories without requiring the UI.
///
/// ## Error Handling
///
/// Each handler returns [Result<T>] so callers can propagate errors.
/// Background processing logs failures but does not crash the app.
class NotificationActionHandler {
  final MedicationRepository _repository;
  final NotificationScheduler _scheduler;

  NotificationActionHandler({
    required this._repository,
    required this._scheduler,
  });

  /// Wired to [NotificationService.onActionReceived].
  void handleNotificationResponse(NotificationResponse response) {
    final payload = NotificationPayload.fromJsonString(response.payload);
    if (payload == null) {
      debugPrint('NotificationActionHandler — invalid payload');
      return;
    }

    final actionId = response.actionId;

    // Tap on notification body (no action button) → open app.
    if (actionId == null || actionId.isEmpty || actionId == '__default__') {
      debugPrint('NotificationActionHandler — open_app (tap)');
      return;
    }

    // Action buttons dispatched by the app (not OS-level).
    switch (actionId) {
      case 'taken':
        _handleTaken(payload);
      case 'skipped':
        _handleSkipped(payload);
      case _ when actionId.startsWith('snooze_'):
        _handleSnooze(payload, actionId);
      default:
        debugPrint('NotificationActionHandler — unknown action: $actionId');
    }
  }

  // ── Taken ──────────────────────────────────────────────────────────────

  Future<Result<DoseLogModel>> _handleTaken(NotificationPayload payload) async {
    debugPrint(
      'NotificationActionHandler — taken '
      'med=${payload.medicationId} sch=${payload.scheduleId}',
    );

    final now = DateTime.now();
    final scheduledAt = DateTime(now.year, now.month, now.day);

    final medResult = await _repository.getMedication(payload.medicationId);
    final profileUuid = switch (medResult) {
      Success(:final data) => data.profileUuid,
      _ => '',
    };

    final result = await _repository.logDose(
      DoseLogModel(
        uuid: now.microsecondsSinceEpoch.toString(),
        profileUuid: profileUuid,
        medicationUuid: payload.medicationId,
        scheduleUuid: payload.scheduleId,
        scheduledAt: scheduledAt,
        actionAt: now,
        status: DoseStatus.taken,
        createdAt: now,
        updatedAt: now,
      ),
    );

    if (result case Failure(:final error)) {
      debugPrint('NotificationActionHandler — logDose(taken) failed: $error');
    }

    return result;
  }

  // ── Skipped ────────────────────────────────────────────────────────────

  Future<Result<DoseLogModel>> _handleSkipped(
    NotificationPayload payload,
  ) async {
    debugPrint(
      'NotificationActionHandler — skipped '
      'med=${payload.medicationId} sch=${payload.scheduleId}',
    );

    final now = DateTime.now();
    final scheduledAt = DateTime(now.year, now.month, now.day);

    final medResult = await _repository.getMedication(payload.medicationId);
    final profileUuid = switch (medResult) {
      Success(:final data) => data.profileUuid,
      _ => '',
    };

    final result = await _repository.logDose(
      DoseLogModel(
        uuid: now.microsecondsSinceEpoch.toString(),
        profileUuid: profileUuid,
        medicationUuid: payload.medicationId,
        scheduleUuid: payload.scheduleId,
        scheduledAt: scheduledAt,
        actionAt: now,
        status: DoseStatus.skipped,
        createdAt: now,
        updatedAt: now,
      ),
    );

    if (result case Failure(:final error)) {
      debugPrint('NotificationActionHandler — logDose(skipped) failed: $error');
    }

    return result;
  }

  // ── Snooze ─────────────────────────────────────────────────────────────

  Future<Result<int>> _handleSnooze(
    NotificationPayload payload,
    String actionId,
  ) async {
    final minutesStr = actionId.replaceFirst('snooze_', '');
    final minutes = int.tryParse(minutesStr);
    if (minutes == null) {
      debugPrint(
        'NotificationActionHandler — invalid snooze minutes: $actionId',
      );
      return Failure(UnknownError('Invalid snooze minutes: $actionId'));
    }

    debugPrint(
      'NotificationActionHandler — snooze ${minutes}m '
      'med=${payload.medicationId} sch=${payload.scheduleId}',
    );

    final now = DateTime.now();
    final scheduledAt = DateTime(now.year, now.month, now.day);

    final medResult = await _repository.getMedication(payload.medicationId);
    final profileUuid = switch (medResult) {
      Success(:final data) => data.profileUuid,
      _ => '',
    };

    // 1. Log the current dose as pending (will be re-checked later).
    final logResult = await _repository.logDose(
      DoseLogModel(
        uuid: now.microsecondsSinceEpoch.toString(),
        profileUuid: profileUuid,
        medicationUuid: payload.medicationId,
        scheduleUuid: payload.scheduleId,
        scheduledAt: scheduledAt,
        actionAt: now,
        status: DoseStatus.pending,
        createdAt: now,
        updatedAt: now,
      ),
    );

    if (logResult case Failure(:final error)) {
      debugPrint('NotificationActionHandler — logDose(snooze) failed: $error');
      return Failure(error);
    }

    // 2. Schedule a one-shot reminder after [minutes].
    return _scheduler.scheduleSnooze(
      medicationUuid: payload.medicationId,
      scheduleUuid: payload.scheduleId,
      snoozeMinutes: minutes,
    );
  }
}
