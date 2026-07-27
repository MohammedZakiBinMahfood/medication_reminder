/// Central constants for the notification engine.
///
/// No business logic, no imports — pure values.
class NotificationConstants {
  NotificationConstants._();

  // ── Android channels ──────────────────────────────────────────────────
  static const String androidChannelId = 'medication_reminders';
  static const String androidChannelName = 'Medication Reminders';
  static const String androidChannelDescription =
      'Reminders for taking your medications';

  static const String androidCriticalChannelId =
      'critical_medication_reminders';
  static const String androidCriticalChannelName = 'Critical Medication Alarms';
  static const String androidCriticalChannelDescription =
      'High priority alarm reminders for vital medications';

  // ── Categories ──────────────────────────────────────────────────────────
  static const String categoryMedicationReminder =
      'medication_reminder_category';

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
