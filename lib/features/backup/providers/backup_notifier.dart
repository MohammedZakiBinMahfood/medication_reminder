import 'dart:io';
import 'package:app_platform_core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/backup_validator.dart';
import '../models/backup_data.dart';
import '../models/backup_enums.dart';
import '../repositories/backup_repository.dart';
import 'providers.dart';

class BackupState {
  final LoadStatus status;
  final BackupData? lastBackup;
  final String? error;
  final BackupRestoreMode restoreMode;
  final bool isExporting;
  final bool isImporting;
  final BackupValidationResult? validationResult;
  final File? selectedFile;

  const BackupState({
    this.status = LoadStatus.idle,
    this.lastBackup,
    this.error,
    this.restoreMode = BackupRestoreMode.merge,
    this.isExporting = false,
    this.isImporting = false,
    this.validationResult,
    this.selectedFile,
  });

  BackupState copyWith({
    LoadStatus? status,
    BackupData? lastBackup,
    Object? error,
    BackupRestoreMode? restoreMode,
    bool? isExporting,
    bool? isImporting,
    BackupValidationResult? validationResult,
    File? selectedFile,
    bool clearError = false,
    bool clearValidation = false,
    bool clearSelectedFile = false,
  }) {
    return BackupState(
      status: status ?? this.status,
      lastBackup: lastBackup ?? this.lastBackup,
      error: clearError ? null : (error is String? ? error : this.error),
      restoreMode: restoreMode ?? this.restoreMode,
      isExporting: isExporting ?? this.isExporting,
      isImporting: isImporting ?? this.isImporting,
      validationResult: clearValidation
          ? null
          : (validationResult ?? this.validationResult),
      selectedFile: clearSelectedFile
          ? null
          : (selectedFile ?? this.selectedFile),
    );
  }

  int get medicationCount => lastBackup?.medications.length ?? 0;
  int get scheduleCount => lastBackup?.medicationSchedules.length ?? 0;
  int get doseLogCount => lastBackup?.doseLogs.length ?? 0;
}

final backupProvider = NotifierProvider<BackupNotifier, BackupState>(
  BackupNotifier.new,
);

class BackupNotifier extends Notifier<BackupState> {
  late BackupRepository _repository;

  @override
  BackupState build() {
    _repository = ref.read(backupRepositoryProvider);
    return const BackupState();
  }

  Future<void> exportBackup() async {
    state = state.copyWith(isExporting: true, clearError: true);

    final result = await _repository.exportBackup();
    if (result case Success(:final data)) {
      state = state.copyWith(
        isExporting: false,
        lastBackup: data,
        status: LoadStatus.success,
      );
    } else if (result case Failure(:final error)) {
      state = state.copyWith(
        isExporting: false,
        error: error.errorMessage,
        status: LoadStatus.error,
      );
    }
  }

  Future<void> shareBackup() async {
    state = state.copyWith(isExporting: true, clearError: true);

    final result = await _repository.shareBackup();
    if (result case Success()) {
      state = state.copyWith(isExporting: false, status: LoadStatus.success);
    } else if (result case Failure(:final error)) {
      state = state.copyWith(
        isExporting: false,
        error: error.errorMessage,
        status: LoadStatus.error,
      );
    }
  }

  Future<void> pickAndValidateFile() async {
    state = state.copyWith(
      clearError: true,
      clearValidation: true,
      clearSelectedFile: true,
    );

    final fileManager = ref.read(backupFileManagerProvider);
    final file = await fileManager.pickBackupFile();
    if (file == null) return;

    final result = await _repository.validateBackupFile(file);
    if (result case Success(:final data)) {
      state = state.copyWith(selectedFile: file, validationResult: data);
    } else if (result case Failure(:final error)) {
      state = state.copyWith(error: error.errorMessage);
    }
  }

  Future<void> restoreFromSelectedFile() async {
    final file = state.selectedFile;
    if (file == null || state.validationResult?.isValid != true) return;

    state = state.copyWith(isImporting: true, clearError: true);

    final result = await _repository.restoreFromFile(
      file,
      mode: state.restoreMode,
    );

    if (result case Success()) {
      state = state.copyWith(
        isImporting: false,
        status: LoadStatus.success,
        clearValidation: true,
        clearSelectedFile: true,
      );
    } else if (result case Failure(:final error)) {
      state = state.copyWith(
        isImporting: false,
        error: error.errorMessage,
        status: LoadStatus.error,
      );
    }
  }

  void setRestoreMode(BackupRestoreMode mode) {
    state = state.copyWith(restoreMode: mode);
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  void clearValidation() {
    state = state.copyWith(clearValidation: true, clearSelectedFile: true);
  }
}
