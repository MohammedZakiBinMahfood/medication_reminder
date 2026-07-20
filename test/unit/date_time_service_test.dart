import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/core/services/date_time_service.dart';

void main() {
  group('DateTimeService', () {
    group('startOfDay', () {
      test('returns date with time set to midnight', () {
        final input = DateTime(2026, 7, 19, 14, 30, 45, 123);
        final result = DateTimeService.startOfDay(input);
        expect(result, equals(DateTime(2026, 7, 19)));
      });
    });

    group('endOfDay', () {
      test('returns date with time set to 23:59:59.999', () {
        final input = DateTime(2026, 7, 19, 14, 30);
        final result = DateTimeService.endOfDay(input);
        expect(result, equals(DateTime(2026, 7, 19, 23, 59, 59, 999)));
      });
    });

    group('isSameDay', () {
      test('returns true for same date different times', () {
        final a = DateTime(2026, 7, 19, 8, 0);
        final b = DateTime(2026, 7, 19, 20, 0);
        expect(DateTimeService.isSameDay(a, b), isTrue);
      });

      test('returns true for identical dates', () {
        final a = DateTime(2026, 7, 19);
        final b = DateTime(2026, 7, 19);
        expect(DateTimeService.isSameDay(a, b), isTrue);
      });

      test('returns false for different dates', () {
        final a = DateTime(2026, 7, 19);
        final b = DateTime(2026, 7, 20);
        expect(DateTimeService.isSameDay(a, b), isFalse);
      });

      test('returns false for same day different month', () {
        final a = DateTime(2026, 6, 19);
        final b = DateTime(2026, 7, 19);
        expect(DateTimeService.isSameDay(a, b), isFalse);
      });
    });

    group('formatTime', () {
      test('formats time in default format (hh:mm a)', () {
        final time = DateTime(2026, 1, 1, 8, 30);
        final result = DateTimeService.formatTime(time);
        expect(result, equals('08:30 AM'));
      });

      test('formats time with custom pattern', () {
        final time = DateTime(2026, 1, 1, 14, 30);
        final result = DateTimeService.formatTime(time, pattern: 'HH:mm');
        expect(result, equals('14:30'));
      });
    });
  });
}
