import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/features/medications/medication_management/providers/medication_state_notifier.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';

void main() {
  late ProviderContainer container;
  late MedicationStateNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = container.read(medicationStateProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  group('MedicationStateNotifier', () {
    test('build returns empty state', () {
      final state = container.read(medicationStateProvider);
      expect(state.id, isNull);
      expect(state.name, isNull);
      expect(state.dosage, isNull);
      expect(state.priority, equals(MedicationPriority.low));
      expect(state.repeatType, equals(RepeatType.daily));
      expect(state.isActive, isTrue);
    });

    test('setName updates name', () {
      notifier.setName('Aspirin');
      expect(container.read(medicationStateProvider).name, equals('Aspirin'));
    });

    test('setDosage updates dosage', () {
      notifier.setDosage('100mg');
      expect(container.read(medicationStateProvider).dosage, equals('100mg'));
    });

    test('setPriority updates priority', () {
      notifier.setPriority(MedicationPriority.high);
      expect(
        container.read(medicationStateProvider).priority,
        equals(MedicationPriority.high),
      );
    });

    test('setRepeatType updates repeatType', () {
      notifier.setRepeatType(RepeatType.interval);
      expect(
        container.read(medicationStateProvider).repeatType,
        equals(RepeatType.interval),
      );
    });

    test('setWeekdays updates weekdays', () {
      notifier.setWeekdays([1, 3, 5]);
      expect(
        container.read(medicationStateProvider).weekdays,
        equals([1, 3, 5]),
      );
    });

    test('setInterval updates interval', () {
      notifier.setInterval(4);
      expect(container.read(medicationStateProvider).interval, equals(4));
    });

    test('setStartDate updates startDate', () {
      final date = DateTime(2026, 12, 25);
      notifier.setStartDate(date);
      expect(container.read(medicationStateProvider).startDate, equals(date));
    });

    test('setEndDate updates endDate', () {
      final date = DateTime(2026, 12, 31);
      notifier.setEndDate(date);
      expect(container.read(medicationStateProvider).endDate, equals(date));
    });

    test('setIsActive updates isActive', () {
      notifier.setIsActive(false);
      expect(container.read(medicationStateProvider).isActive, isFalse);
    });

    test('setColor updates color', () {
      notifier.setColor('#FF0000');
      expect(container.read(medicationStateProvider).color, equals('#FF0000'));
    });

    test('setId updates id', () {
      notifier.setId('test-id');
      expect(container.read(medicationStateProvider).id, equals('test-id'));
    });

    test('reset returns to empty state', () {
      notifier.setName('Aspirin');
      notifier.setDosage('100mg');
      notifier.reset();

      final state = container.read(medicationStateProvider);
      expect(state.name, isNull);
      expect(state.dosage, isNull);
      expect(state.priority, equals(MedicationPriority.low));
      expect(state.isActive, isTrue);
    });

    test('loadFromField populates state from MedicationField', () {
      final field = MedicationField(
        id: 'field-id',
        profileUuid: 'test-profile',
        name: 'Aspirin',
        dosage: '100mg',
        color: '#FF0000',
        priority: MedicationPriority.high,
        repeatType: RepeatType.specificDays,
        weekdays: [1, 3, 5],
        interval: 2,
        startDate: DateTime(2026),
        endDate: DateTime(2026, 12, 31),
        isActive: false,
      );

      notifier.loadFromField(field);

      final state = container.read(medicationStateProvider);
      expect(state.id, equals('field-id'));
      expect(state.name, equals('Aspirin'));
      expect(state.dosage, equals('100mg'));
      expect(state.color, equals('#FF0000'));
      expect(state.priority, equals(MedicationPriority.high));
      expect(state.repeatType, equals(RepeatType.specificDays));
      expect(state.weekdays, equals([1, 3, 5]));
      expect(state.interval, equals(2));
      expect(state.startDate, equals(DateTime(2026)));
      expect(state.endDate, equals(DateTime(2026, 12, 31)));
      expect(state.isActive, isFalse);
    });
  });
}
