import 'package:isar_community/isar.dart';

part 'settings_collection.g.dart';

@collection
class SettingsCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  // ── General ──
  late String language;
  late int themeMode;
  late int firstDayOfWeek;
  late bool timeFormat24;

  // ── Notifications ──
  late bool notificationsEnabled;
  late bool notificationSound;
  late bool vibrationEnabled;
  late int defaultSnoozeMinutes;
  late int reminderBeforeMinutes;

  // ── History ──
  late int defaultHistoryFilter;
  late int defaultHistoryGrouping;

  // ── Backup ──
  late bool autoBackupEnabled;

  // ── Application ──
  late String appVersion;
  late String buildNumber;

  // Audit & Sync Fields
  late DateTime createdAt;
  late DateTime updatedAt;
  late bool isDeleted;
}
