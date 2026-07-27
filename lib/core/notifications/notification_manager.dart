import 'package:app_platform_core/core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../features/medications/medication_management/models/enums/medication_enums.dart';
import 'notification_action_handler.dart';
import 'notification_boot_handler.dart';
import 'notification_permission_service.dart';
import 'notification_queue_manager.dart';
import 'notification_scheduler.dart';
import 'notification_service.dart';

/// Single public API for the notification engine.
///
/// Delegates to specialised services internally. Presentation layers and
/// business notifiers should only interact with this class.
///
/// ## Architecture
///
/// ```text
/// NotificationManager (this file)
///   ├── NotificationService        — low-level flutter_local_notifications wrapper
///   ├── NotificationPermissionService — permission handling
///   ├── NotificationScheduler      — scheduling orchestration
///   │     ├── NextOccurrenceCalculator — pure repeat-type logic
///   │     └── NotificationQueueManager — iOS 64-limit tracking
///   ├── NotificationActionHandler  — background action processing
///   └── NotificationBootHandler    — boot/resume lifecycle
/// ```
///
/// ## Error Handling
///
/// All public APIs return [Result<T>] to surface errors safely to callers.
/// Internal failures (repository reads, platform errors) are wrapped in
/// [Failure] with appropriate [AppError] types.
class NotificationManager {
  final NotificationService _service;
  final NotificationPermissionService _permissions;
  final NotificationScheduler _scheduler;
  final NotificationActionHandler _actionHandler;
  final NotificationBootHandler _bootHandler;
  final NotificationQueueManager _queueManager;

  NotificationManager({
    required this._service,
    required this._permissions,
    required this._scheduler,
    required this._actionHandler,
    required this._bootHandler,
    required this._queueManager,
  });

  // ── Lifecycle ──────────────────────────────────────────────────────────

  /// Initialise the notification plugin and register the action callback.
  ///
  /// Returns [Success] on completion, or [Failure] if init fails.
  Future<Result<void>> initialize() async {
    try {
      _service.onActionReceived = _actionHandler.handleNotificationResponse;
      await _service.init();
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError('Failed to initialise notifications: $e'));
    }
  }

  /// Request notification permissions on the current platform.
  ///
  /// Returns [Success] with the permission result, or [Failure].
  Future<Result<bool>> requestPermissions() async {
    try {
      final granted = await _permissions.request();
      return Success(granted);
    } catch (e) {
      return Failure(UnknownError('Failed to request permissions: $e'));
    }
  }

  /// Whether notification permission is currently granted.
  Future<Result<bool>> get isPermissionGranted async {
    try {
      final granted = await _permissions.isGranted;
      return Success(granted);
    } catch (e) {
      return Failure(UnknownError('Failed to check permissions: $e'));
    }
  }

  // ── Per-medication ─────────────────────────────────────────────────────

  /// Schedule all notifications for a medication.
  ///
  /// Returns [Success] with the count of scheduled notifications.
  Future<Result<int>> scheduleMedication(String medicationUuid) =>
      _scheduler.scheduleForMedication(medicationUuid);

  /// Cancel all notifications for a medication.
  Future<Result<void>> cancelMedication(String medicationUuid) =>
      _scheduler.cancelForMedication(medicationUuid);

  /// Cancel a single schedule's notification.
  Future<Result<void>> cancelSchedule(
    String scheduleUuid,
    RepeatType repeatType,
    List<int> weekdays,
  ) => _scheduler.cancelSchedule(scheduleUuid, repeatType, weekdays);

  /// Cancel all notifications across the entire app.
  Future<Result<void>> cancelAll() async {
    try {
      await _service.cancelAll();
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError('Failed to cancel all notifications: $e'));
    }
  }

  // ── Reschedule ─────────────────────────────────────────────────────────

  /// Reschedule notifications for a single medication.
  Future<Result<int>> rescheduleMedication(String medicationUuid) =>
      _scheduler.rescheduleForMedication(medicationUuid);

  /// Cancel + re-schedule every active medication.
  ///
  /// Use after timezone changes, device boot, or app resume.
  /// Includes idempotency guard — concurrent calls are safely skipped.
  Future<Result<int>> rescheduleAll() => _scheduler.rescheduleAll();

  // ── Snooze ─────────────────────────────────────────────────────────────

  /// Schedule a one-time snooze notification.
  Future<Result<int>> scheduleSnooze({
    required String medicationUuid,
    required String scheduleUuid,
    required int snoozeMinutes,
  }) => _scheduler.scheduleSnooze(
    medicationUuid: medicationUuid,
    scheduleUuid: scheduleUuid,
    snoozeMinutes: snoozeMinutes,
  );

  /// Cancel a specific snooze notification.
  Future<Result<void>> cancelSnooze(String scheduleUuid, int snoozeMinutes) =>
      _scheduler.cancelSnooze(scheduleUuid, snoozeMinutes);

  // ── Boot & Resume ──────────────────────────────────────────────────────

  /// Called when device boots (Android).
  Future<Result<void>> onBootCompleted() => _bootHandler.onBootCompleted();

  /// Called when the app resumes from background.
  Future<Result<void>> onAppResumed() => _bootHandler.onAppResumed();

  // ── Queue info ─────────────────────────────────────────────────────────

  /// Current count of pending (scheduled) notifications.
  Future<Result<int>> get pendingCount async {
    try {
      final count = await _queueManager.pendingCount;
      return Success(count);
    } catch (e) {
      return Failure(UnknownError('Failed to get pending count: $e'));
    }
  }

  /// Number of available notification slots remaining.
  Future<Result<int>> get availableSlots async {
    try {
      final slots = await _queueManager.availableSlots;
      return Success(slots);
    } catch (e) {
      return Failure(UnknownError('Failed to get available slots: $e'));
    }
  }

  // ── Exact Alarm ─────────────────────────────────────────────────────────

  Future<bool> canScheduleExactNotifications() async {
    try {
      final android = _service.plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      return await android?.canScheduleExactNotifications() ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<void> requestExactAlarmsPermission() async {
    try {
      final android = _service.plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      await android?.requestExactAlarmsPermission();
    } catch (_) {}
  }
}
