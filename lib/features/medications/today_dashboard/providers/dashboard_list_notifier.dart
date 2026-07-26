import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../profiles/providers/profile_providers.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';
import 'dashboard_filter_provider.dart';

final dashboardListProvider =
    NotifierProvider.autoDispose<
      DashboardListNotifier,
      BaseState<DashboardStateModel>
    >(DashboardListNotifier.new);

class DashboardListNotifier extends BaseNotifier<DashboardStateModel> {
  late TodayDashboardRepository repository;

  @override
  BaseState<DashboardStateModel> build() {
    repository = ref.read(todayDashboardRepositoryProvider);

    // Re-load when the active profile changes
    ref.listen<AsyncValue<String>>(activeProfileUuidProvider, (prev, next) {
      final prevUuid = prev?.value;
      final nextUuid = next.value;
      if (prev?.hasValue == true && prevUuid != nextUuid) {
        repository = ref.read(todayDashboardRepositoryProvider);
        Future.microtask(() => _loadDashboard(showLoading: true));
      }
    });

    ref.listen<DashboardFilterModel>(dashboardFilterProvider, (prev, next) {
      if (prev != next) {
        Future.microtask(() => _loadDashboard(showLoading: false));
      }
    });

    Future.microtask(_loadDashboard);
    return const BaseState();
  }

  Future<void> _loadDashboard({bool showLoading = true}) async {
    if (showLoading) {
      setLoading();
    }

    final filter = ref.read(dashboardFilterProvider);
    final result = await repository.getTodayDashboard(filter: filter);

    if (result case Success(:final data)) {
      setSuccess(data);
    } else if (result case Failure(:final error)) {
      setError(error);
    }
  }

  Future<void> refresh() => _loadDashboard(showLoading: false);
}
