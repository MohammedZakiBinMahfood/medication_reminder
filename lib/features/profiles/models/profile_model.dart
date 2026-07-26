import 'package:dart_mappable/dart_mappable.dart';

part 'profile_model.mapper.dart';

@MappableClass()
class ProfileModel with ProfileModelMappable {
  final String uuid;
  final String name;
  final String color;
  final int avatarIconCodePoint;
  final bool isDefault;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProfileModel({
    required this.uuid,
    required this.name,
    required this.color,
    required this.avatarIconCodePoint,
    required this.isDefault,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });
}
