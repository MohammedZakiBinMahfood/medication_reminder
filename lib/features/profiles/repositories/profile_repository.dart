import 'package:app_platform_core/core.dart';
import '../models/profile_model.dart';

abstract class ProfileRepository {
  Future<Result<ProfileModel>> createProfile({
    required String name,
    required String color,
    required int avatarIconCodePoint,
  });

  Future<Result<ProfileModel>> updateProfile(ProfileModel profile);

  Future<Result<void>> deleteProfile(String uuid);

  Future<Result<ProfileModel>> getProfile(String uuid);

  Future<Result<List<ProfileModel>>> getAllProfiles();

  Future<Result<ProfileModel>> getDefaultProfile();

  Future<Result<ProfileModel>> setActiveProfile(String uuid);

  Future<Result<String>> getActiveProfileUuid();

  Future<Result<void>> reorderProfiles(List<String> orderedUuids);
}
