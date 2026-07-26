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

  /// Stored as integer: 0: none, 1: beforeMeal, 2: withMeal, 3: afterMeal, 4: onEmptyStomach, 5: beforeBed
  short foodInstruction = 0;

  String? imagePath;

  // Audit & Sync Fields
  late DateTime createdAt;
  late DateTime updatedAt;
  late bool isDeleted;
}
