import 'package:isar/isar.dart';
import '../collections/medication_collection.dart';
import '../collections/medication_schedule_collection.dart';
import '../../models/enums/medication_enums.dart';
import '../../models/medication_model.dart';
import '../../models/medication_field.dart';

class MedicationMapper {
  MedicationMapper._();

  static MedicationModel toDomain(MedicationCollection collection) {
    return MedicationModel(
      uuid: collection.uuid,
      name: collection.name,
      dosage: collection.dosage,
      color: collection.color,
      priority: priorityFromInt(collection.priority),
      isActive: collection.isActive,
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
      ..name = model.name
      ..dosage = model.dosage
      ..color = model.color
      ..priority = model.priority.index
      ..isActive = model.isActive
      ..createdAt = model.createdAt
      ..updatedAt = model.updatedAt
      ..isDeleted = false;
  }

  static MedicationCollection fromAddModel({
    required String uuid,
    required String name,
    required String dosage,
    required String color,
    required MedicationPriority priority,
    required bool isActive,
    required DateTime now,
  }) {
    return MedicationCollection()
      ..uuid = uuid
      ..name = name
      ..dosage = dosage
      ..color = color
      ..priority = priority.index
      ..isActive = isActive
      ..createdAt = now
      ..updatedAt = now
      ..isDeleted = false;
  }

  static MedicationField toFieldWithSchedule(
    MedicationModel medication,
    MedicationScheduleCollection? schedule,
  ) {
    return MedicationField(
      id: medication.uuid,
      name: medication.name,
      dosage: medication.dosage,
      color: medication.color,
      priority: medication.priority,
      repeatType: repeatTypeFromInt(schedule?.repeatType ?? 0),
      weekdays: schedule?.weekdays.cast<int>().toList() ?? [],
      interval: schedule?.interval ?? 1,
      startDate: schedule?.startDate ?? medication.createdAt,
      endDate: schedule?.endDate,
      isActive: medication.isActive,
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
}
