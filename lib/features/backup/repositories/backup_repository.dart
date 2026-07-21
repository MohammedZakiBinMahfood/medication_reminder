import 'dart:io';
import 'package:app_platform_core/core.dart';
import '../data/backup_validator.dart';
import '../models/backup_data.dart';
import '../models/backup_enums.dart';

abstract class BackupRepository {
  Future<Result<BackupData>> exportBackup();

  Future<Result<String>> exportBackupAsJson();

  Future<Result<void>> shareBackup();

  Future<Result<BackupValidationResult>> validateBackupFile(File file);

  Future<Result<BackupData>> readBackupFromFile(File file);

  Future<Result<void>> restoreBackup(
    BackupData backup, {
    BackupRestoreMode mode = BackupRestoreMode.merge,
  });

  Future<Result<void>> restoreFromFile(
    File file, {
    BackupRestoreMode mode = BackupRestoreMode.merge,
  });
}
