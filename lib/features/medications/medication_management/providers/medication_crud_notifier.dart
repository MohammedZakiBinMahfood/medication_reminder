import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/notifications/notifications.dart';
import '../../compliance_history/providers/providers.dart';
import '../models/models.dart';
import '../repositories/medication_repository.dart';
import '../../today_dashboard/providers/dashboard_list_notifier.dart';
import '../../medication_management/providers/medication_list_notifier.dart';
import 'repository_providers.dart';
import 'medication_state_notifier.dart';

final medicationCrudProvider =
    NotifierProvider<MedicationCrudNotifier, ActionStore>(
      MedicationCrudNotifier.new,
    );

class MedicationCrudNotifier extends Notifier<ActionStore> {
  MedicationRepository get repository => ref.read(medicationRepositoryProvider);
  NotificationManager get _manager => ref.read(notificationManagerProvider);
  ActionType screenMode = ActionType.create;

  @override
  ActionStore build() => ActionStore();

  Future<void> create() async {
    final data = ref.read(medicationStateProvider);
    const key = ActionKey(ActionType.create);
    if (state.isLoading(key.value)) return;
    state = state.start(key.value);

    final model = _buildAddModel(data);
    final result = await repository.createMedication(model);

    if (result case Success<MedicationModel>(:final data)) {
      state = state.success(key.value);
      await _manager.scheduleMedication(data.uuid);
      _notifyDependents();
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  Future<void> update() async {
    final data = ref.read(medicationStateProvider);
    final key = ActionKey(ActionType.update, data.id ?? '');
    state = state.start(key.value);

    // Cancel existing notifications BEFORE updating schedules
    // to prevent orphan notifications with old schedule UUIDs.
    await _manager.cancelMedication(data.id ?? '');

    final model = _buildEditModel(data);
    final result = await repository.updateMedication(model);

    if (result case Success<MedicationModel>(:final data)) {
      state = state.success(key.value);
      await _manager.scheduleMedication(data.uuid);
      _notifyDependents();
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  Future<void> delete(String uuid) async {
    final key = ActionKey(ActionType.delete, uuid);
    state = state.start(key.value);

    // Cancel notifications BEFORE soft-deleting to ensure cleanup.
    await _manager.cancelMedication(uuid);

    final result = await repository.deleteMedication(uuid);

    if (result case Success()) {
      state = state.success(key.value);
      _notifyDependents();
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  Future<void> activate(String uuid) async {
    final key = ActionKey(ActionType.activate, uuid);
    state = state.start(key.value);
    final result = await repository.activate(uuid);

    if (result case Success()) {
      state = state.success(key.value);
      await _manager.scheduleMedication(uuid);
      _notifyDependents();
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  Future<void> deactivate(String uuid) async {
    final key = ActionKey(ActionType.deactivate, uuid);
    state = state.start(key.value);
    final result = await repository.deactivate(uuid);

    if (result case Success()) {
      state = state.success(key.value);
      await _manager.cancelMedication(uuid);
      _notifyDependents();
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  /// Notify all dependent providers after a CRUD operation.
  void _notifyDependents() {
    ref.invalidate(dashboardListProvider);
    ref.invalidate(medicationListProvider);
    ref.invalidate(historyListProvider);
    ref.invalidate(historyStatisticsProvider);
  }

  MedicationAddModel _buildAddModel(MedicationStateModel data) {
    return MedicationAddModel(
      name: data.name ?? '',
      dosage: data.dosage ?? '',
      color: data.color ?? '#4F46E5',
      priority: data.priority,
      repeatType: data.repeatType,
      weekdays: data.weekdays,
      interval: data.interval,
      startDate: data.startDate ?? DateTime.now(),
      endDate: data.endDate,
      isActive: data.isActive,
    );
  }

  MedicationEditModel _buildEditModel(MedicationStateModel data) {
    return MedicationEditModel(
      id: data.id ?? '',
      name: data.name ?? '',
      dosage: data.dosage ?? '',
      color: data.color ?? '#4F46E5',
      priority: data.priority,
      repeatType: data.repeatType,
      weekdays: data.weekdays,
      interval: data.interval,
      startDate: data.startDate ?? DateTime.now(),
      endDate: data.endDate,
      isActive: data.isActive,
    );
  }
}
