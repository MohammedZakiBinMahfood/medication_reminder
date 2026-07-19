import 'package:isar_community/isar.dart';
import '../collections/settings_collection.dart';
import '../../models/settings_model.dart';
import '../../models/settings_enums.dart';

class SettingsMapper {
  SettingsMapper._();

  static SettingsModel toDomain(SettingsCollection collection) {
    return SettingsModel(
      uuid: collection.uuid,
      language: collection.language,
      themeMode: _themeModeFromInt(collection.themeMode),
      firstDayOfWeek: collection.firstDayOfWeek,
      timeFormat24: collection.timeFormat24,
      notificationsEnabled: collection.notificationsEnabled,
      notificationSound: collection.notificationSound,
      vibrationEnabled: collection.vibrationEnabled,
      defaultSnoozeMinutes: collection.defaultSnoozeMinutes,
      reminderBeforeMinutes: collection.reminderBeforeMinutes,
      defaultHistoryFilter: _historyFilterFromInt(
        collection.defaultHistoryFilter,
      ),
      defaultHistoryGrouping: _historyGroupingFromInt(
        collection.defaultHistoryGrouping,
      ),
      autoBackupEnabled: collection.autoBackupEnabled,
      appVersion: collection.appVersion,
      buildNumber: collection.buildNumber,
      createdAt: collection.createdAt,
      updatedAt: collection.updatedAt,
    );
  }

  static SettingsCollection toCollection(
    SettingsModel model, {
    Id isarId = Isar.autoIncrement,
  }) {
    return SettingsCollection()
      ..id = isarId
      ..uuid = model.uuid
      ..language = model.language
      ..themeMode = model.themeMode.index
      ..firstDayOfWeek = model.firstDayOfWeek
      ..timeFormat24 = model.timeFormat24
      ..notificationsEnabled = model.notificationsEnabled
      ..notificationSound = model.notificationSound
      ..vibrationEnabled = model.vibrationEnabled
      ..defaultSnoozeMinutes = model.defaultSnoozeMinutes
      ..reminderBeforeMinutes = model.reminderBeforeMinutes
      ..defaultHistoryFilter = model.defaultHistoryFilter.index
      ..defaultHistoryGrouping = model.defaultHistoryGrouping.index
      ..autoBackupEnabled = model.autoBackupEnabled
      ..appVersion = model.appVersion
      ..buildNumber = model.buildNumber
      ..createdAt = model.createdAt
      ..updatedAt = model.updatedAt
      ..isDeleted = false;
  }

  static SettingsCollection defaults({
    required String uuid,
    required String appVersion,
    required String buildNumber,
  }) {
    final now = DateTime.now();
    return SettingsCollection()
      ..uuid = uuid
      ..language = 'ar'
      ..themeMode = AppThemeMode.light.index
      ..firstDayOfWeek =
          6 // Saturday (Islamic week)
      ..timeFormat24 = false
      ..notificationsEnabled = true
      ..notificationSound = true
      ..vibrationEnabled = true
      ..defaultSnoozeMinutes = 10
      ..reminderBeforeMinutes = 0
      ..defaultHistoryFilter = AppHistoryFilter.last7Days.index
      ..defaultHistoryGrouping = AppHistoryGrouping.day.index
      ..autoBackupEnabled = false
      ..appVersion = appVersion
      ..buildNumber = buildNumber
      ..createdAt = now
      ..updatedAt = now
      ..isDeleted = false;
  }

  static AppThemeMode _themeModeFromInt(int value) {
    return AppThemeMode.values[value.clamp(0, AppThemeMode.values.length - 1)];
  }

  static AppHistoryFilter _historyFilterFromInt(int value) {
    return AppHistoryFilter.values[value.clamp(
      0,
      AppHistoryFilter.values.length - 1,
    )];
  }

  static AppHistoryGrouping _historyGroupingFromInt(int value) {
    return AppHistoryGrouping.values[value.clamp(
      0,
      AppHistoryGrouping.values.length - 1,
    )];
  }
}
