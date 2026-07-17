import 'package:isar/isar.dart';
import '../collections/medication_schedule_collection.dart';
import '../../models/enums/medication_enums.dart';
import '../../models/medication_schedule_model.dart';

class MedicationScheduleMapper {
  MedicationScheduleMapper._();

  static MedicationScheduleModel toDomain(
    MedicationScheduleCollection collection,
  ) {
    return MedicationScheduleModel(
      uuid: collection.uuid,
      medicationUuid: collection.medicationUuid,
      minutesFromMidnight: collection.minutesFromMidnight,
      repeatType: _repeatTypeFromInt(collection.repeatType),
      weekdays: collection.weekdays.cast<int>().toList(),
      interval: collection.interval,
      startDate: collection.startDate,
      endDate: collection.endDate,
      createdAt: collection.createdAt,
      updatedAt: collection.updatedAt,
    );
  }

  static MedicationScheduleCollection toCollection(
    MedicationScheduleModel model, {
    Id isarId = Isar.autoIncrement,
  }) {
    return MedicationScheduleCollection()
      ..id = isarId
      ..uuid = model.uuid
      ..medicationUuid = model.medicationUuid
      ..minutesFromMidnight = model.minutesFromMidnight
      ..repeatType = model.repeatType.index
      ..weekdays = model.weekdays.toList()
      ..interval = model.interval
      ..startDate = model.startDate
      ..endDate = model.endDate
      ..createdAt = model.createdAt
      ..updatedAt = model.updatedAt
      ..isDeleted = false;
  }

  static MedicationScheduleCollection fromAddModel({
    required String uuid,
    required String medicationUuid,
    required int minutesFromMidnight,
    required RepeatType repeatType,
    required List<int> weekdays,
    required int interval,
    required DateTime startDate,
    DateTime? endDate,
    required DateTime now,
  }) {
    return MedicationScheduleCollection()
      ..uuid = uuid
      ..medicationUuid = medicationUuid
      ..minutesFromMidnight = minutesFromMidnight
      ..repeatType = repeatType.index
      ..weekdays = weekdays.toList()
      ..interval = interval
      ..startDate = startDate
      ..endDate = endDate
      ..createdAt = now
      ..updatedAt = now
      ..isDeleted = false;
  }

  static RepeatType _repeatTypeFromInt(int value) {
    return RepeatType.values[value.clamp(0, RepeatType.values.length - 1)];
  }
}
