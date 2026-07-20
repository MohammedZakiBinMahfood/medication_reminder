import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/core/utils/validators.dart';

void main() {
  group('Validators.requiredString', () {
    test('returns null for valid non-empty string', () {
      expect(Validators.requiredString('hello'), isNull);
    });

    test('returns null for string with leading/trailing spaces', () {
      expect(Validators.requiredString('  hello  '), isNull);
    });

    test('returns error message for null', () {
      expect(Validators.requiredString(null), equals('This field is required'));
    });

    test('returns error message for empty string', () {
      expect(Validators.requiredString(''), equals('This field is required'));
    });

    test('returns error message for whitespace-only string', () {
      expect(
        Validators.requiredString('   '),
        equals('This field is required'),
      );
    });

    test('returns custom message when provided', () {
      expect(
        Validators.requiredString(null, message: 'Custom error'),
        equals('Custom error'),
      );
    });
  });

  group('Validators.requiredList', () {
    test('returns null for non-empty list', () {
      expect(Validators.requiredList([1, 2, 3]), isNull);
    });

    test('returns error message for null', () {
      expect(
        Validators.requiredList(null),
        equals('Please select at least one item'),
      );
    });

    test('returns error message for empty list', () {
      expect(
        Validators.requiredList([]),
        equals('Please select at least one item'),
      );
    });

    test('returns custom message when provided', () {
      expect(
        Validators.requiredList(null, message: 'Select items'),
        equals('Select items'),
      );
    });
  });

  group('Validators.positiveNumber', () {
    test('returns null for positive number string', () {
      expect(Validators.positiveNumber('10'), isNull);
      expect(Validators.positiveNumber('0.5'), isNull);
      expect(Validators.positiveNumber('100'), isNull);
    });

    test('returns error for null', () {
      expect(Validators.positiveNumber(null), equals('This field is required'));
    });

    test('returns error for empty string', () {
      expect(Validators.positiveNumber(''), equals('This field is required'));
    });

    test('returns error for zero', () {
      expect(
        Validators.positiveNumber('0'),
        equals('Must be a positive number'),
      );
    });

    test('returns error for negative number', () {
      expect(
        Validators.positiveNumber('-5'),
        equals('Must be a positive number'),
      );
    });

    test('returns error for non-numeric string', () {
      expect(
        Validators.positiveNumber('abc'),
        equals('Must be a positive number'),
      );
    });

    test('returns custom message when provided', () {
      expect(
        Validators.positiveNumber('0', message: 'Must be > 0'),
        equals('Must be > 0'),
      );
    });
  });

  group('Validators.timeRequired', () {
    test('returns null for non-empty time string', () {
      expect(Validators.timeRequired('08:00'), isNull);
      expect(Validators.timeRequired('12:30 PM'), isNull);
    });

    test('returns error message for null', () {
      expect(Validators.timeRequired(null), equals('Time is required'));
    });

    test('returns error message for empty string', () {
      expect(Validators.timeRequired(''), equals('Time is required'));
    });

    test('returns custom message when provided', () {
      expect(
        Validators.timeRequired(null, message: 'Pick a time'),
        equals('Pick a time'),
      );
    });
  });

  group('Validators.dateRequired', () {
    test('returns null for valid date', () {
      expect(Validators.dateRequired(DateTime(2026, 1, 1)), isNull);
    });

    test('returns error message for null', () {
      expect(Validators.dateRequired(null), equals('Date is required'));
    });

    test('returns custom message when provided', () {
      expect(
        Validators.dateRequired(null, message: 'Pick a date'),
        equals('Pick a date'),
      );
    });
  });
}
