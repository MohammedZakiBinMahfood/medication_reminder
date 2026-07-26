import 'package:app_platform_core/core.dart';
import '../models/settings_model.dart';
import '../models/settings_enums.dart';

abstract class SettingsRepository {
  /// Loads the current settings from the database.
  /// Creates defaults if none exist.
  Future<Result<SettingsModel>> loadSettings();

  /// Persists the full settings model.
  Future<Result<void>> saveSettings(SettingsModel settings);

  /// Resets all settings to factory defaults.
  Future<Result<SettingsModel>> resetToDefaults();

  /// Updates a single general setting.
  Future<Result<void>> updateLanguage(String language);

  /// Updates a single theme setting.
  Future<Result<void>> updateThemeMode(AppThemeMode mode);

  /// Updates accent color theme.
  Future<Result<void>> updateAccentColor(AppAccentColor color);

  /// Updates first day of week.
  Future<Result<void>> updateFirstDayOfWeek(int day);

  /// Updates 24-hour time format.
  Future<Result<void>> updateTimeFormat24(bool value);

  /// Updates notification enabled state.
  Future<Result<void>> updateNotificationsEnabled(bool value);

  /// Updates notification sound.
  Future<Result<void>> updateNotificationSound(bool value);

  /// Updates vibration enabled.
  Future<Result<void>> updateVibrationEnabled(bool value);

  /// Updates default snooze minutes.
  Future<Result<void>> updateDefaultSnoozeMinutes(int minutes);

  /// Updates reminder before dose minutes.
  Future<Result<void>> updateReminderBeforeMinutes(int minutes);

  /// Updates default history filter.
  Future<Result<void>> updateDefaultHistoryFilter(AppHistoryFilter filter);

  /// Updates default history grouping.
  Future<Result<void>> updateDefaultHistoryGrouping(
    AppHistoryGrouping grouping,
  );

  /// Updates auto backup enabled.
  Future<Result<void>> updateAutoBackupEnabled(bool value);
}
