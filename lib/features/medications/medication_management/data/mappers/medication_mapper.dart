import 'package:isar_community/isar.dart';
import '../collections/medication_collection.dart';
import '../../models/enums/medication_enums.dart';
import '../../models/medication_model.dart';
import '../../models/medication_field.dart';
import '../../models/medication_schedule_model.dart';

class MedicationMapper {
  MedicationMapper._();

  static MedicationModel toDomain(MedicationCollection collection) {
    return MedicationModel(
      uuid: collection.uuid,
      profileUuid: collection.profileUuid,
      name: collection.name,
      dosage: collection.dosage,
      color: collection.color,
      priority: priorityFromInt(collection.priority),
      isActive: collection.isActive,
      stockQuantity: collection.stockQuantity,
      reorderThreshold: collection.reorderThreshold,
      foodInstruction: foodInstructionFromInt(collection.foodInstruction),
      imagePath: collection.imagePath,
      createdAt: collection.createdAt,
      updatedAt: collection.updatedAt,
    );
  }

  static MedicationCollection toCollection(
    MedicationModel model, {
    Id isarId = Isar.autoIncrement,
  }) {
    return MedicationCollection()
      ..id = isarId
      ..uuid = model.uuid
      ..profileUuid = model.profileUuid
      ..name = model.name
      ..dosage = model.dosage
      ..color = model.color
      ..priority = model.priority.index
      ..isActive = model.isActive
      ..stockQuantity = model.stockQuantity
      ..reorderThreshold = model.reorderThreshold
      ..foodInstruction = model.foodInstruction.index
      ..imagePath = model.imagePath
      ..createdAt = model.createdAt
      ..updatedAt = model.updatedAt
      ..isDeleted = false;
  }

  static MedicationCollection fromAddModel({
    required String uuid,
    required String profileUuid,
    required String name,
    required String dosage,
    required String color,
    required MedicationPriority priority,
    required bool isActive,
    int? stockQuantity,
    int? reorderThreshold,
    FoodInstruction foodInstruction = FoodInstruction.none,
    String? imagePath,
    required DateTime now,
  }) {
    return MedicationCollection()
      ..uuid = uuid
      ..profileUuid = profileUuid
      ..name = name
      ..dosage = dosage
      ..color = color
      ..priority = priority.index
      ..isActive = isActive
      ..stockQuantity = stockQuantity
      ..reorderThreshold = reorderThreshold
      ..foodInstruction = foodInstruction.index
      ..imagePath = imagePath
      ..createdAt = now
      ..updatedAt = now
      ..isDeleted = false;
  }

  static MedicationField toFieldWithSchedule(
    MedicationModel medication,
    MedicationScheduleModel? schedule,
  ) {
    return MedicationField(
      id: medication.uuid,
      profileUuid: medication.profileUuid,
      name: medication.name,
      dosage: medication.dosage,
      color: medication.color,
      priority: medication.priority,
      repeatType: schedule?.repeatType ?? RepeatType.daily,
      weekdays: schedule?.weekdays ?? [],
      interval: schedule?.interval ?? 1,
      startDate: schedule?.startDate ?? medication.createdAt,
      endDate: schedule?.endDate,
      isActive: medication.isActive,
      stockQuantity: medication.stockQuantity,
      reorderThreshold: medication.reorderThreshold,
      foodInstruction: medication.foodInstruction,
      imagePath: medication.imagePath,
      minutesFromMidnight: schedule?.minutesFromMidnight ?? 480,
    );
  }

  static MedicationPriority priorityFromInt(int value) {
    return MedicationPriority.values[value.clamp(
      0,
      MedicationPriority.values.length - 1,
    )];
  }

  static RepeatType repeatTypeFromInt(int value) {
    return RepeatType.values[value.clamp(0, RepeatType.values.length - 1)];
  }

  static DoseStatus doseStatusFromInt(int value) {
    return DoseStatus.values[value.clamp(0, DoseStatus.values.length - 1)];
  }

  static FoodInstruction foodInstructionFromInt(int value) {
    return FoodInstruction.values[value.clamp(0, FoodInstruction.values.length - 1)];
  }
}
