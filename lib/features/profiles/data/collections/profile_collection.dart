import 'package:isar_community/isar.dart';

part 'profile_collection.g.dart';

@collection
class ProfileCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  late String name;

  late String color;

  /// Index of the avatar icon (material icon codePoint).
  late int avatarIconCodePoint;

  late bool isDefault;

  late int sortOrder;

  // Audit Fields
  late DateTime createdAt;
  late DateTime updatedAt;
  late bool isDeleted;
}
