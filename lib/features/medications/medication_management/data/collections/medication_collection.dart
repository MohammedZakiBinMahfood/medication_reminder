import 'package:isar_community/isar.dart';

part 'medication_collection.g.dart';

@collection
class MedicationCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index()
  late String profileUuid;

  late String name;

  late String dosage;

  late String color;

  /// Stored as an integer to completely decouple from domain enums.
  /// Mapping to [MedicationPriority] is handled in the repository mapper.
  late short priority;

  @Index()
  late bool isActive;

  int? stockQuantity;

  int? reorderThreshold;

  // Audit & Sync Fields
  late DateTime createdAt;
  late DateTime updatedAt;
  late bool isDeleted;
}
