import 'package:isar_community/isar.dart';
import '../collections/profile_collection.dart';
import '../../models/profile_model.dart';

class ProfileMapper {
  ProfileMapper._();

  static ProfileModel toDomain(ProfileCollection collection) {
    return ProfileModel(
      uuid: collection.uuid,
      name: collection.name,
      color: collection.color,
      avatarIconCodePoint: collection.avatarIconCodePoint,
      isDefault: collection.isDefault,
      sortOrder: collection.sortOrder,
      createdAt: collection.createdAt,
      updatedAt: collection.updatedAt,
    );
  }

  static ProfileCollection toCollection(
    ProfileModel model, {
    Id isarId = Isar.autoIncrement,
  }) {
    return ProfileCollection()
      ..id = isarId
      ..uuid = model.uuid
      ..name = model.name
      ..color = model.color
      ..avatarIconCodePoint = model.avatarIconCodePoint
      ..isDefault = model.isDefault
      ..sortOrder = model.sortOrder
      ..createdAt = model.createdAt
      ..updatedAt = model.updatedAt
      ..isDeleted = false;
  }

  static ProfileCollection fromCreate({
    required String uuid,
    required String name,
    required String color,
    required int avatarIconCodePoint,
    required bool isDefault,
    required int sortOrder,
    required DateTime now,
  }) {
    return ProfileCollection()
      ..uuid = uuid
      ..name = name
      ..color = color
      ..avatarIconCodePoint = avatarIconCodePoint
      ..isDefault = isDefault
      ..sortOrder = sortOrder
      ..createdAt = now
      ..updatedAt = now
      ..isDeleted = false;
  }
}
