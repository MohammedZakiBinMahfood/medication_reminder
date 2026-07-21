import 'package:dart_mappable/dart_mappable.dart';

part 'backup_enums.mapper.dart';

@MappableEnum()
enum BackupRestoreMode { merge, replace }
