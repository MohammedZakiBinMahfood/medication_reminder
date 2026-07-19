/// Central constants for the notification engine.
///
/// No business logic, no imports — pure values.
class NotificationConstants {
  NotificationConstants._();

  // ── Android channel ──────────────────────────────────────────────────
  static const String androidChannelId = 'medication_reminders';
  static const String androidChannelName = 'Medication Reminders';
  static const String androidChannelDescription =
      'Reminders for taking your medications';

  // ── Action types (payload actionType values) ─────────────────────────
  static const String actionTaken = 'taken';
  static const String actionSkipped = 'skipped';
  static const String actionSnoozePrefix = 'snooze_'; // + minutes
  static const String actionOpenApp = 'open_app';

  // ── Payload keys ─────────────────────────────────────────────────────
  static const String payloadMedicationId = 'medicationId';
  static const String payloadScheduleId = 'scheduleId';
  static const String payloadNotificationId = 'notificationId';
  static const String payloadActionType = 'actionType';

  // ── iOS 64-notification limit ────────────────────────────────────────
  static const int maxPendingNotifications = 64;
  static const int maxIntervalNotifications =
      10; // Max interval occurrences to pre-schedule

  // ── Snooze options (minutes) ─────────────────────────────────────────
  static const List<int> snoozeOptions = [5, 10, 15, 30];

  // ── Android boot receiver ────────────────────────────────────────────
  static const String bootAction = 'android.intent.action.BOOT_COMPLETED';
}
