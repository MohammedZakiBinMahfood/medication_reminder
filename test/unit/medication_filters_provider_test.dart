import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/features/medications/medication_management/providers/medication_filters_provider.dart';
import 'package:medication_reminder/features/medications/medication_management/repositories/medication_filters.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';
import 'package:medication_reminder/core/constants/enums.dart';

void main() {
  late ProviderContainer container;
  late MedicationFiltersNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = container.read(medicationFiltersProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  group('MedicationFiltersNotifier', () {
    test('build returns empty filters', () {
      final state = container.read(medicationFiltersProvider);
      expect(state, equals(const MedicationFilters()));
      expect(state.isEmpty, isTrue);
    });

    test('setPriority updates priority', () {
      notifier.setPriority(MedicationPriority.high);
      final state = container.read(medicationFiltersProvider);
      expect(state.priority, equals(MedicationPriority.high));
      expect(state.isEmpty, isFalse);
    });

    test('setIsActive updates isActive', () {
      notifier.setIsActive(true);
      final state = container.read(medicationFiltersProvider);
      expect(state.isActive, isTrue);
    });

    test('setRepeatType updates repeatType', () {
      notifier.setRepeatType(RepeatType.interval);
      final state = container.read(medicationFiltersProvider);
      expect(state.repeatType, equals(RepeatType.interval));
    });

    test('setSearchQuery updates searchQuery', () {
      notifier.setSearchQuery('aspirin');
      final state = container.read(medicationFiltersProvider);
      expect(state.searchQuery, equals('aspirin'));
    });

    test('setSortField updates sortField', () {
      notifier.setSortField(MedicationSortField.name);
      final state = container.read(medicationFiltersProvider);
      expect(state.sortField, equals(MedicationSortField.name));
    });

    test('setSortDirection updates sortDirection', () {
      notifier.setSortDirection(SortDirection.desc);
      final state = container.read(medicationFiltersProvider);
      expect(state.sortDirection, equals(SortDirection.desc));
    });

    test('reset clears all filters', () {
      notifier.setPriority(MedicationPriority.high);
      notifier.setSearchQuery('test');
      notifier.setIsActive(true);
      notifier.reset();

      final state = container.read(medicationFiltersProvider);
      expect(state.isEmpty, isTrue);
      expect(state.priority, isNull);
      expect(state.searchQuery, isNull);
      expect(state.isActive, isNull);
    });

    test('multiple updates accumulate', () {
      notifier.setPriority(MedicationPriority.high);
      notifier.setSearchQuery('test');
      notifier.setSortField(MedicationSortField.name);

      final state = container.read(medicationFiltersProvider);
      expect(state.priority, equals(MedicationPriority.high));
      expect(state.searchQuery, equals('test'));
      expect(state.sortField, equals(MedicationSortField.name));
      expect(state.isEmpty, isFalse);
    });
  });
}
