import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/notifications/notifications.dart';
import '../../../profiles/providers/profile_providers.dart';
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

  Future<String> _getActiveProfileUuid() async {
    debugPrint('🔴 [CRUD] _getActiveProfileUuid called');
    final activeAsync = ref.read(activeProfileUuidProvider);
    debugPrint('🔴 [CRUD] activeAsync.value=${activeAsync.value}');
    if (activeAsync.value != null && activeAsync.value!.isNotEmpty) {
      debugPrint('🔴 [CRUD] returning from activeAsync.value: ${activeAsync.value}');
      return activeAsync.value!;
    }
    try {
      debugPrint('🔴 [CRUD] awaiting activeProfileUuidProvider.future');
      final fromFuture = await ref.read(activeProfileUuidProvider.future);
      debugPrint('🔴 [CRUD] fromFuture=$fromFuture');
      if (fromFuture.isNotEmpty) return fromFuture;
    } catch (e) {
      debugPrint('🔴 [CRUD] activeProfileUuidProvider.future error: $e');
    }
    debugPrint('🔴 [CRUD] falling back to profileRepository');
    final repo = ref.read(profileRepositoryProvider);
    final result = await repo.getActiveProfileUuid();
    debugPrint('🔴 [CRUD] repo result type: ${result.runtimeType}');
    if (result case Success(:final data)) {
      debugPrint('🔴 [CRUD] returning from repo: $data');
      return data;
    }
    debugPrint('🔴 [CRUD] returning empty string');
    return '';
  }

  Future<void> create() async {
    debugPrint('🔴 [CRUD] create() called');
    final data = ref.read(medicationStateProvider);
    const key = ActionKey(ActionType.create);
    debugPrint('🔴 [CRUD] key.value="${key.value}", state.isLoading=${state.isLoading(key.value)}');
    if (state.isLoading(key.value)) {
      debugPrint('🔴 [CRUD] already loading, returning');
      return;
    }
    state = state.start(key.value);
    debugPrint('🔴 [CRUD] state set to loading');

    try {
      final profileUuid = await _getActiveProfileUuid();
      debugPrint('🔴 [CRUD] profileUuid="$profileUuid"');
      
      final model = _buildAddModel(data, profileUuid);
      debugPrint('🔴 [CRUD] model built: name=${model.name}, dosage=${model.dosage}, profileUuid=${model.profileUuid}');
      
      final result = await repository.createMedication(model);
      debugPrint('🔴 [CRUD] repository.createMedication returned: ${result.runtimeType}');

      if (result case Success<MedicationModel>(:final data)) {
        debugPrint('🔴 [CRUD] SUCCESS: uuid=${data.uuid}');
        try {
          await _manager.scheduleMedication(data.uuid);
          debugPrint('🔴 [CRUD] notifications scheduled');
        } catch (e) {
          debugPrint('🔴 [CRUD] notification scheduling error: $e');
        }
        state = state.success(key.value);
        debugPrint('🔴 [CRUD] state set to success');
        _notifyDependents();
      } else if (result case Failure(:final error)) {
        debugPrint('🔴 [CRUD] FAILURE: ${error.errorMessage}');
        state = state.fail(key.value, error);
      }
    } catch (e) {
      debugPrint('🔴 [CRUD] EXCEPTION: $e');
      state = state.fail(key.value, UnknownError(e.toString()));
    }
    debugPrint('🔴 [CRUD] create() completed');
  }

  Future<void> update() async {
    final data = ref.read(medicationStateProvider);
    final key = ActionKey(ActionType.update, data.id ?? '');
    state = state.start(key.value);

    try {
      // Cancel existing notifications BEFORE updating schedules
      // to prevent orphan notifications with old schedule UUIDs.
      try {
        await _manager.cancelMedication(data.id ?? '');
      } catch (_) {}

      final profileUuid = await _getActiveProfileUuid();
      final model = _buildEditModel(data, profileUuid);
      final result = await repository.updateMedication(model);

      if (result case Success<MedicationModel>(:final data)) {
        try {
          await _manager.scheduleMedication(data.uuid);
        } catch (_) {}
        state = state.success(key.value);
        _notifyDependents();
      } else if (result case Failure(:final error)) {
        state = state.fail(key.value, error);
      }
    } catch (e) {
      state = state.fail(key.value, UnknownError(e.toString()));
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
    debugPrint('🔴 [CRUD] _notifyDependents called');
    ref.invalidate(dashboardListProvider);
    debugPrint('🔴 [CRUD] invalidated dashboardListProvider');
    ref.invalidate(medicationListProvider);
    debugPrint('🔴 [CRUD] invalidated medicationListProvider');
    ref.invalidate(historyListProvider);
    debugPrint('🔴 [CRUD] invalidated historyListProvider');
    ref.invalidate(historyStatisticsProvider);
    debugPrint('🔴 [CRUD] invalidated historyStatisticsProvider');
  }

  MedicationAddModel _buildAddModel(MedicationStateModel data, String profileUuid) {
    return MedicationAddModel(
      profileUuid: profileUuid,
      name: data.name ?? '',
      dosage: data.dosage ?? '',
      color: data.color ?? '#4F46E5',
      priority: data.priority,
      repeatType: data.repeatType,
      weekdays: data.weekdays,
      interval: data.interval,
      startDate: data.startDate ?? DateTime.now(),
      endDate: data.endDate,
      minutesFromMidnight: data.minutesFromMidnight,
      isActive: data.isActive,
      stockQuantity: data.stockQuantity,
      reorderThreshold: data.reorderThreshold,
      foodInstruction: data.foodInstruction,
      imagePath: data.imagePath,
    );
  }

  MedicationEditModel _buildEditModel(MedicationStateModel data, String profileUuid) {
    return MedicationEditModel(
      id: data.id ?? '',
      profileUuid: profileUuid,
      name: data.name ?? '',
      dosage: data.dosage ?? '',
      color: data.color ?? '#4F46E5',
      priority: data.priority,
      repeatType: data.repeatType,
      weekdays: data.weekdays,
      interval: data.interval,
      startDate: data.startDate ?? DateTime.now(),
      endDate: data.endDate,
      minutesFromMidnight: data.minutesFromMidnight,
      isActive: data.isActive,
      stockQuantity: data.stockQuantity,
      reorderThreshold: data.reorderThreshold,
      foodInstruction: data.foodInstruction,
      imagePath: data.imagePath,
    );
  }
}
