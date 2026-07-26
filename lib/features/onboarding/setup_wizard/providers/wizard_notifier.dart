import 'dart:io';

import 'package:app_platform_core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medication_reminder/core/notifications/notification_providers.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

final wizardProvider =
    NotifierProvider<WizardNotifier, WizardState>(WizardNotifier.new);

class WizardNotifier extends Notifier<WizardState> {
  late final WizardRepository _repository;

  @override
  WizardState build() {
    _repository = ref.read(wizardRepositoryProvider);
    _init();
    return const WizardState(isLoading: true);
  }

  Future<void> _init() async {
    final completed = await _repository.isWizardCompleted();
    state = state.copyWith(isCompleted: completed, isLoading: false);
  }

  Future<void> initialize() async {
    final completed = await _repository.isWizardCompleted();
    state = state.copyWith(isCompleted: completed, isLoading: false);
  }

  void goToStep(WizardStep step) {
    state = state.copyWith(currentStep: step);
  }

  void nextStep() {
    final next = state.nextStep;
    if (next != null) {
      state = state.copyWith(currentStep: next);
    }
  }

  void previousStep() {
    final prev = state.previousStep;
    if (prev != null) {
      state = state.copyWith(currentStep: prev);
    }
  }

  // ── Notification Permission ─────────────────────────────────────────

  Future<void> requestNotificationPermission() async {
    state = state.copyWith(isLoading: true);
    try {
      final manager = ref.read(notificationManagerProvider);
      final result = await manager.requestPermissions();
      bool granted = false;
      if (result case Success(:final data)) {
        granted = data == true;
      }
      state = state.copyWith(
        notificationGranted: granted,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> checkNotificationPermission() async {
    try {
      final manager = ref.read(notificationManagerProvider);
      final result = await manager.isPermissionGranted;
      bool granted = false;
      if (result case Success(:final data)) {
        granted = data == true;
      }
      state = state.copyWith(notificationGranted: granted);
    } catch (e) {
      // Permission status unknown — default to not granted
    }
  }

  // ── Exact Alarm Permission ──────────────────────────────────────────

  Future<void> checkExactAlarmAvailability() async {
    if (!Platform.isAndroid) {
      state = state.copyWith(exactAlarmAvailable: false);
      return;
    }
    try {
      final manager = ref.read(notificationManagerProvider);
      final canSchedule = await manager.canScheduleExactNotifications();
      state = state.copyWith(exactAlarmGranted: canSchedule);
    } catch (e) {
      state = state.copyWith(exactAlarmAvailable: false);
    }
  }

  Future<void> requestExactAlarmPermission() async {
    if (!Platform.isAndroid) return;
    state = state.copyWith(isLoading: true);
    try {
      final manager = ref.read(notificationManagerProvider);
      await manager.requestExactAlarmsPermission();
      final canSchedule = await manager.canScheduleExactNotifications();
      state = state.copyWith(
        exactAlarmGranted: canSchedule,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  // ── Battery Optimization ───────────────────────────────────────────
  // Note: Battery optimization cannot be checked or toggled programmatically
  // without native platform channels or additional packages. This step is
  // advisory — it shows instructions for the user to follow manually.

  // ── Completion ─────────────────────────────────────────────────────

  Future<void> completeWizard() async {
    state = state.copyWith(isLoading: true);
    await _repository.markWizardCompleted();
    state = state.copyWith(isCompleted: true, isLoading: false);
  }

  Future<void> skipWizard() async {
    await _repository.markWizardCompleted();
    state = state.copyWith(isCompleted: true);
  }
}
