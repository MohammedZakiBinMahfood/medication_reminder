import 'package:isar_community/isar.dart';
import '../collections/dose_log_collection.dart';
import '../../models/enums/medication_enums.dart';
import '../../models/dose_log_model.dart';

class DoseLogMapper {
  DoseLogMapper._();

  static DoseLogModel toDomain(DoseLogCollection collection) {
    return DoseLogModel(
      uuid: collection.uuid,
      profileUuid: collection.profileUuid,
      medicationUuid: collection.medicationUuid,
      scheduleUuid: collection.scheduleUuid,
      scheduledAt: collection.scheduledAt,
      actionAt: collection.actionAt,
      status: _statusFromInt(collection.status),
      createdAt: collection.createdAt,
      updatedAt: collection.updatedAt,
    );
  }

  static DoseLogCollection toCollection(
    DoseLogModel model, {
    Id isarId = Isar.autoIncrement,
  }) {
    return DoseLogCollection()
      ..id = isarId
      ..uuid = model.uuid
      ..profileUuid = model.profileUuid
      ..medicationUuid = model.medicationUuid
      ..scheduleUuid = model.scheduleUuid
      ..scheduledAt = model.scheduledAt
      ..actionAt = model.actionAt
      ..status = model.status.index
      ..createdAt = model.createdAt
      ..updatedAt = model.updatedAt
      ..isDeleted = false;
  }

  static DoseLogCollection fromModel({
    required String uuid,
    required String profileUuid,
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
    required DoseStatus status,
    required DateTime now,
  }) {
    return DoseLogCollection()
      ..uuid = uuid
      ..profileUuid = profileUuid
      ..medicationUuid = medicationUuid
      ..scheduleUuid = scheduleUuid
      ..scheduledAt = scheduledAt
      ..actionAt = null
      ..status = status.index
      ..createdAt = now
      ..updatedAt = now
      ..isDeleted = false;
  }

  static DoseStatus _statusFromInt(int value) {
    return DoseStatus.values[value.clamp(0, DoseStatus.values.length - 1)];
  }
}
