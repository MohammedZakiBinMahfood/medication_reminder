import 'package:app_platform_core/core.dart';
import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/services/uuid_service.dart';
import '../data/collections/profile_collection.dart';
import '../data/mappers/profile_mapper.dart';
import '../models/profile_model.dart';
import 'profile_repository.dart';

const _activeProfileKey = 'active_profile_uuid';

class ProfileRepositoryImpl implements ProfileRepository {
  final Isar isar;

  ProfileRepositoryImpl({required this.isar});

  @override
  Future<Result<ProfileModel>> createProfile({
    required String name,
    required String color,
    required int avatarIconCodePoint,
  }) async {
    try {
      final now = DateTime.now();
      final uuid = UuidService.generate();

      final profiles = await isar.profileCollections
          .where()
          .filter()
          .isDeletedEqualTo(false)
          .findAll();

      final isDefault = profiles.isEmpty;
      final sortOrder = profiles.length;

      final collection = ProfileMapper.fromCreate(
        uuid: uuid,
        name: name,
        color: color,
        avatarIconCodePoint: avatarIconCodePoint,
        isDefault: isDefault,
        sortOrder: sortOrder,
        now: now,
      );

      await isar.writeTxn(() async {
        await isar.profileCollections.put(collection);
      });

      if (isDefault) {
        await _saveActiveProfileUuid(uuid);
      }

      return Success(ProfileMapper.toDomain(collection));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<ProfileModel>> updateProfile(ProfileModel profile) async {
    try {
      final existing = await isar.profileCollections
          .where()
          .filter()
          .uuidEqualTo(profile.uuid)
          .findFirst();

      if (existing == null) {
        return Failure(UnknownError('Profile not found'));
      }

      final collection = ProfileMapper.toCollection(
        profile,
        isarId: existing.id,
      );

      await isar.writeTxn(() async {
        await isar.profileCollections.put(collection);
      });

      return Success(ProfileMapper.toDomain(collection));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteProfile(String uuid) async {
    try {
      final existing = await isar.profileCollections
          .where()
          .filter()
          .uuidEqualTo(uuid)
          .findFirst();

      if (existing == null) {
        return Failure(UnknownError('Profile not found'));
      }

      if (existing.isDefault) {
        return Failure(UnknownError('Cannot delete default profile'));
      }

      await isar.writeTxn(() async {
        existing.isDeleted = true;
        existing.updatedAt = DateTime.now();
        await isar.profileCollections.put(existing);
      });

      // If the deleted profile was active, switch to default
      final activeResult = await getActiveProfileUuid();
      final activeUuid = activeResult is Success<String> ? activeResult.data : null;
      if (activeUuid == uuid) {
        final defaultResult = await getDefaultProfile();
        if (defaultResult is Success<ProfileModel>) {
          await _saveActiveProfileUuid(defaultResult.data.uuid);
        }
      }

      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<ProfileModel>> getProfile(String uuid) async {
    try {
      final collection = await isar.profileCollections
          .where()
          .filter()
          .uuidEqualTo(uuid)
          .isDeletedEqualTo(false)
          .findFirst();

      if (collection == null) {
        return Failure(UnknownError('Profile not found'));
      }

      return Success(ProfileMapper.toDomain(collection));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<List<ProfileModel>>> getAllProfiles() async {
    try {
      final collections = await isar.profileCollections
          .where()
          .filter()
          .isDeletedEqualTo(false)
          .sortBySortOrder()
          .findAll();

      return Success(
        collections.map(ProfileMapper.toDomain).toList(),
      );
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<ProfileModel>> getDefaultProfile() async {
    try {
      final collection = await isar.profileCollections
          .where()
          .filter()
          .isDefaultEqualTo(true)
          .isDeletedEqualTo(false)
          .findFirst();

      if (collection == null) {
        return Failure(UnknownError('No default profile found'));
      }

      return Success(ProfileMapper.toDomain(collection));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<ProfileModel>> setActiveProfile(String uuid) async {
    try {
      final result = await getProfile(uuid);
      if (result is Failure) {
        return result;
      }

      await _saveActiveProfileUuid(uuid);
      return result;
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<String>> getActiveProfileUuid() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var uuid = prefs.getString(_activeProfileKey);

      // If no active profile set, default to the default profile
      if (uuid == null) {
        final defaultResult = await getDefaultProfile();
        if (defaultResult is Success<ProfileModel>) {
          uuid = defaultResult.data.uuid;
          await _saveActiveProfileUuid(uuid);
        }
      }

      if (uuid == null) {
        return Failure(UnknownError('No active profile'));
      }

      return Success(uuid);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> reorderProfiles(List<String> orderedUuids) async {
    try {
      await isar.writeTxn(() async {
        for (var i = 0; i < orderedUuids.length; i++) {
          final collection = await isar.profileCollections
              .where()
              .filter()
              .uuidEqualTo(orderedUuids[i])
              .findFirst();

          if (collection != null) {
            collection.sortOrder = i;
            collection.updatedAt = DateTime.now();
            await isar.profileCollections.put(collection);
          }
        }
      });

      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  Future<void> _saveActiveProfileUuid(String uuid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_activeProfileKey, uuid);
  }

}
