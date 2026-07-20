import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/core/notifications/notification_constants.dart';

void main() {
  group('NotificationConstants', () {
    test('maxPendingNotifications is 64 (iOS limit)', () {
      expect(NotificationConstants.maxPendingNotifications, equals(64));
    });

    test('maxIntervalNotifications is 10', () {
      expect(NotificationConstants.maxIntervalNotifications, equals(10));
    });

    test('snoozeOptions contains expected values', () {
      expect(NotificationConstants.snoozeOptions, equals([5, 10, 15, 30]));
    });

    test('action types are defined', () {
      expect(NotificationConstants.actionTaken, equals('taken'));
      expect(NotificationConstants.actionSkipped, equals('skipped'));
      expect(NotificationConstants.actionSnoozePrefix, equals('snooze_'));
      expect(NotificationConstants.actionOpenApp, equals('open_app'));
    });

    test('payload keys are defined', () {
      expect(NotificationConstants.payloadMedicationId, equals('medicationId'));
      expect(NotificationConstants.payloadScheduleId, equals('scheduleId'));
      expect(
        NotificationConstants.payloadNotificationId,
        equals('notificationId'),
      );
      expect(NotificationConstants.payloadActionType, equals('actionType'));
    });

    test('android channel constants are defined', () {
      expect(
        NotificationConstants.androidChannelId,
        equals('medication_reminders'),
      );
      expect(
        NotificationConstants.androidChannelName,
        equals('Medication Reminders'),
      );
      expect(NotificationConstants.androidChannelDescription, isNotEmpty);
    });
  });
}
