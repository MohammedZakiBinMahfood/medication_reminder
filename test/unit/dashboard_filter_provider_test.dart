import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/features/medications/today_dashboard/providers/dashboard_filter_provider.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_filter_model.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_enums.dart';

void main() {
  late ProviderContainer container;
  late DashboardFilterNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = container.read(dashboardFilterProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  group('DashboardFilterNotifier', () {
    test('build returns default filter', () {
      final state = container.read(dashboardFilterProvider);
      expect(state.filterType, equals(DashboardFilterType.all));
      expect(state.sortType, equals(DashboardSortType.time));
    });

    test('setFilterType updates filterType', () {
      notifier.setFilterType(DashboardFilterType.upcoming);
      final state = container.read(dashboardFilterProvider);
      expect(state.filterType, equals(DashboardFilterType.upcoming));
      expect(state.sortType, equals(DashboardSortType.time));
    });

    test('setSortType updates sortType', () {
      notifier.setSortType(DashboardSortType.priority);
      final state = container.read(dashboardFilterProvider);
      expect(state.sortType, equals(DashboardSortType.priority));
      expect(state.filterType, equals(DashboardFilterType.all));
    });

    test('reset restores defaults', () {
      notifier.setFilterType(DashboardFilterType.missed);
      notifier.setSortType(DashboardSortType.name);
      notifier.reset();

      final state = container.read(dashboardFilterProvider);
      expect(state.filterType, equals(DashboardFilterType.all));
      expect(state.sortType, equals(DashboardSortType.time));
    });

    test('equality works correctly', () {
      const a = DashboardFilterModel();
      const b = DashboardFilterModel();
      expect(a, equals(b));

      const c = DashboardFilterModel(filterType: DashboardFilterType.upcoming);
      expect(a, isNot(equals(c)));
    });
  });
}
