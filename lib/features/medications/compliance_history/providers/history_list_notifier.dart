import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/history_filter_model.dart';
import '../models/history_state_model.dart';
import '../repositories/repositories.dart';
import 'history_filter_provider.dart';

final historyListProvider =
    NotifierProvider.autoDispose<
      HistoryListNotifier,
      BaseState<HistoryStateModel>
    >(HistoryListNotifier.new);

class HistoryListNotifier extends BaseNotifier<HistoryStateModel> {
  late ComplianceHistoryRepository repository;
  Pagination _pagination = const Pagination(page: 1, limit: 20);

  @override
  BaseState<HistoryStateModel> build() {
    repository = ref.read(complianceHistoryRepositoryProvider);

    ref.listen<HistoryFilterModel>(historyFilterProvider, (prev, next) {
      if (prev != next) {
        _loadHistory(showLoading: false);
      }
    });

    Future.microtask(_loadHistory);
    return const BaseState();
  }

  Future<void> _loadHistory({bool showLoading = true}) async {
    if (showLoading) {
      setLoading();
    }

    _pagination = _pagination.first();
    final filter = ref.read(historyFilterProvider);
    final result = await repository.getHistory(
      filter: filter,
      pagination: _pagination,
    );

    if (result case Success(:final data)) {
      setSuccess(data);
    } else if (result case Failure(:final error)) {
      setError(error);
    }
  }

  Future<void> loadNextPage() async {
    final current = state.data;
    if (current == null || !current.hasNext || current.isLoadingMore) return;

    setSuccess(current.copyWith(isLoadingMore: true));
    _pagination = _pagination.next();

    final filter = ref.read(historyFilterProvider);
    final result = await repository.getHistory(
      filter: filter,
      pagination: _pagination,
    );

    if (result case Success(:final data)) {
      setSuccess(
        current.copyWith(
          groups: [...current.groups, ...data.groups],
          totalCount: data.totalCount,
          statistics: data.statistics,
          isLoadingMore: false,
          hasNext: data.hasNext,
        ),
      );
    } else if (result case Failure()) {
      setSuccess(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() => _loadHistory(showLoading: false);
}
