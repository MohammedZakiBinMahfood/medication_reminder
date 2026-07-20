import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/features/medications/medication_management/repositories/medication_filters.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';
import 'package:medication_reminder/core/constants/enums.dart';

void main() {
  group('MedicationFilters', () {
    test('default constructor creates empty filters', () {
      const filters = MedicationFilters();
      expect(filters.priority, isNull);
      expect(filters.isActive, isNull);
      expect(filters.repeatType, isNull);
      expect(filters.searchQuery, isNull);
      expect(filters.sortField, isNull);
      expect(filters.sortDirection, isNull);
    });

    test('isEmpty returns true when all fields are null', () {
      const filters = MedicationFilters();
      expect(filters.isEmpty, isTrue);
    });

    test('isEmpty returns false when any field is set', () {
      const filters = MedicationFilters(priority: MedicationPriority.high);
      expect(filters.isEmpty, isFalse);
    });

    test('isEmpty returns false when searchQuery is set', () {
      const filters = MedicationFilters(searchQuery: 'test');
      expect(filters.isEmpty, isFalse);
    });

    test('copyWith preserves existing values', () {
      const original = MedicationFilters(
        priority: MedicationPriority.high,
        searchQuery: 'test',
        sortField: MedicationSortField.name,
        sortDirection: SortDirection.asc,
      );

      final modified = original.copyWith(isActive: true);
      expect(modified.priority, equals(MedicationPriority.high));
      expect(modified.searchQuery, equals('test'));
      expect(modified.isActive, isTrue);
      expect(modified.sortField, equals(MedicationSortField.name));
      expect(modified.sortDirection, equals(SortDirection.asc));
    });

    test('copyWith overrides existing values', () {
      const original = MedicationFilters(
        priority: MedicationPriority.high,
        searchQuery: 'test',
      );

      final modified = original.copyWith(
        priority: MedicationPriority.low,
        searchQuery: 'new',
      );
      expect(modified.priority, equals(MedicationPriority.low));
      expect(modified.searchQuery, equals('new'));
    });

    test('copyWith with null preserves values', () {
      const original = MedicationFilters(
        priority: MedicationPriority.high,
        isActive: true,
      );

      final modified = original.copyWith(priority: null);
      expect(modified.priority, equals(MedicationPriority.high));
      expect(modified.isActive, isTrue);
    });
  });
}
