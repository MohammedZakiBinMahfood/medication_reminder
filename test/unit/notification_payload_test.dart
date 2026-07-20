import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/core/notifications/notification_payload.dart';
import 'package:medication_reminder/core/notifications/notification_constants.dart';

void main() {
  group('NotificationPayload', () {
    const testPayload = NotificationPayload(
      medicationId: 'med-001',
      scheduleId: 'sch-001',
      notificationId: 12345,
      actionType: 'taken',
    );

    group('constructor', () {
      test('creates payload with all required fields', () {
        expect(testPayload.medicationId, equals('med-001'));
        expect(testPayload.scheduleId, equals('sch-001'));
        expect(testPayload.notificationId, equals(12345));
        expect(testPayload.actionType, equals('taken'));
      });
    });

    group('toJsonString / fromJsonString', () {
      test('roundtrips correctly', () {
        final json = testPayload.toJsonString();
        final parsed = NotificationPayload.fromJsonString(json);

        expect(parsed, isNotNull);
        expect(parsed!.medicationId, equals('med-001'));
        expect(parsed.scheduleId, equals('sch-001'));
        expect(parsed.notificationId, equals(12345));
        expect(parsed.actionType, equals('taken'));
      });

      test('toJsonString contains expected keys', () {
        final json = testPayload.toJsonString();
        expect(json, contains(NotificationConstants.payloadMedicationId));
        expect(json, contains(NotificationConstants.payloadScheduleId));
        expect(json, contains(NotificationConstants.payloadNotificationId));
        expect(json, contains(NotificationConstants.payloadActionType));
      });

      test('fromJsonString returns null for null input', () {
        expect(NotificationPayload.fromJsonString(null), isNull);
      });

      test('fromJsonString returns null for empty string', () {
        expect(NotificationPayload.fromJsonString(''), isNull);
      });

      test('fromJsonString returns null for malformed JSON', () {
        expect(NotificationPayload.fromJsonString('not json'), isNull);
      });

      test('fromJsonString returns null for missing required keys', () {
        expect(NotificationPayload.fromJsonString('{"key": "value"}'), isNull);
      });
    });

    group('withAction', () {
      test('creates new payload with different action type', () {
        final snoozePayload = testPayload.withAction('snooze_10');
        expect(snoozePayload.actionType, equals('snooze_10'));
        expect(snoozePayload.medicationId, equals('med-001'));
        expect(snoozePayload.scheduleId, equals('sch-001'));
        expect(snoozePayload.notificationId, equals(12345));
      });

      test('original payload is unchanged', () {
        testPayload.withAction('skipped');
        expect(testPayload.actionType, equals('taken'));
      });
    });

    group('equality', () {
      test('equal payloads are equal', () {
        const payload2 = NotificationPayload(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          notificationId: 12345,
          actionType: 'taken',
        );
        expect(testPayload, equals(payload2));
      });

      test('payloads with different medicationId are not equal', () {
        const other = NotificationPayload(
          medicationId: 'med-002',
          scheduleId: 'sch-001',
          notificationId: 12345,
          actionType: 'taken',
        );
        expect(testPayload, isNot(equals(other)));
      });

      test('payloads with different actionType are not equal', () {
        const other = NotificationPayload(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          notificationId: 12345,
          actionType: 'skipped',
        );
        expect(testPayload, isNot(equals(other)));
      });

      test('identical instances are identical', () {
        expect(identical(testPayload, testPayload), isTrue);
      });
    });

    group('hashCode', () {
      test('equal payloads have same hashCode', () {
        const payload2 = NotificationPayload(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          notificationId: 12345,
          actionType: 'taken',
        );
        expect(testPayload.hashCode, equals(payload2.hashCode));
      });
    });

    group('toString', () {
      test('returns descriptive string', () {
        final str = testPayload.toString();
        expect(str, contains('med-001'));
        expect(str, contains('sch-001'));
        expect(str, contains('12345'));
        expect(str, contains('taken'));
      });
    });
  });
}
