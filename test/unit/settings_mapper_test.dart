import 'package:flutter_test/flutter_test.dart';
import 'package:medication_reminder/features/settings/data/mappers/settings_mapper.dart';
import 'package:medication_reminder/features/settings/models/settings_model.dart';
import 'package:medication_reminder/features/settings/models/settings_enums.dart';
import 'package:medication_reminder/features/settings/data/collections/settings_collection.dart';

void main() {
  group('SettingsMapper', () {
    group('defaults', () {
      test('creates collection with correct default values', () {
        final collection = SettingsMapper.defaults(
          uuid: 'test-uuid',
          appVersion: '1.0.0',
          buildNumber: '1',
        );

        expect(collection.uuid, equals('test-uuid'));
        expect(collection.language, equals('ar'));
        expect(collection.themeMode, equals(AppThemeMode.light.index));
        expect(collection.firstDayOfWeek, equals(6));
        expect(collection.timeFormat24, isFalse);
        expect(collection.notificationsEnabled, isTrue);
        expect(collection.notificationSound, isTrue);
        expect(collection.vibrationEnabled, isTrue);
        expect(collection.defaultSnoozeMinutes, equals(10));
        expect(collection.reminderBeforeMinutes, equals(0));
        expect(
          collection.defaultHistoryFilter,
          equals(AppHistoryFilter.last7Days.index),
        );
        expect(
          collection.defaultHistoryGrouping,
          equals(AppHistoryGrouping.day.index),
        );
        expect(collection.autoBackupEnabled, isFalse);
        expect(collection.appVersion, equals('1.0.0'));
        expect(collection.buildNumber, equals('1'));
        expect(collection.isDeleted, isFalse);
      });
    });

    group('toDomain', () {
      test('converts collection to domain model correctly', () {
        final now = DateTime(2026);
        final collection = SettingsCollection()
          ..uuid = 'test-uuid'
          ..language = 'en'
          ..themeMode = AppThemeMode.dark.index
          ..firstDayOfWeek = 1
          ..timeFormat24 = true
          ..notificationsEnabled = false
          ..notificationSound = false
          ..vibrationEnabled = false
          ..defaultSnoozeMinutes = 5
          ..reminderBeforeMinutes = 15
          ..defaultHistoryFilter = AppHistoryFilter.all.index
          ..defaultHistoryGrouping = AppHistoryGrouping.medication.index
          ..autoBackupEnabled = true
          ..appVersion = '2.0.0'
          ..buildNumber = '42'
          ..createdAt = now
          ..updatedAt = now
          ..isDeleted = false;

        final model = SettingsMapper.toDomain(collection);

        expect(model.uuid, equals('test-uuid'));
        expect(model.language, equals('en'));
        expect(model.themeMode, equals(AppThemeMode.dark));
        expect(model.firstDayOfWeek, equals(1));
        expect(model.timeFormat24, isTrue);
        expect(model.notificationsEnabled, isFalse);
        expect(model.notificationSound, isFalse);
        expect(model.vibrationEnabled, isFalse);
        expect(model.defaultSnoozeMinutes, equals(5));
        expect(model.reminderBeforeMinutes, equals(15));
        expect(model.defaultHistoryFilter, equals(AppHistoryFilter.all));
        expect(
          model.defaultHistoryGrouping,
          equals(AppHistoryGrouping.medication),
        );
        expect(model.autoBackupEnabled, isTrue);
        expect(model.appVersion, equals('2.0.0'));
        expect(model.buildNumber, equals('42'));
      });
    });

    group('toCollection', () {
      test('converts domain model to collection correctly', () {
        final model = SettingsModel(
          uuid: 'test-uuid',
          language: 'ar',
          themeMode: AppThemeMode.system,
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

        final collection = SettingsMapper.toCollection(model);

        expect(collection.uuid, equals('test-uuid'));
        expect(collection.language, equals('ar'));
        expect(collection.themeMode, equals(AppThemeMode.system.index));
        expect(collection.isDeleted, isFalse);
      });

      test('preserves custom isarId', () {
        final model = SettingsMapper.defaults(
          uuid: 'test-uuid',
          appVersion: '1.0.0',
          buildNumber: '1',
        );

        final domainModel = SettingsMapper.toDomain(model);
        final collection = SettingsMapper.toCollection(domainModel, isarId: 5);
        expect(collection.id, equals(5));
      });
    });

    group('roundtrip', () {
      test('collection -> domain -> collection preserves data', () {
        final original = SettingsMapper.defaults(
          uuid: 'test-uuid',
          appVersion: '1.0.0',
          buildNumber: '1',
        );

        final domain = SettingsMapper.toDomain(original);
        final restored = SettingsMapper.toCollection(domain);

        expect(restored.uuid, equals(original.uuid));
        expect(restored.language, equals(original.language));
        expect(restored.themeMode, equals(original.themeMode));
        expect(
          restored.defaultHistoryFilter,
          equals(original.defaultHistoryFilter),
        );
        expect(
          restored.defaultHistoryGrouping,
          equals(original.defaultHistoryGrouping),
        );
      });
    });

    group('themeMode clamping', () {
      test('handles invalid theme mode index gracefully', () {
        final collection = SettingsCollection()
          ..uuid = 'test'
          ..language = 'ar'
          ..themeMode = 99
          ..firstDayOfWeek = 6
          ..timeFormat24 = false
          ..notificationsEnabled = true
          ..notificationSound = true
          ..vibrationEnabled = true
          ..defaultSnoozeMinutes = 10
          ..reminderBeforeMinutes = 0
          ..defaultHistoryFilter = 0
          ..defaultHistoryGrouping = 0
          ..autoBackupEnabled = false
          ..appVersion = '1.0.0'
          ..buildNumber = '1'
          ..createdAt = DateTime(2026)
          ..updatedAt = DateTime(2026)
          ..isDeleted = false;

        final model = SettingsMapper.toDomain(collection);
        expect(model.themeMode, equals(AppThemeMode.values.last));
      });
    });
  });
}
