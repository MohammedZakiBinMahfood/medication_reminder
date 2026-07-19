import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/notifications/notifications.dart';
import '../../compliance_history/providers/providers.dart';
import '../../medication_management/models/enums/medication_enums.dart';
import '../repositories/repositories.dart';
import 'dashboard_list_notifier.dart';

final dashboardActionProvider =
    NotifierProvider<DashboardActionNotifier, ActionStore>(
      DashboardActionNotifier.new,
    );

class DashboardActionNotifier extends Notifier<ActionStore> {
  TodayDashboardRepository get repository =>
      ref.read(todayDashboardRepositoryProvider);
  NotificationManager get _manager => ref.read(notificationManagerProvider);

  @override
  ActionStore build() => ActionStore();

  Future<void> markAsTaken({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
  }) async {
    const key = ActionKey(ActionType.create, 'mark_taken');
    state = state.start(key.value);

    final result = await repository.markDose(
      medicationUuid: medicationUuid,
      scheduleUuid: scheduleUuid,
      scheduledAt: scheduledAt,
      status: DoseStatus.taken,
    );

    if (result case Success()) {
      state = state.success(key.value);
      _notifyDependents();
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  Future<void> markAsSkipped({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
  }) async {
    const key = ActionKey(ActionType.create, 'mark_skipped');
    state = state.start(key.value);

    final result = await repository.markDose(
      medicationUuid: medicationUuid,
      scheduleUuid: scheduleUuid,
      scheduledAt: scheduledAt,
      status: DoseStatus.skipped,
    );

    if (result case Success()) {
      state = state.success(key.value);
      _notifyDependents();
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  Future<void> snooze({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
    required int minutes,
  }) async {
    final key = ActionKey(ActionType.update, 'snooze_$scheduleUuid');
    state = state.start(key.value);

    final result = await repository.snoozeDose(
      medicationUuid: medicationUuid,
      scheduleUuid: scheduleUuid,
      scheduledAt: scheduledAt,
      snoozeMinutes: minutes,
    );

    if (result case Success()) {
      await _manager.scheduleSnooze(
        medicationUuid: medicationUuid,
        scheduleUuid: scheduleUuid,
        snoozeMinutes: minutes,
      );
      state = state.success(key.value);
      _notifyDependents();
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  /// Notify all dependent providers after a dose action.
  void _notifyDependents() {
    ref.invalidate(dashboardListProvider);
    ref.invalidate(historyListProvider);
    ref.invalidate(historyStatisticsProvider);
  }
}
