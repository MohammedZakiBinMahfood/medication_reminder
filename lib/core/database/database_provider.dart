import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database_service.dart';
import 'package:isar/isar.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

final isarProvider = Provider<Isar>((ref) {
  return ref.watch(databaseServiceProvider).isar;
});
