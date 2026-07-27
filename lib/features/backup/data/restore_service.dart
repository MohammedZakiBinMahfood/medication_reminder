import 'dart:convert';
import 'dart:io';
import 'package:isar_community/isar.dart';
import '../models/backup_data.dart';
import '../models/backup_enums.dart';
import '../../medications/medication_management/data/collections/medication_collection.dart';
import '../../medications/medication_management/data/collections/medication_schedule_collection.dart';
import '../../medications/medication_management/data/collections/dose_log_collection.dart';
import '../../settings/data/collections/settings_collection.dart';

class RestoreService {
  final Isar _isar;

  RestoreService(this._isar);

  Future<BackupData> readBackupFromFile(File file) async {
    final content = await file.readAsString();
    final json = jsonDecode(content) as Map<String, dynamic>;
    return _parseBackupData(json);
  }

  Future<void> restoreBackup(
    BackupData backup, {
    BackupRestoreMode mode = BackupRestoreMode.merge,
  }) async {
    await _isar.writeTxn(() async {
      if (mode == BackupRestoreMode.replace) {
        await _isar.medicationCollections.clear();
        await _isar.medicationScheduleCollections.clear();
        await _isar.doseLogCollections.clear();
        await _isar.settingsCollections.clear();
      }

      for (final med in backup.medications) {
        final collection = _medicationFromMap(med);
        final existing = await _isar.medicationCollections
            .where()
            .uuidEqualTo(collection.uuid)
            .findFirst();
        if (existing != null && mode == BackupRestoreMode.replace) {
          collection.id = existing.id;
        }
        await _isar.medicationCollections.put(collection);
      }

      for (final sched in backup.medicationSchedules) {
        final collection = _scheduleFromMap(sched);
        final existing = await _isar.medicationScheduleCollections
            .where()
            .uuidEqualTo(collection.uuid)
            .findFirst();
        if (existing != null && mode == BackupRestoreMode.replace) {
          collection.id = existing.id;
        }
        await _isar.medicationScheduleCollections.put(collection);
      }

      for (final log in backup.doseLogs) {
        final collection = _doseLogFromMap(log);
        final existing = await _isar.doseLogCollections
            .where()
            .uuidEqualTo(collection.uuid)
            .findFirst();
        if (existing != null && mode == BackupRestoreMode.replace) {
          collection.id = existing.id;
        }
        await _isar.doseLogCollections.put(collection);
      }

      if (backup.settings != null) {
        final collection = _settingsFromMap(backup.settings!);
        final existing = await _isar.settingsCollections.where().findFirst();
        if (existing != null && mode == BackupRestoreMode.replace) {
          collection.id = existing.id;
        }
        await _isar.settingsCollections.put(collection);
      }
    });
  }

  BackupData _parseBackupData(Map<String, dynamic> json) {
    return BackupData(
      metadata: BackupMetadataMapper.fromMap(
        json['metadata'] as Map<String, dynamic>,
      ),
      medications: (json['medications'] as List<dynamic>)
          .cast<Map<String, dynamic>>(),
      medicationSchedules: (json['medicationSchedules'] as List<dynamic>)
          .cast<Map<String, dynamic>>(),
      doseLogs: (json['doseLogs'] as List<dynamic>)
          .cast<Map<String, dynamic>>(),
      settings: json['settings'] as Map<String, dynamic>?,
    );
  }

  MedicationCollection _medicationFromMap(Map<String, dynamic> map) {
    return MedicationCollection()
      ..uuid = map['uuid'] as String
      ..name = map['name'] as String? ?? ''
      ..dosage = map['dosage'] as String? ?? ''
      ..color = map['color'] as String? ?? '#4F46E5'
      ..priority = (map['priority'] as num?)?.toInt() ?? 0
      ..isActive = map['isActive'] as bool? ?? true
      ..createdAt =
          DateTime.tryParse(map['createdAt'] as String? ?? '') ?? DateTime.now()
      ..updatedAt =
          DateTime.tryParse(map['updatedAt'] as String? ?? '') ?? DateTime.now()
      ..isDeleted = map['isDeleted'] as bool? ?? false;
  }

  MedicationScheduleCollection _scheduleFromMap(Map<String, dynamic> map) {
    return MedicationScheduleCollection()
      ..uuid = map['uuid'] as String
      ..medicationUuid = map['medicationUuid'] as String? ?? ''
      ..minutesFromMidnight = (map['minutesFromMidnight'] as num?)?.toInt() ?? 0
      ..repeatType = (map['repeatType'] as num?)?.toInt() ?? 0
      ..weekdays = (map['weekdays'] as List<dynamic>?)?.cast<byte>() ?? <byte>[]
      ..interval = (map['interval'] as num?)?.toInt() ?? 1
      ..startDate =
          DateTime.tryParse(map['startDate'] as String? ?? '') ?? DateTime.now()
      ..endDate = map['endDate'] != null
          ? DateTime.tryParse(map['endDate'] as String)
          : null
      ..createdAt =
          DateTime.tryParse(map['createdAt'] as String? ?? '') ?? DateTime.now()
      ..updatedAt =
          DateTime.tryParse(map['updatedAt'] as String? ?? '') ?? DateTime.now()
      ..isDeleted = map['isDeleted'] as bool? ?? false;
  }

  DoseLogCollection _doseLogFromMap(Map<String, dynamic> map) {
    return DoseLogCollection()
      ..uuid = map['uuid'] as String
      ..medicationUuid = map['medicationUuid'] as String? ?? ''
      ..scheduleUuid = map['scheduleUuid'] as String? ?? ''
      ..scheduledAt =
          DateTime.tryParse(map['scheduledAt'] as String? ?? '') ??
          DateTime.now()
      ..actionAt = map['actionAt'] != null
          ? DateTime.tryParse(map['actionAt'] as String)
          : null
      ..status = (map['status'] as num?)?.toInt() ?? 0
      ..createdAt =
          DateTime.tryParse(map['createdAt'] as String? ?? '') ?? DateTime.now()
      ..updatedAt =
          DateTime.tryParse(map['updatedAt'] as String? ?? '') ?? DateTime.now()
      ..isDeleted = map['isDeleted'] as bool? ?? false;
  }

  SettingsCollection _settingsFromMap(Map<String, dynamic> map) {
    return SettingsCollection()
      ..uuid = map['uuid'] as String? ?? ''
      ..language = map['language'] as String? ?? 'ar'
      ..themeMode = (map['themeMode'] as num?)?.toInt() ?? 0
      ..firstDayOfWeek = (map['firstDayOfWeek'] as num?)?.toInt() ?? 6
      ..timeFormat24 = map['timeFormat24'] as bool? ?? false
      ..notificationsEnabled = map['notificationsEnabled'] as bool? ?? true
      ..notificationSound = map['notificationSound'] as bool? ?? true
      ..vibrationEnabled = map['vibrationEnabled'] as bool? ?? true
      ..defaultSnoozeMinutes =
          (map['defaultSnoozeMinutes'] as num?)?.toInt() ?? 10
      ..reminderBeforeMinutes =
          (map['reminderBeforeMinutes'] as num?)?.toInt() ?? 0
      ..defaultHistoryFilter =
          (map['defaultHistoryFilter'] as num?)?.toInt() ?? 0
      ..defaultHistoryGrouping =
          (map['defaultHistoryGrouping'] as num?)?.toInt() ?? 0
      ..autoBackupEnabled = map['autoBackupEnabled'] as bool? ?? false
      ..appVersion = map['appVersion'] as String? ?? ''
      ..buildNumber = map['buildNumber'] as String? ?? ''
      ..createdAt =
          DateTime.tryParse(map['createdAt'] as String? ?? '') ?? DateTime.now()
      ..updatedAt =
          DateTime.tryParse(map['updatedAt'] as String? ?? '') ?? DateTime.now()
      ..isDeleted = map['isDeleted'] as bool? ?? false;
  }
}
