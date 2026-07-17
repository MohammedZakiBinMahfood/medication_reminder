import 'package:dart_mappable/dart_mappable.dart';
import 'enums/medication_enums.dart';

part 'medication_list_model.mapper.dart';

@MappableClass()
class MedicationListModel with MedicationListModelMappable {
  final String id;
  final String name;
  final String dosage;
  final String color;
  final MedicationPriority priority;
  final bool isActive;
  final DateTime? nextDoseTime;

  const MedicationListModel({
    required this.id,
    required this.name,
    required this.dosage,
    required this.color,
    required this.priority,
    required this.isActive,
    this.nextDoseTime,
  });
}
