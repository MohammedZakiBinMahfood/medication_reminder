import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/features/settings/models/settings_model.dart';
import 'package:medication_reminder/features/settings/models/settings_enums.dart';

void main() {
  group('SettingsModel', () {
    test('creates with all required fields', () {
      final model = SettingsModel(
        uuid: 'test-uuid',
        language: 'ar',
        themeMode: AppThemeMode.light,
        firstDayOfWeek: 6,
        timeFormat24: false,
        notificationsEnabled: true,
        notificationSound: true,
        vibrationEnabled: true,
        defaultSnoozeMinutes: 10,
        reminderBeforeMinutes: 0,
        defaultHistoryFilter: AppHistoryFilter.last7Days,
        defaultHistoryGrouping: AppHistoryGrouping.day,
        autoBackupEnabled: false,
        appVersion: '1.0.0',
        buildNumber: '1',
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      expect(model.uuid, equals('test-uuid'));
      expect(model.language, equals('ar'));
      expect(model.themeMode, equals(AppThemeMode.light));
    });

    test('copyWith creates modified copy', () {
      final original = SettingsModel(
        uuid: 'test-uuid',
        language: 'ar',
        themeMode: AppThemeMode.light,
        firstDayOfWeek: 6,
        timeFormat24: false,
        notificationsEnabled: true,
        notificationSound: true,
        vibrationEnabled: true,
        defaultSnoozeMinutes: 10,
        reminderBeforeMinutes: 0,
        defaultHistoryFilter: AppHistoryFilter.last7Days,
        defaultHistoryGrouping: AppHistoryGrouping.day,
        autoBackupEnabled: false,
        appVersion: '1.0.0',
        buildNumber: '1',
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      final modified = original.copyWith(
        themeMode: AppThemeMode.dark,
        language: 'en',
      );
      expect(modified.themeMode, equals(AppThemeMode.dark));
      expect(modified.language, equals('en'));
      expect(modified.uuid, equals('test-uuid'));
    });

    test('toJson/fromJson roundtrip', () {
      final original = SettingsModel(
        uuid: 'test-uuid',
        language: 'en',
        themeMode: AppThemeMode.dark,
        firstDayOfWeek: 1,
        timeFormat24: true,
        notificationsEnabled: false,
        notificationSound: false,
        vibrationEnabled: false,
        defaultSnoozeMinutes: 5,
        reminderBeforeMinutes: 15,
        defaultHistoryFilter: AppHistoryFilter.all,
        defaultHistoryGrouping: AppHistoryGrouping.medication,
        autoBackupEnabled: true,
        appVersion: '2.0.0',
        buildNumber: '42',
        createdAt: DateTime(2026),
        updatedAt: DateTime(2026),
      );

      final json = original.toJson();
      final restored = SettingsModelMapper.fromJson(json);

      expect(restored.uuid, equals(original.uuid));
      expect(restored.language, equals(original.language));
      expect(restored.themeMode, equals(original.themeMode));
      expect(restored.timeFormat24, equals(original.timeFormat24));
      expect(
        restored.defaultHistoryFilter,
        equals(original.defaultHistoryFilter),
      );
    });
  });

  group('Settings enums', () {
    test('AppThemeMode has correct values', () {
      expect(AppThemeMode.values.length, equals(3));
      expect(AppThemeMode.values[0], equals(AppThemeMode.light));
      expect(AppThemeMode.values[1], equals(AppThemeMode.dark));
      expect(AppThemeMode.values[2], equals(AppThemeMode.system));
    });

    test('AppHistoryFilter has correct values', () {
      expect(AppHistoryFilter.values.length, equals(4));
      expect(AppHistoryFilter.values[0], equals(AppHistoryFilter.last7Days));
      expect(AppHistoryFilter.values[1], equals(AppHistoryFilter.last30Days));
      expect(AppHistoryFilter.values[2], equals(AppHistoryFilter.custom));
      expect(AppHistoryFilter.values[3], equals(AppHistoryFilter.all));
    });

    test('AppHistoryGrouping has correct values', () {
      expect(AppHistoryGrouping.values.length, equals(4));
      expect(AppHistoryGrouping.values[0], equals(AppHistoryGrouping.day));
      expect(AppHistoryGrouping.values[1], equals(AppHistoryGrouping.week));
      expect(AppHistoryGrouping.values[2], equals(AppHistoryGrouping.month));
      expect(
        AppHistoryGrouping.values[3],
        equals(AppHistoryGrouping.medication),
      );
    });

    test('AppThemeMode toValue/fromValue roundtrip', () {
      for (final value in AppThemeMode.values) {
        final json = value.toValue();
        final restored = AppThemeModeMapper.fromValue(json);
        expect(restored, equals(value));
      }
    });
  });
}
