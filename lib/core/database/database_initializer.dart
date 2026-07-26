import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/medications/medication_management/data/collections/medication_collection.dart';
import '../../features/medications/medication_management/data/collections/medication_schedule_collection.dart';
import '../../features/medications/medication_management/data/collections/dose_log_collection.dart';
import '../../features/profiles/data/collections/profile_collection.dart';
import '../../features/profiles/data/mappers/profile_mapper.dart';
import '../services/uuid_service.dart';
import 'database_service.dart';

class DatabaseInitializer {
  static const _profileMigrationKey = 'profile_migration_done';

  static Future<void> initialize(DatabaseService service) async {
    await service.init();
    await _migrateToMultiProfile(service.isar);
  }

  /// One-time migration: creates a default "Personal" profile and assigns
  /// all existing data (with empty profileUuid) to it.
  static Future<void> _migrateToMultiProfile(Isar isar) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_profileMigrationKey) == true) return;

    // Check if any profile already exists.
    final existingProfiles = await isar.profileCollections
        .where()
        .filter()
        .isDeletedEqualTo(false)
        .count();

    if (existingProfiles == 0) {
      // Create default profile
      final defaultUuid = UuidService.generate();
      final now = DateTime.now();

      final defaultProfile = ProfileMapper.fromCreate(
        uuid: defaultUuid,
        name: 'Personal',
        color: '#4F46E5',
        avatarIconCodePoint: Icons.person.codePoint,
        isDefault: true,
        sortOrder: 0,
        now: now,
      );

      await isar.writeTxn(() async {
        await isar.profileCollections.put(defaultProfile);
      });

      // Assign all existing medications to the default profile
      final medications = await isar.medicationCollections
          .where()
          .filter()
          .profileUuidEqualTo('')
          .findAll();

      for (final med in medications) {
        med.profileUuid = defaultUuid;
      }
      if (medications.isNotEmpty) {
        await isar.writeTxn(() async {
          await isar.medicationCollections.putAll(medications);
        });
      }

      // Assign all existing schedules to the default profile
      final schedules = await isar.medicationScheduleCollections
          .where()
          .filter()
          .profileUuidEqualTo('')
          .findAll();

      for (final schedule in schedules) {
        schedule.profileUuid = defaultUuid;
      }
      if (schedules.isNotEmpty) {
        await isar.writeTxn(() async {
          await isar.medicationScheduleCollections.putAll(schedules);
        });
      }

      // Assign all existing dose logs to the default profile
      final doseLogs = await isar.doseLogCollections
          .where()
          .filter()
          .profileUuidEqualTo('')
          .findAll();

      for (final log in doseLogs) {
        log.profileUuid = defaultUuid;
      }
      if (doseLogs.isNotEmpty) {
        await isar.writeTxn(() async {
          await isar.doseLogCollections.putAll(doseLogs);
        });
      }

      // Set active profile
      await prefs.setString('active_profile_uuid', defaultUuid);
    }

    await prefs.setBool(_profileMigrationKey, true);
  }
}
