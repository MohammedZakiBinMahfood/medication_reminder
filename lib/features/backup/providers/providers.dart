import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/backup_repository.dart';
import '../repositories/backup_repository_impl.dart';
import '../data/backup_service.dart';
import '../data/restore_service.dart';
import '../data/backup_file_manager.dart';
import '../../../core/database/database_provider.dart';

export 'backup_notifier.dart';

final backupFileManagerProvider = Provider<BackupFileManager>((ref) {
  return BackupFileManager();
});

final backupServiceProvider = Provider<BackupService>((ref) {
  final isar = ref.watch(isarProvider);
  return BackupService(isar);
});

final restoreServiceProvider = Provider<RestoreService>((ref) {
  final isar = ref.watch(isarProvider);
  return RestoreService(isar);
});

final backupRepositoryProvider = Provider<BackupRepository>((ref) {
  return BackupRepositoryImpl(
    backupService: ref.watch(backupServiceProvider),
    restoreService: ref.watch(restoreServiceProvider),
    fileManager: ref.watch(backupFileManagerProvider),
  );
});
