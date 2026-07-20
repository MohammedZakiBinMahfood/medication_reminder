import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/features/medications/medication_management/models/enums/medication_enums.dart';

void main() {
  group('MedicationEnums dart_mappable serialization', () {
    group('MedicationPriority', () {
      test('toValue/fromValue roundtrip for low', () {
        final json = MedicationPriority.low.toValue();
        final restored = MedicationPriorityMapper.fromValue(json);
        expect(restored, equals(MedicationPriority.low));
      });

      test('toValue/fromValue roundtrip for medium', () {
        final json = MedicationPriority.medium.toValue();
        final restored = MedicationPriorityMapper.fromValue(json);
        expect(restored, equals(MedicationPriority.medium));
      });

      test('toValue/fromValue roundtrip for high', () {
        final json = MedicationPriority.high.toValue();
        final restored = MedicationPriorityMapper.fromValue(json);
        expect(restored, equals(MedicationPriority.high));
      });

      test('index values are correct', () {
        expect(MedicationPriority.low.index, equals(0));
        expect(MedicationPriority.medium.index, equals(1));
        expect(MedicationPriority.high.index, equals(2));
      });
    });

    group('RepeatType', () {
      test('toValue/fromValue roundtrip for all values', () {
        for (final value in RepeatType.values) {
          final json = value.toValue();
          final restored = RepeatTypeMapper.fromValue(json);
          expect(restored, equals(value));
        }
      });

      test('index values are correct', () {
        expect(RepeatType.daily.index, equals(0));
        expect(RepeatType.specificDays.index, equals(1));
        expect(RepeatType.asNeeded.index, equals(2));
        expect(RepeatType.interval.index, equals(3));
      });
    });

    group('DoseStatus', () {
      test('toValue/fromValue roundtrip for all values', () {
        for (final value in DoseStatus.values) {
          final json = value.toValue();
          final restored = DoseStatusMapper.fromValue(json);
          expect(restored, equals(value));
        }
      });

      test('index values are correct', () {
        expect(DoseStatus.pending.index, equals(0));
        expect(DoseStatus.taken.index, equals(1));
        expect(DoseStatus.skipped.index, equals(2));
        expect(DoseStatus.missed.index, equals(3));
      });
    });
  });
}
