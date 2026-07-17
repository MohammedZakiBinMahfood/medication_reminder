import 'package:dart_mappable/dart_mappable.dart';
import 'enums/medication_enums.dart';

part 'medication_field.mapper.dart';

@MappableClass()
class MedicationField with MedicationFieldMappable {
  final String id;
  final String name;
  final String dosage;
  final String color;
  final MedicationPriority priority;
  final RepeatType repeatType;
  final List<int> weekdays;
  final int interval;
  final DateTime startDate;
  final DateTime? endDate;
  final bool isActive;

  const MedicationField({
    required this.id,
    required this.name,
    required this.dosage,
    required this.color,
    required this.priority,
    required this.repeatType,
    required this.weekdays,
    required this.interval,
    required this.startDate,
    this.endDate,
    required this.isActive,
  });
}
