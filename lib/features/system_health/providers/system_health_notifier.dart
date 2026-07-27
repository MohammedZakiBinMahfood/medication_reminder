import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../repositories/system_health_repository.dart';
import '../repositories/system_health_repository_impl.dart';

final systemHealthProvider =
    NotifierProvider<SystemHealthNotifier, BaseState<SystemHealthState>>(
      SystemHealthNotifier.new,
    );

class SystemHealthState {
  final List<HealthCheckModel> checks;
  final bool isRefreshing;

  const SystemHealthState({this.checks = const [], this.isRefreshing = false});

  SystemHealthState copyWith({
    List<HealthCheckModel>? checks,
    bool? isRefreshing,
  }) {
    return SystemHealthState(
      checks: checks ?? this.checks,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  int get failedCount => checks.where((c) => c.isFailed).length;

  int get passedCount => checks.where((c) => !c.isFailed).length;

  double get score => checks.isEmpty ? 0 : passedCount / checks.length;

  String get overallHealthLabel {
    final s = score;
    if (s >= 0.9) return 'excellent';
    if (s >= 0.7) return 'good';
    if (s >= 0.4) return 'needsAttention';
    return 'critical';
  }

  List<HealthCheckModel> get failedChecks =>
      checks.where((c) => c.isFailed).toList();
}

class SystemHealthNotifier extends Notifier<BaseState<SystemHealthState>> {
  SystemHealthRepository get _repo => ref.read(systemHealthRepositoryProvider);

  @override
  BaseState<SystemHealthState> build() => const BaseState();

  Future<void> loadAll() async {
    state = state.copyWith(status: LoadStatus.loading);
    final checks = <HealthCheckModel>[];

    final results = await Future.wait([
      _repo.checkNotificationPermission(),
      _repo.checkExactAlarmPermission(),
      _repo.checkBatteryOptimization(),
      _repo.checkNotificationService(),
      _repo.checkPendingNotifications(),
      _repo.checkDatabase(),
      _repo.checkTimeZone(),
      _repo.checkApplication(),
    ]);

    for (final result in results) {
      if (result case Success(:final data)) {
        checks.add(data);
      }
    }

    state = state.copyWith(
      status: LoadStatus.success,
      data: SystemHealthState(checks: checks),
    );
  }

  Future<void> refresh() async {
    state = state.copyWith(
      status: LoadStatus.success,
      data:
          state.data?.copyWith(isRefreshing: true) ??
          const SystemHealthState(isRefreshing: true),
    );
    await loadAll();
  }

  Future<void> requestNotificationPermission() async {
    await _repo.requestNotificationPermission();
    await loadAll();
  }

  Future<void> openExactAlarmSettings() async {
    await _repo.openExactAlarmSettings();
    await loadAll();
  }

  Future<void> openBatterySettings() async {
    await _repo.openBatterySettings();
    await loadAll();
  }

  Future<void> refreshScheduler() async {
    await _repo.refreshScheduler();
    await loadAll();
  }
}
