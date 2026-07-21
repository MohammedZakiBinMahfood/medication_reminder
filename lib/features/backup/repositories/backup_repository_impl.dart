import 'dart:io';
import 'package:app_platform_core/core.dart';
import '../data/backup_service.dart';
import '../data/backup_validator.dart';
import '../data/restore_service.dart';
import '../data/backup_file_manager.dart';
import '../models/backup_data.dart';
import '../models/backup_enums.dart';
import 'backup_repository.dart';

class BackupRepositoryImpl implements BackupRepository {
  final BackupService _backupService;
  final RestoreService _restoreService;
  final BackupFileManager _fileManager;

  BackupRepositoryImpl({
    required BackupService backupService,
    required RestoreService restoreService,
    required BackupFileManager fileManager,
  })  : _backupService = backupService,
        _restoreService = restoreService,
        _fileManager = fileManager;

  @override
  Future<Result<BackupData>> exportBackup() async {
    try {
      final data = await _backupService.createBackupData();
      return Success(data);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<String>> exportBackupAsJson() async {
    try {
      final data = await _backupService.createBackupData();
      final json = _backupService.backupToJson(data);
      return Success(json);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> shareBackup() async {
    try {
      final data = await _backupService.createBackupData();
      final json = _backupService.backupToJson(data);
      await _fileManager.shareBackup(json);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<BackupValidationResult>> validateBackupFile(File file) async {
    try {
      final content = await file.readAsString();
      final result = BackupValidator.validateFile(content);
      return Success(result);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<BackupData>> readBackupFromFile(File file) async {
    try {
      final data = await _restoreService.readBackupFromFile(file);
      return Success(data);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> restoreBackup(
    BackupData backup, {
    BackupRestoreMode mode = BackupRestoreMode.merge,
  }) async {
    try {
      await _restoreService.restoreBackup(backup, mode: mode);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> restoreFromFile(
    File file, {
    BackupRestoreMode mode = BackupRestoreMode.merge,
  }) async {
    try {
      final data = await _restoreService.readBackupFromFile(file);
      await _restoreService.restoreBackup(data, mode: mode);
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }
}
