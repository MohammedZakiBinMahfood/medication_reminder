import 'package:dart_mappable/dart_mappable.dart';

part 'backup_data.mapper.dart';

@MappableClass()
class BackupMetadata with BackupMetadataMappable {
  final String appVersion;
  final String buildNumber;
  final DateTime exportedAt;
  final String deviceModel;

  const BackupMetadata({
    required this.appVersion,
    required this.buildNumber,
    required this.exportedAt,
    required this.deviceModel,
  });
}

@MappableClass()
class BackupData with BackupDataMappable {
  final BackupMetadata metadata;
  final List<Map<String, dynamic>> medications;
  final List<Map<String, dynamic>> medicationSchedules;
  final List<Map<String, dynamic>> doseLogs;
  final Map<String, dynamic>? settings;

  const BackupData({
    required this.metadata,
    required this.medications,
    required this.medicationSchedules,
    required this.doseLogs,
    this.settings,
  });
}
