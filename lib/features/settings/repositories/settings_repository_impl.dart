import 'package:app_platform_core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:medication_reminder/features/settings/data/collections/settings_collection.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/services/uuid_service.dart';
import '../data/mappers/settings_mapper.dart';
import '../models/settings_model.dart';
import '../models/settings_enums.dart';
import 'settings_repository.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl(isar: ref.read(isarProvider));
});

class SettingsRepositoryImpl implements SettingsRepository {
  final Isar isar;

  SettingsRepositoryImpl({required this.isar});

  String? _cachedUuid;

  Future<SettingsCollection> _getOrCreate() async {
    final existing = await isar.settingsCollections
        .where()
        .filter()
        .isDeletedEqualTo(false)
        .findFirst();

    if (existing != null) {
      _cachedUuid = existing.uuid;
      return existing;
    }

    final info = await PackageInfo.fromPlatform();
    final uuid = UuidService.generate();
    final collection = SettingsMapper.defaults(
      uuid: uuid,
      appVersion: info.version,
      buildNumber: info.buildNumber,
    );

    await isar.writeTxn(() async {
      await isar.settingsCollections.put(collection);
    });

    _cachedUuid = uuid;
    return collection;
  }

  @override
  Future<Result<SettingsModel>> loadSettings() async {
    try {
      final collection = await _getOrCreate();
      return Success(SettingsMapper.toDomain(collection));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> saveSettings(SettingsModel settings) async {
    try {
      final collection = SettingsMapper.toCollection(settings);
      await isar.writeTxn(() async {
        await isar.settingsCollections.put(collection);
      });
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<SettingsModel>> resetToDefaults() async {
    try {
      final info = await PackageInfo.fromPlatform();
      final uuid = _cachedUuid ?? UuidService.generate();
      final collection = SettingsMapper.defaults(
        uuid: uuid,
        appVersion: info.version,
        buildNumber: info.buildNumber,
      );

      await isar.writeTxn(() async {
        await isar.settingsCollections.put(collection);
      });

      _cachedUuid = uuid;
      return Success(SettingsMapper.toDomain(collection));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  Future<void> _updateField(void Function(SettingsCollection) updater) async {
    final existing = await _getOrCreate();
    updater(existing);
    existing.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.settingsCollections.put(existing);
    });
  }

  @override
  Future<Result<void>> updateLanguage(String language) async {
    try {
      await _updateField((c) => c.language = language);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateThemeMode(AppThemeMode mode) async {
    try {
      await _updateField((c) => c.themeMode = mode.index);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateFirstDayOfWeek(int day) async {
    try {
      await _updateField((c) => c.firstDayOfWeek = day);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateTimeFormat24(bool value) async {
    try {
      await _updateField((c) => c.timeFormat24 = value);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateNotificationsEnabled(bool value) async {
    try {
      await _updateField((c) => c.notificationsEnabled = value);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateNotificationSound(bool value) async {
    try {
      await _updateField((c) => c.notificationSound = value);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateVibrationEnabled(bool value) async {
    try {
      await _updateField((c) => c.vibrationEnabled = value);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateDefaultSnoozeMinutes(int minutes) async {
    try {
      await _updateField((c) => c.defaultSnoozeMinutes = minutes);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateReminderBeforeMinutes(int minutes) async {
    try {
      await _updateField((c) => c.reminderBeforeMinutes = minutes);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateDefaultHistoryFilter(
    AppHistoryFilter filter,
  ) async {
    try {
      await _updateField((c) => c.defaultHistoryFilter = filter.index);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateDefaultHistoryGrouping(
    AppHistoryGrouping grouping,
  ) async {
    try {
      await _updateField((c) => c.defaultHistoryGrouping = grouping.index);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateAutoBackupEnabled(bool value) async {
    try {
      await _updateField((c) => c.autoBackupEnabled = value);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }
}
