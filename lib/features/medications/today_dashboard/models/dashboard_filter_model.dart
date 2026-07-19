import 'dashboard_enums.dart';

class DashboardFilterModel {
  final DashboardFilterType filterType;
  final DashboardSortType sortType;

  const DashboardFilterModel({
    this.filterType = DashboardFilterType.all,
    this.sortType = DashboardSortType.time,
  });

  DashboardFilterModel copyWith({
    DashboardFilterType? filterType,
    DashboardSortType? sortType,
  }) {
    return DashboardFilterModel(
      filterType: filterType ?? this.filterType,
      sortType: sortType ?? this.sortType,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardFilterModel &&
          filterType == other.filterType &&
          sortType == other.sortType;

  @override
  int get hashCode => filterType.hashCode ^ sortType.hashCode;
}
