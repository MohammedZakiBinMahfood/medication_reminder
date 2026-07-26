import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/history_filter_model.dart';
import '../models/history_statistics_model.dart';
import '../repositories/repositories.dart';
import 'history_filter_provider.dart';

final historyStatisticsProvider =
    NotifierProvider.autoDispose<
      HistoryStatisticsNotifier,
      BaseState<HistoryStatisticsModel>
    >(HistoryStatisticsNotifier.new);

class HistoryStatisticsNotifier extends BaseNotifier<HistoryStatisticsModel> {
  late ComplianceHistoryRepository repository;

  @override
  BaseState<HistoryStatisticsModel> build() {
    repository = ref.read(complianceHistoryRepositoryProvider);

    ref.listen<HistoryFilterModel>(historyFilterProvider, (prev, next) {
      if (prev != next) {
        Future.microtask(() => _loadStatistics(showLoading: false));
      }
    });

    Future.microtask(_loadStatistics);
    return const BaseState();
  }

  Future<void> _loadStatistics({bool showLoading = true}) async {
    if (showLoading) {
      setLoading();
    }

    final filter = ref.read(historyFilterProvider);
    final result = await repository.getStatistics(filter: filter);

    if (result case Success(:final data)) {
      setSuccess(data);
    } else if (result case Failure(:final error)) {
      setError(error);
    }
  }

  Future<void> refresh() => _loadStatistics(showLoading: false);
}
