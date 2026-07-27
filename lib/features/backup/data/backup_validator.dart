import 'dart:convert';

class BackupValidator {
  static const _requiredKeys = [
    'metadata',
    'medications',
    'medicationSchedules',
    'doseLogs',
  ];
  static const _metadataKeys = [
    'appVersion',
    'buildNumber',
    'exportedAt',
    'deviceModel',
  ];

  static BackupValidationResult validateFile(String content) {
    try {
      final json = jsonDecode(content) as Map<String, dynamic>;
      return validateJson(json);
    } on FormatException {
      return BackupValidationResult(
        isValid: false,
        error: 'Invalid JSON format',
      );
    }
  }

  static BackupValidationResult validateJson(Map<String, dynamic> json) {
    for (final key in _requiredKeys) {
      if (!json.containsKey(key)) {
        return BackupValidationResult(
          isValid: false,
          error: 'Missing required field: $key',
        );
      }
    }

    if (json['medications'] is! List) {
      return BackupValidationResult(
        isValid: false,
        error: 'medications must be a list',
      );
    }
    if (json['medicationSchedules'] is! List) {
      return BackupValidationResult(
        isValid: false,
        error: 'medicationSchedules must be a list',
      );
    }
    if (json['doseLogs'] is! List) {
      return BackupValidationResult(
        isValid: false,
        error: 'doseLogs must be a list',
      );
    }

    final metadata = json['metadata'];
    if (metadata is! Map<String, dynamic>) {
      return BackupValidationResult(
        isValid: false,
        error: 'metadata must be an object',
      );
    }

    for (final key in _metadataKeys) {
      if (!metadata.containsKey(key)) {
        return BackupValidationResult(
          isValid: false,
          error: 'Missing metadata field: $key',
        );
      }
    }

    return BackupValidationResult(
      isValid: true,
      metadata: BackupMetadataInfo(
        appVersion: metadata['appVersion']?.toString() ?? '',
        buildNumber: metadata['buildNumber']?.toString() ?? '',
        exportedAt: metadata['exportedAt']?.toString() ?? '',
        deviceModel: metadata['deviceModel']?.toString() ?? '',
        medicationCount: (json['medications'] as List).length,
        scheduleCount: (json['medicationSchedules'] as List).length,
        doseLogCount: (json['doseLogs'] as List).length,
        hasSettings: json.containsKey('settings'),
      ),
    );
  }
}

class BackupValidationResult {
  final bool isValid;
  final String? error;
  final BackupMetadataInfo? metadata;

  const BackupValidationResult({
    required this.isValid,
    this.error,
    this.metadata,
  });
}

class BackupMetadataInfo {
  final String appVersion;
  final String buildNumber;
  final String exportedAt;
  final String deviceModel;
  final int medicationCount;
  final int scheduleCount;
  final int doseLogCount;
  final bool hasSettings;

  const BackupMetadataInfo({
    required this.appVersion,
    required this.buildNumber,
    required this.exportedAt,
    required this.deviceModel,
    required this.medicationCount,
    required this.scheduleCount,
    required this.doseLogCount,
    required this.hasSettings,
  });
}
