import 'package:dart_mappable/dart_mappable.dart';
import 'enums/medication_enums.dart';

part 'dose_log_model.mapper.dart';

@MappableClass()
class DoseLogModel with DoseLogModelMappable {
  final String uuid;
  final String medicationUuid;
  final String scheduleUuid;
  final DateTime scheduledAt;
  final DateTime? actionAt;
  final DoseStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DoseLogModel({
    required this.uuid,
    required this.medicationUuid,
    required this.scheduleUuid,
    required this.scheduledAt,
    this.actionAt,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
