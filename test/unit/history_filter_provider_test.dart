import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/features/medications/compliance_history/providers/history_filter_provider.dart';
import 'package:medication_reminder/features/medications/compliance_history/models/history_filter_model.dart';
import 'package:medication_reminder/features/medications/compliance_history/models/history_enums.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';

void main() {
  late ProviderContainer container;
  late HistoryFilterNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = container.read(historyFilterProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  group('HistoryFilterNotifier', () {
    test('build returns default filter', () {
      final state = container.read(historyFilterProvider);
      expect(state.dateRange, equals(HistoryDateRange.last7Days));
      expect(state.groupBy, equals(HistoryGroupBy.day));
      expect(state.sortOrder, equals(HistorySortOrder.newestFirst));
      expect(state.medicationUuid, isNull);
      expect(state.status, isNull);
      expect(state.priority, isNull);
    });

    test('setDateRange updates dateRange', () {
      notifier.setDateRange(HistoryDateRange.last30Days);
      final state = container.read(historyFilterProvider);
      expect(state.dateRange, equals(HistoryDateRange.last30Days));
    });

    test('setCustomDateRange updates custom dates and dateRange', () {
      final start = DateTime(2026, 1, 1);
      final end = DateTime(2026, 6, 30);
      notifier.setCustomDateRange(start, end);

      final state = container.read(historyFilterProvider);
      expect(state.dateRange, equals(HistoryDateRange.custom));
      expect(state.customStartDate, equals(start));
      expect(state.customEndDate, equals(end));
    });

    test('setMedicationFilter updates medicationUuid', () {
      notifier.setMedicationFilter('med-001');
      final state = container.read(historyFilterProvider);
      expect(state.medicationUuid, equals('med-001'));
    });

    test('setMedicationFilter with null clears medicationUuid', () {
      notifier.setMedicationFilter('med-001');
      notifier.setMedicationFilter(null);
      final state = container.read(historyFilterProvider);
      expect(state.medicationUuid, isNull);
    });

    test('setStatusFilter updates status', () {
      notifier.setStatusFilter(DoseStatus.taken);
      final state = container.read(historyFilterProvider);
      expect(state.status, equals(DoseStatus.taken));
    });

    test('setStatusFilter with null clears status', () {
      notifier.setStatusFilter(DoseStatus.taken);
      notifier.setStatusFilter(null);
      final state = container.read(historyFilterProvider);
      expect(state.status, isNull);
    });

    test('setPriorityFilter updates priority', () {
      notifier.setPriorityFilter(MedicationPriority.high);
      final state = container.read(historyFilterProvider);
      expect(state.priority, equals(MedicationPriority.high));
    });

    test('setPriorityFilter with null clears priority', () {
      notifier.setPriorityFilter(MedicationPriority.high);
      notifier.setPriorityFilter(null);
      final state = container.read(historyFilterProvider);
      expect(state.priority, isNull);
    });

    test('setGroupBy updates groupBy', () {
      notifier.setGroupBy(HistoryGroupBy.medication);
      final state = container.read(historyFilterProvider);
      expect(state.groupBy, equals(HistoryGroupBy.medication));
    });

    test('setSortOrder updates sortOrder', () {
      notifier.setSortOrder(HistorySortOrder.oldestFirst);
      final state = container.read(historyFilterProvider);
      expect(state.sortOrder, equals(HistorySortOrder.oldestFirst));
    });

    test('reset restores defaults', () {
      notifier.setDateRange(HistoryDateRange.all);
      notifier.setMedicationFilter('med-001');
      notifier.setStatusFilter(DoseStatus.taken);
      notifier.reset();

      final state = container.read(historyFilterProvider);
      expect(state.dateRange, equals(HistoryDateRange.last7Days));
      expect(state.medicationUuid, isNull);
      expect(state.status, isNull);
    });

    test('hasActiveFilters returns false for defaults', () {
      final state = container.read(historyFilterProvider);
      expect(state.hasActiveFilters, isFalse);
    });

    test('hasActiveFilters returns true when filters set', () {
      notifier.setMedicationFilter('med-001');
      final state = container.read(historyFilterProvider);
      expect(state.hasActiveFilters, isTrue);
    });
  });

  group('HistoryFilterModel', () {
    test('equality works correctly', () {
      const a = HistoryFilterModel();
      const b = HistoryFilterModel();
      expect(a, equals(b));
    });

    test('inequality for different filters', () {
      const a = HistoryFilterModel();
      const b = HistoryFilterModel(dateRange: HistoryDateRange.last30Days);
      expect(a, isNot(equals(b)));
    });

    test('copyWith preserves unmentioned fields', () {
      const original = HistoryFilterModel(
        dateRange: HistoryDateRange.all,
        groupBy: HistoryGroupBy.medication,
        sortOrder: HistorySortOrder.oldestFirst,
      );

      final modified = original.copyWith(medicationUuid: 'med-001');
      expect(modified.medicationUuid, equals('med-001'));
      expect(modified.dateRange, equals(HistoryDateRange.all));
      expect(modified.groupBy, equals(HistoryGroupBy.medication));
      expect(modified.sortOrder, equals(HistorySortOrder.oldestFirst));
    });

    test('copyWith with clear flags', () {
      const original = HistoryFilterModel(
        medicationUuid: 'med-001',
        status: DoseStatus.taken,
        priority: MedicationPriority.high,
      );

      final modified = original.copyWith(
        clearMedication: true,
        clearStatus: true,
      );
      expect(modified.medicationUuid, isNull);
      expect(modified.status, isNull);
      expect(modified.priority, equals(MedicationPriority.high));
    });
  });
}
