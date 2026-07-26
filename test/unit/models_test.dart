import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';

void main() {
  group('MedicationModel', () {
    test('creates with all required fields', () {
      final model = MedicationModel(
        uuid: 'test-uuid',
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.high,
        isActive: true,
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      expect(model.uuid, equals('test-uuid'));
      expect(model.name, equals('Aspirin'));
      expect(model.dosage, equals('100mg'));
      expect(model.color, equals('#FF000000'));
      expect(model.priority, equals(MedicationPriority.high));
      expect(model.isActive, isTrue);
    });

    test('copyWith creates modified copy', () {
      final original = MedicationModel(
        uuid: 'test-uuid',
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.low,
        isActive: true,
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      final modified = original.copyWith(name: 'Ibuprofen', dosage: '200mg');
      expect(modified.name, equals('Ibuprofen'));
      expect(modified.dosage, equals('200mg'));
      expect(modified.uuid, equals('test-uuid'));
      expect(modified.priority, equals(MedicationPriority.low));
    });

    test('equality works correctly', () {
      final a = MedicationModel(
        uuid: 'test-uuid',
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.medium,
        isActive: true,
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      final b = MedicationModel(
        uuid: 'test-uuid',
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.medium,
        isActive: true,
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      expect(a, equals(b));
    });

    test('fromJson/fromMappable roundtrips', () {
      final original = MedicationModel(
        uuid: 'test-uuid',
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.high,
        isActive: true,
        createdAt: DateTime(2026, 1, 1),
        updatedAt: DateTime(2026, 1, 2),
      );

      final json = original.toJson();
      final restored = MedicationModelMapper.fromJson(json);

      expect(restored.uuid, equals(original.uuid));
      expect(restored.name, equals(original.name));
      expect(restored.dosage, equals(original.dosage));
      expect(restored.color, equals(original.color));
      expect(restored.priority, equals(original.priority));
      expect(restored.isActive, equals(original.isActive));
    });
  });

  group('MedicationScheduleModel', () {
    test('creates with all required fields', () {
      final model = MedicationScheduleModel(
        uuid: 'sch-uuid',
        profileUuid: 'test-profile',
        medicationUuid: 'med-uuid',
        minutesFromMidnight: 480,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      expect(model.uuid, equals('sch-uuid'));
      expect(model.medicationUuid, equals('med-uuid'));
      expect(model.minutesFromMidnight, equals(480));
      expect(model.repeatType, equals(RepeatType.daily));
    });

    test('formattedTime returns correct format', () {
      final model = MedicationScheduleModel(
        uuid: 'sch-uuid',
        profileUuid: 'test-profile',
        medicationUuid: 'med-uuid',
        minutesFromMidnight: 480,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );
      expect(model.formattedTime, equals('08:00'));
    });

    test('formattedTime pads single digits', () {
      final model = MedicationScheduleModel(
        uuid: 'sch-uuid',
        profileUuid: 'test-profile',
        medicationUuid: 'med-uuid',
        minutesFromMidnight: 65,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );
      expect(model.formattedTime, equals('01:05'));
    });

    test('formattedTime at midnight', () {
      final model = MedicationScheduleModel(
        uuid: 'sch-uuid',
        profileUuid: 'test-profile',
        medicationUuid: 'med-uuid',
        minutesFromMidnight: 0,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );
      expect(model.formattedTime, equals('00:00'));
    });

    test('formattedTime at end of day', () {
      final model = MedicationScheduleModel(
        uuid: 'sch-uuid',
        profileUuid: 'test-profile',
        medicationUuid: 'med-uuid',
        minutesFromMidnight: 1380,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );
      expect(model.formattedTime, equals('23:00'));
    });

    test('copyWith creates modified copy', () {
      final original = MedicationScheduleModel(
        uuid: 'sch-uuid',
        profileUuid: 'test-profile',
        medicationUuid: 'med-uuid',
        minutesFromMidnight: 480,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      final modified = original.copyWith(minutesFromMidnight: 600);
      expect(modified.minutesFromMidnight, equals(600));
      expect(modified.uuid, equals('sch-uuid'));
    });
  });

  group('DoseLogModel', () {
    test('creates with all required fields', () {
      final model = DoseLogModel(
        uuid: 'log-uuid',
        profileUuid: 'test-profile',
        medicationUuid: 'med-uuid',
        scheduleUuid: 'sch-uuid',
        scheduledAt: DateTime(2026),
        status: DoseStatus.pending,
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      expect(model.uuid, equals('log-uuid'));
      expect(model.status, equals(DoseStatus.pending));
      expect(model.actionAt, isNull);
    });

    test('creates with optional actionAt', () {
      final now = DateTime(2026);
      final model = DoseLogModel(
        uuid: 'log-uuid',
        profileUuid: 'test-profile',
        medicationUuid: 'med-uuid',
        scheduleUuid: 'sch-uuid',
        scheduledAt: DateTime(2026),
        actionAt: now,
        status: DoseStatus.taken,
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      expect(model.actionAt, equals(now));
      expect(model.status, equals(DoseStatus.taken));
    });
  });

  group('MedicationStateModel', () {
    test('empty() creates default state', () {
      final state = MedicationStateModel.empty();
      expect(state.id, isNull);
      expect(state.name, isNull);
      expect(state.dosage, isNull);
      expect(state.color, isNull);
      expect(state.priority, equals(MedicationPriority.low));
      expect(state.repeatType, equals(RepeatType.daily));
      expect(state.weekdays, isEmpty);
      expect(state.interval, equals(1));
      expect(state.startDate, isNull);
      expect(state.endDate, isNull);
      expect(state.isActive, isTrue);
    });

    test('copyWith creates modified copy', () {
      final original = MedicationStateModel.empty();
      final modified = original.copyWith(
        name: 'Test Med',
        dosage: '10mg',
        priority: MedicationPriority.high,
      );
      expect(modified.name, equals('Test Med'));
      expect(modified.dosage, equals('10mg'));
      expect(modified.priority, equals(MedicationPriority.high));
      expect(modified.repeatType, equals(RepeatType.daily));
    });

    test('copyWith with default params preserves existing values', () {
      final original = MedicationStateModel(
        name: 'Test',
        dosage: '10mg',
        priority: MedicationPriority.medium,
      );
      final modified = original.copyWith(dosage: '20mg');
      expect(modified.name, equals('Test'));
      expect(modified.dosage, equals('20mg'));
    });
  });

  group('MedicationListModel', () {
    test('creates with all required fields', () {
      final model = MedicationListModel(
        id: 'test-id',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.high,
        isActive: true,
      );

      expect(model.id, equals('test-id'));
      expect(model.name, equals('Aspirin'));
      expect(model.nextDoseTime, isNull);
    });

    test('copyWith with nextDoseTime', () {
      final model = MedicationListModel(
        id: 'test-id',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.high,
        isActive: true,
      );

      final nextTime = DateTime(2026, 7, 19, 8, 0);
      final modified = model.copyWith(nextDoseTime: nextTime);
      expect(modified.nextDoseTime, equals(nextTime));
    });
  });

  group('MedicationField', () {
    test('creates with all required fields', () {
      final field = MedicationField(
        id: 'test-id',
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.medium,
        repeatType: RepeatType.specificDays,
        weekdays: [1, 3, 5],
        interval: 1,
        startDate: DateTime(2026),
        isActive: true,
      );

      expect(field.id, equals('test-id'));
      expect(field.weekdays, equals([1, 3, 5]));
      expect(field.repeatType, equals(RepeatType.specificDays));
    });
  });

  group('MedicationScheduleListModel', () {
    test('formattedTime works correctly', () {
      final model = MedicationScheduleListModel(
        id: 'id',
        medicationUuid: 'med-id',
        minutesFromMidnight: 900,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
      );
      expect(model.formattedTime, equals('15:00'));
    });
  });

  group('MedicationAddModel', () {
    test('creates with all required fields', () {
      final model = MedicationAddModel(
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.medium,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
        isActive: true,
      );

      expect(model.name, equals('Aspirin'));
      expect(model.endDate, isNull);
    });
  });

  group('MedicationEditModel', () {
    test('creates with all required fields including id', () {
      final model = MedicationEditModel(
        id: 'edit-id',
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF000000',
        priority: MedicationPriority.medium,
        repeatType: RepeatType.daily,
        weekdays: [],
        interval: 1,
        startDate: DateTime(2026),
        isActive: true,
      );

      expect(model.id, equals('edit-id'));
    });
  });

  group('MedicationPriority enum', () {
    test('has correct values', () {
      expect(MedicationPriority.values.length, equals(3));
      expect(MedicationPriority.values[0], equals(MedicationPriority.low));
      expect(MedicationPriority.values[1], equals(MedicationPriority.medium));
      expect(MedicationPriority.values[2], equals(MedicationPriority.high));
    });
  });

  group('RepeatType enum', () {
    test('has correct values', () {
      expect(RepeatType.values.length, equals(4));
      expect(RepeatType.values[0], equals(RepeatType.daily));
      expect(RepeatType.values[1], equals(RepeatType.specificDays));
      expect(RepeatType.values[2], equals(RepeatType.asNeeded));
      expect(RepeatType.values[3], equals(RepeatType.interval));
    });
  });

  group('DoseStatus enum', () {
    test('has correct values', () {
      expect(DoseStatus.values.length, equals(4));
      expect(DoseStatus.values[0], equals(DoseStatus.pending));
      expect(DoseStatus.values[1], equals(DoseStatus.taken));
      expect(DoseStatus.values[2], equals(DoseStatus.skipped));
      expect(DoseStatus.values[3], equals(DoseStatus.missed));
    });
  });
}
