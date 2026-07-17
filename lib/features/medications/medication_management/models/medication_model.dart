import 'package:dart_mappable/dart_mappable.dart';
import 'enums/medication_enums.dart';

part 'medication_model.mapper.dart';

@MappableClass()
class MedicationModel with MedicationModelMappable {
  final String uuid;
  final String name;
  final String dosage;
  final String color;
  final MedicationPriority priority;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MedicationModel({
    required this.uuid,
    required this.name,
    required this.dosage,
    required this.color,
    required this.priority,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}
