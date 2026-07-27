import 'dart:convert';
import 'dart:io';
import 'package:isar_community/isar.dart';
import '../models/backup_data.dart';
import '../../medications/medication_management/data/collections/medication_collection.dart';
import '../../medications/medication_management/data/collections/medication_schedule_collection.dart';
import '../../medications/medication_management/data/collections/dose_log_collection.dart';
import '../../settings/data/collections/settings_collection.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BackupService {
  final Isar _isar;

  BackupService(this._isar);

  Future<BackupData> createBackupData() async {
    final medications = await _isar.medicationCollections.where().findAll();
    final schedules = await _isar.medicationScheduleCollections
        .where()
        .findAll();
    final doseLogs = await _isar.doseLogCollections.where().findAll();
    final settings = await _isar.settingsCollections.where().findFirst();

    final packageInfo = await PackageInfo.fromPlatform();

    final metadata = BackupMetadata(
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      exportedAt: DateTime.now(),
      deviceModel: Platform.localHostname,
    );

    return BackupData(
      metadata: metadata,
      medications: medications.map(_collectionToMap).toList(),
      medicationSchedules: schedules.map(_collectionToMap).toList(),
      doseLogs: doseLogs.map(_collectionToMap).toList(),
      settings: settings != null ? _collectionToMap(settings) : null,
    );
  }

  String backupToJson(BackupData data) {
    final json = {
      'metadata': data.metadata.toMap(),
      'medications': data.medications,
      'medicationSchedules': data.medicationSchedules,
      'doseLogs': data.doseLogs,
      if (data.settings != null) 'settings': data.settings,
    };
    return const JsonEncoder.withIndent('  ').convert(json);
  }

  Map<String, dynamic> _collectionToMap(dynamic collection) {
    return jsonDecode(jsonEncode(collection.toJson())) as Map<String, dynamic>;
  }
}
