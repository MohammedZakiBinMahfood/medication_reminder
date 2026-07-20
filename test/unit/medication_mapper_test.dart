import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/features/medications/medication_management/data/mappers/medication_mapper.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';

void main() {
  group('MedicationMapper', () {
    group('priorityFromInt', () {
      test('maps 0 to low', () {
        expect(
          MedicationMapper.priorityFromInt(0),
          equals(MedicationPriority.low),
        );
      });

      test('maps 1 to medium', () {
        expect(
          MedicationMapper.priorityFromInt(1),
          equals(MedicationPriority.medium),
        );
      });

      test('maps 2 to high', () {
        expect(
          MedicationMapper.priorityFromInt(2),
          equals(MedicationPriority.high),
        );
      });

      test('clamps out-of-range low to low', () {
        expect(
          MedicationMapper.priorityFromInt(-1),
          equals(MedicationPriority.low),
        );
      });

      test('clamps out-of-range high to high', () {
        expect(
          MedicationMapper.priorityFromInt(10),
          equals(MedicationPriority.high),
        );
      });
    });

    group('repeatTypeFromInt', () {
      test('maps 0 to daily', () {
        expect(MedicationMapper.repeatTypeFromInt(0), equals(RepeatType.daily));
      });

      test('maps 1 to specificDays', () {
        expect(
          MedicationMapper.repeatTypeFromInt(1),
          equals(RepeatType.specificDays),
        );
      });

      test('maps 2 to asNeeded', () {
        expect(
          MedicationMapper.repeatTypeFromInt(2),
          equals(RepeatType.asNeeded),
        );
      });

      test('maps 3 to interval', () {
        expect(
          MedicationMapper.repeatTypeFromInt(3),
          equals(RepeatType.interval),
        );
      });

      test('clamps out-of-range to bounds', () {
        expect(
          MedicationMapper.repeatTypeFromInt(-5),
          equals(RepeatType.daily),
        );
        expect(
          MedicationMapper.repeatTypeFromInt(100),
          equals(RepeatType.interval),
        );
      });
    });

    group('doseStatusFromInt', () {
      test('maps all values correctly', () {
        expect(
          MedicationMapper.doseStatusFromInt(0),
          equals(DoseStatus.pending),
        );
        expect(MedicationMapper.doseStatusFromInt(1), equals(DoseStatus.taken));
        expect(
          MedicationMapper.doseStatusFromInt(2),
          equals(DoseStatus.skipped),
        );
        expect(
          MedicationMapper.doseStatusFromInt(3),
          equals(DoseStatus.missed),
        );
      });

      test('clamps out-of-range values', () {
        expect(
          MedicationMapper.doseStatusFromInt(-1),
          equals(DoseStatus.pending),
        );
        expect(
          MedicationMapper.doseStatusFromInt(10),
          equals(DoseStatus.missed),
        );
      });
    });

    group('toCollection / toDomain roundtrip', () {
      test('preserves all fields through roundtrip', () {
        final now = DateTime(2026, 7, 19);
        final model = MedicationModel(
          uuid: 'test-uuid',
          name: 'Aspirin',
          dosage: '100mg',
          color: '#FF000000',
          priority: MedicationPriority.high,
          isActive: true,
          createdAt: now,
          updatedAt: now,
        );

        final collection = MedicationMapper.toCollection(model, isarId: 1);
        final restored = MedicationMapper.toDomain(collection);

        expect(restored.uuid, equals(model.uuid));
        expect(restored.name, equals(model.name));
        expect(restored.dosage, equals(model.dosage));
        expect(restored.color, equals(model.color));
        expect(restored.priority, equals(model.priority));
        expect(restored.isActive, equals(model.isActive));
      });

      test('sets isDeleted to false in collection', () {
        final model = MedicationModel(
          uuid: 'test-uuid',
          name: 'Aspirin',
          dosage: '100mg',
          color: '#FF000000',
          priority: MedicationPriority.low,
          isActive: true,
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026),
        );

        final collection = MedicationMapper.toCollection(model);
        expect(collection.isDeleted, isFalse);
      });

      test('preserves isarId', () {
        final model = MedicationModel(
          uuid: 'test-uuid',
          name: 'Aspirin',
          dosage: '100mg',
          color: '#FF000000',
          priority: MedicationPriority.low,
          isActive: true,
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026),
        );

        final collection = MedicationMapper.toCollection(model, isarId: 42);
        expect(collection.id, equals(42));
      });
    });

    group('toFieldWithSchedule', () {
      test('creates MedicationField from model and schedule', () {
        final medication = MedicationModel(
          uuid: 'med-uuid',
          name: 'Aspirin',
          dosage: '100mg',
          color: '#FF000000',
          priority: MedicationPriority.high,
          isActive: true,
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026),
        );

        final schedule = MedicationScheduleModel(
          uuid: 'sch-uuid',
          medicationUuid: 'med-uuid',
          minutesFromMidnight: 480,
          repeatType: RepeatType.specificDays,
          weekdays: [1, 3, 5],
          interval: 2,
          startDate: DateTime(2026, 1, 1),
          endDate: DateTime(2026, 12, 31),
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026),
        );

        final field = MedicationMapper.toFieldWithSchedule(
          medication,
          schedule,
        );

        expect(field.id, equals('med-uuid'));
        expect(field.name, equals('Aspirin'));
        expect(field.priority, equals(MedicationPriority.high));
        expect(field.repeatType, equals(RepeatType.specificDays));
        expect(field.weekdays, equals([1, 3, 5]));
        expect(field.interval, equals(2));
        expect(field.startDate, equals(DateTime(2026, 1, 1)));
        expect(field.endDate, equals(DateTime(2026, 12, 31)));
        expect(field.isActive, isTrue);
      });

      test('uses defaults when schedule is null', () {
        final medication = MedicationModel(
          uuid: 'med-uuid',
          name: 'Aspirin',
          dosage: '100mg',
          color: '#FF000000',
          priority: MedicationPriority.medium,
          isActive: false,
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026),
        );

        final field = MedicationMapper.toFieldWithSchedule(medication, null);

        expect(field.repeatType, equals(RepeatType.daily));
        expect(field.weekdays, isEmpty);
        expect(field.interval, equals(1));
        expect(field.startDate, equals(medication.createdAt));
        expect(field.endDate, isNull);
        expect(field.isActive, isFalse);
      });
    });
  });
}
