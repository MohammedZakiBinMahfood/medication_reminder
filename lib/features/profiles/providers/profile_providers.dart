import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_platform_core/core.dart';

import '../../../core/database/database_provider.dart';
import '../models/profile_model.dart';
import '../repositories/profile_repository.dart';
import '../repositories/profile_repository_impl.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(isar: ref.read(isarProvider));
});

final activeProfileUuidProvider =
    FutureProvider.autoDispose<String>((ref) async {
  final repo = ref.read(profileRepositoryProvider);
  final result = await repo.getActiveProfileUuid();
  if (result case Success(:final data)) {
    return data;
  } else if (result case Failure(:final error)) {
    throw error;
  }
  throw StateError('Unexpected result');
});

final activeProfileProvider =
    FutureProvider.autoDispose<ProfileModel>((ref) async {
  final uuid = await ref.watch(activeProfileUuidProvider.future);
  final repo = ref.read(profileRepositoryProvider);
  final result = await repo.getProfile(uuid);
  if (result case Success(:final data)) {
    return data;
  } else if (result case Failure(:final error)) {
    throw error;
  }
  throw StateError('Unexpected result');
});

final allProfilesProvider =
    FutureProvider.autoDispose<List<ProfileModel>>((ref) async {
  final repo = ref.read(profileRepositoryProvider);
  final result = await repo.getAllProfiles();
  if (result case Success(:final data)) {
    return data;
  } else if (result case Failure(:final error)) {
    throw error;
  }
  throw StateError('Unexpected result');
});
