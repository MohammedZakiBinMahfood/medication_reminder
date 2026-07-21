// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'backup_enums.dart';

class BackupRestoreModeMapper extends EnumMapper<BackupRestoreMode> {
  BackupRestoreModeMapper._();

  static BackupRestoreModeMapper? _instance;
  static BackupRestoreModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BackupRestoreModeMapper._());
    }
    return _instance!;
  }

  static BackupRestoreMode fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BackupRestoreMode decode(dynamic value) {
    switch (value) {
      case r'merge':
        return BackupRestoreMode.merge;
      case r'replace':
        return BackupRestoreMode.replace;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BackupRestoreMode self) {
    switch (self) {
      case BackupRestoreMode.merge:
        return r'merge';
      case BackupRestoreMode.replace:
        return r'replace';
    }
  }
}

extension BackupRestoreModeMapperExtension on BackupRestoreMode {
  String toValue() {
    BackupRestoreModeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BackupRestoreMode>(this) as String;
  }
}

