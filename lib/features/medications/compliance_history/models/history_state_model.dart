import 'history_group_model.dart';
import 'history_item_model.dart';
import 'history_statistics_model.dart';

class HistoryStateModel {
  final List<HistoryGroupModel> groups;
  final HistoryStatisticsModel statistics;
  final int totalCount;
  final bool isLoadingMore;
  final bool hasNext;

  const HistoryStateModel({
    required this.groups,
    required this.statistics,
    required this.totalCount,
    this.isLoadingMore = false,
    this.hasNext = false,
  });

  factory HistoryStateModel.empty() {
    return HistoryStateModel(
      groups: const [],
      statistics: HistoryStatisticsModel.empty(),
      totalCount: 0,
    );
  }

  factory HistoryStateModel.loading() {
    return HistoryStateModel(
      groups: const [],
      statistics: HistoryStatisticsModel.empty(),
      totalCount: 0,
    );
  }

  bool get isEmpty => groups.isEmpty && totalCount == 0;

  List<HistoryItemModel> get allItems => groups.expand((g) => g.items).toList();

  HistoryStateModel copyWith({
    List<HistoryGroupModel>? groups,
    HistoryStatisticsModel? statistics,
    int? totalCount,
    bool? isLoadingMore,
    bool? hasNext,
  }) {
    return HistoryStateModel(
      groups: groups ?? this.groups,
      statistics: statistics ?? this.statistics,
      totalCount: totalCount ?? this.totalCount,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasNext: hasNext ?? this.hasNext,
    );
  }
}
