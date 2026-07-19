import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/settings_model.dart';
import '../models/settings_enums.dart';
import '../repositories/repositories.dart';

final settingsProvider =
    NotifierProvider<SettingsNotifier, BaseState<SettingsModel>>(
      SettingsNotifier.new,
    );

class SettingsNotifier extends BaseNotifier<SettingsModel> {
  late SettingsRepository _repository;

  @override
  BaseState<SettingsModel> build() {
    _repository = ref.read(settingsRepositoryProvider);
    Future.microtask(_load);
    return const BaseState();
  }

  Future<void> _load() async {
    setLoading();
    final result = await _repository.loadSettings();
    if (result case Success(:final data)) {
      setSuccess(data);
    } else if (result case Failure(:final error)) {
      setError(error);
    }
  }

  Future<void> refresh() => _load();

  // ── General ──────────────────────────────────────────────────────────

  Future<void> updateLanguage(String language) async {
    final current = state.data;
    if (current == null) return;

    // Optimistic update
    final updated = current.copyWith(
      language: language,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateLanguage(language);
    if (result is Failure) {
      setSuccess(current); // Rollback
    }
  }

  Future<void> updateThemeMode(AppThemeMode mode) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      themeMode: mode,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateThemeMode(mode);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  Future<void> updateFirstDayOfWeek(int day) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      firstDayOfWeek: day,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateFirstDayOfWeek(day);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  Future<void> updateTimeFormat24(bool value) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      timeFormat24: value,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateTimeFormat24(value);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  // ── Notifications ────────────────────────────────────────────────────

  Future<void> updateNotificationsEnabled(bool value) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      notificationsEnabled: value,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateNotificationsEnabled(value);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  Future<void> updateNotificationSound(bool value) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      notificationSound: value,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateNotificationSound(value);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  Future<void> updateVibrationEnabled(bool value) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      vibrationEnabled: value,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateVibrationEnabled(value);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  Future<void> updateDefaultSnoozeMinutes(int minutes) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      defaultSnoozeMinutes: minutes,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateDefaultSnoozeMinutes(minutes);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  Future<void> updateReminderBeforeMinutes(int minutes) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      reminderBeforeMinutes: minutes,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateReminderBeforeMinutes(minutes);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  // ── History ──────────────────────────────────────────────────────────

  Future<void> updateDefaultHistoryFilter(AppHistoryFilter filter) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      defaultHistoryFilter: filter,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateDefaultHistoryFilter(filter);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  Future<void> updateDefaultHistoryGrouping(AppHistoryGrouping grouping) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      defaultHistoryGrouping: grouping,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateDefaultHistoryGrouping(grouping);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  // ── Backup ───────────────────────────────────────────────────────────

  Future<void> updateAutoBackupEnabled(bool value) async {
    final current = state.data;
    if (current == null) return;

    final updated = current.copyWith(
      autoBackupEnabled: value,
      updatedAt: DateTime.now(),
    );
    setSuccess(updated);

    final result = await _repository.updateAutoBackupEnabled(value);
    if (result is Failure) {
      setSuccess(current);
    }
  }

  // ── Reset ────────────────────────────────────────────────────────────

  Future<void> resetToDefaults() async {
    setLoading();
    final result = await _repository.resetToDefaults();
    if (result case Success(:final data)) {
      setSuccess(data);
    } else if (result case Failure(:final error)) {
      setError(error);
    }
  }
}
