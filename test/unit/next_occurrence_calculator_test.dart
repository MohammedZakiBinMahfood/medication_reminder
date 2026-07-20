import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:medication_reminder/core/notifications/next_occurrence_calculator.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';

void main() {
  late NextOccurrenceCalculator calculator;

  setUpAll(() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('UTC'));
  });

  setUp(() {
    calculator = NextOccurrenceCalculator();
  });

  MedicationScheduleModel _dailySchedule({
    int minutesFromMidnight = 480,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return MedicationScheduleModel(
      uuid: 'sch-001',
      medicationUuid: 'med-001',
      minutesFromMidnight: minutesFromMidnight,
      repeatType: RepeatType.daily,
      weekdays: const [],
      interval: 1,
      startDate: startDate ?? DateTime(2026, 1, 1),
      endDate: endDate,
      createdAt: DateTime(2026),
      updatedAt: DateTime(2026),
    );
  }

  MedicationScheduleModel _intervalSchedule({
    int intervalHours = 4,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return MedicationScheduleModel(
      uuid: 'sch-003',
      medicationUuid: 'med-001',
      minutesFromMidnight: 0,
      repeatType: RepeatType.interval,
      weekdays: const [],
      interval: intervalHours,
      startDate: startDate ?? DateTime(2026, 7, 19, 8, 0),
      endDate: endDate,
      createdAt: DateTime(2026),
      updatedAt: DateTime(2026),
    );
  }

  MedicationScheduleModel _asNeededSchedule() {
    return MedicationScheduleModel(
      uuid: 'sch-004',
      medicationUuid: 'med-001',
      minutesFromMidnight: 0,
      repeatType: RepeatType.asNeeded,
      weekdays: const [],
      interval: 1,
      startDate: DateTime(2026),
      createdAt: DateTime(2026),
      updatedAt: DateTime(2026),
    );
  }

  group('NextOccurrenceCalculator', () {
    group('nextOccurrence', () {
      test('daily schedule returns future occurrence', () {
        final schedule = _dailySchedule(minutesFromMidnight: 480);
        final result = calculator.nextOccurrence(schedule);
        expect(result, isNotNull);
        expect(result!.hour, equals(8));
        expect(result.minute, equals(0));
      });

      test('asNeeded returns null', () {
        final schedule = _asNeededSchedule();
        final result = calculator.nextOccurrence(schedule);
        expect(result, isNull);
      });

      test('expired schedule returns null', () {
        final schedule = _dailySchedule(endDate: DateTime(2020, 1, 1));
        final result = calculator.nextOccurrence(schedule);
        expect(result, isNull);
      });

      test('schedule with no endDate is never expired', () {
        final schedule = _dailySchedule(endDate: null);
        final result = calculator.nextOccurrence(schedule);
        expect(result, isNotNull);
      });
    });

    group('upcomingOccurrences', () {
      test('asNeeded returns empty list', () {
        final schedule = _asNeededSchedule();
        final results = calculator.upcomingOccurrences(schedule);
        expect(results, isEmpty);
      });

      test('daily returns at most one occurrence', () {
        final schedule = _dailySchedule();
        final results = calculator.upcomingOccurrences(schedule);
        expect(results.length, lessThanOrEqualTo(1));
      });

      test('interval returns up to maxCount occurrences', () {
        final schedule = _intervalSchedule(intervalHours: 4);
        final results = calculator.upcomingOccurrences(schedule, maxCount: 3);
        expect(results.length, lessThanOrEqualTo(3));
        expect(results.length, greaterThanOrEqualTo(1));
      });

      test('expired schedule returns empty list', () {
        final schedule = _dailySchedule(endDate: DateTime(2020, 1, 1));
        final results = calculator.upcomingOccurrences(schedule);
        expect(results, isEmpty);
      });
    });

    group('generateNotificationId', () {
      test('returns non-negative integer', () {
        final id = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
        );
        expect(id, greaterThanOrEqualTo(0));
      });

      test('same inputs produce same ID', () {
        final id1 = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
        );
        final id2 = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
        );
        expect(id1, equals(id2));
      });

      test('different dates produce different IDs', () {
        final id1 = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
        );
        final id2 = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 20),
        );
        expect(id1, isNot(equals(id2)));
      });

      test('with weekday produces different ID', () {
        final withoutWeekday = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
        );
        final withWeekday = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
          weekday: 1,
        );
        expect(withoutWeekday, isNot(equals(withWeekday)));
      });

      test('ID fits in 31-bit positive integer range', () {
        final id = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
        );
        expect(id, greaterThanOrEqualTo(0));
        expect(id, lessThanOrEqualTo(0x7FFFFFFF));
      });
    });

    group('generateSnoozeId', () {
      test('returns non-negative integer', () {
        final id = NextOccurrenceCalculator.generateSnoozeId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
          snoozeMinutes: 10,
        );
        expect(id, greaterThanOrEqualTo(0));
      });

      test('different snooze minutes produce different IDs', () {
        final id1 = NextOccurrenceCalculator.generateSnoozeId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
          snoozeMinutes: 5,
        );
        final id2 = NextOccurrenceCalculator.generateSnoozeId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
          snoozeMinutes: 10,
        );
        expect(id1, isNot(equals(id2)));
      });

      test('snooze ID differs from regular notification ID', () {
        final regularId = NextOccurrenceCalculator.generateNotificationId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
        );
        final snoozeId = NextOccurrenceCalculator.generateSnoozeId(
          medicationId: 'med-001',
          scheduleId: 'sch-001',
          occurrenceDate: DateTime(2026, 7, 19),
          snoozeMinutes: 10,
        );
        expect(regularId, isNot(equals(snoozeId)));
      });
    });
  });
}
