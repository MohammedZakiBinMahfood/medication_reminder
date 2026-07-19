import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashboard_filter_model.dart';
import '../models/dashboard_enums.dart';

final dashboardFilterProvider =
    NotifierProvider<DashboardFilterNotifier, DashboardFilterModel>(
      DashboardFilterNotifier.new,
    );

class DashboardFilterNotifier extends Notifier<DashboardFilterModel> {
  @override
  DashboardFilterModel build() => const DashboardFilterModel();

  void setFilterType(DashboardFilterType type) {
    state = state.copyWith(filterType: type);
  }

  void setSortType(DashboardSortType type) {
    state = state.copyWith(sortType: type);
  }

  void reset() {
    state = const DashboardFilterModel();
  }
}
