import 'package:dart_mappable/dart_mappable.dart';
import 'settings_enums.dart';

part 'settings_model.mapper.dart';

@MappableClass()
class SettingsModel with SettingsModelMappable {
  final String uuid;

  // ── General ──
  final String language;
  final AppThemeMode themeMode;
  final int firstDayOfWeek;
  final bool timeFormat24;

  // ── Notifications ──
  final bool notificationsEnabled;
  final bool notificationSound;
  final bool vibrationEnabled;
  final int defaultSnoozeMinutes;
  final int reminderBeforeMinutes;

  // ── History ──
  final AppHistoryFilter defaultHistoryFilter;
  final AppHistoryGrouping defaultHistoryGrouping;

  // ── Backup ──
  final bool autoBackupEnabled;

  // ── Application ──
  final String appVersion;
  final String buildNumber;

  // ── Audit ──
  final DateTime createdAt;
  final DateTime updatedAt;

  const SettingsModel({
    required this.uuid,
    required this.language,
    required this.themeMode,
    required this.firstDayOfWeek,
    required this.timeFormat24,
    required this.notificationsEnabled,
    required this.notificationSound,
    required this.vibrationEnabled,
    required this.defaultSnoozeMinutes,
    required this.reminderBeforeMinutes,
    required this.defaultHistoryFilter,
    required this.defaultHistoryGrouping,
    required this.autoBackupEnabled,
    required this.appVersion,
    required this.buildNumber,
    required this.createdAt,
    required this.updatedAt,
  });
}
