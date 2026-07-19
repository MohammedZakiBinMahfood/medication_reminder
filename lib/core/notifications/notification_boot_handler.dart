import 'package:app_platform_core/core.dart';
import 'package:flutter/foundation.dart';

import 'notification_service.dart';
import 'notification_scheduler.dart';

/// Handles device boot events by re-initialising notifications and
/// rescheduling all active medication reminders.
///
/// On Android, register the companion `BootReceiver` in the manifest
/// to invoke [onBootCompleted] when `BOOT_COMPLETED` fires.
///
/// ## Lifecycle Safety
///
/// Both [onBootCompleted] and [onAppResumed] delegate to
/// [NotificationScheduler.rescheduleAll] which includes an idempotency
/// guard — concurrent calls are safely skipped.
class NotificationBootHandler {
  final NotificationService _service;
  final NotificationScheduler _scheduler;

  NotificationBootHandler({required this._service, required this._scheduler});

  /// Called when the device finishes booting.
  ///
  /// Ensures the notification plugin is initialised, then re-schedules
  /// every active medication notification.
  Future<Result<void>> onBootCompleted() async {
    debugPrint('NotificationBootHandler — boot completed');

    try {
      if (!_service.isInitialised) {
        await _service.init();
      }

      final result = await _scheduler.rescheduleAll();
      if (result case Failure(:final error)) {
        return Failure(error);
      }
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError('Boot handler failed: $e'));
    }
  }

  /// Called on app resume to handle timezone changes while the app was
  /// backgrounded.  Reschedules everything using the current timezone.
  Future<Result<void>> onAppResumed() async {
    debugPrint('NotificationBootHandler — app resumed, rescheduling');

    try {
      final result = await _scheduler.rescheduleAll();
      if (result case Failure(:final error)) {
        return Failure(error);
      }
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError('App resume handler failed: $e'));
    }
  }
}
