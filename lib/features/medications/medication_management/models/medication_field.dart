import 'package:dart_mappable/dart_mappable.dart';
import 'enums/medication_enums.dart';

part 'medication_field.mapper.dart';

@MappableClass()
class MedicationField with MedicationFieldMappable {
  final String id;
  final String profileUuid;
  final String name;
  final String dosage;
  final String color;
  final MedicationPriority priority;
  final RepeatType repeatType;
  final List<int> weekdays;
  final int interval;
  final DateTime startDate;
  final DateTime? endDate;
  final int minutesFromMidnight;
  final bool isActive;
  final int? stockQuantity;
  final int? reorderThreshold;
  final FoodInstruction foodInstruction;
  final String? imagePath;

  const MedicationField({
    required this.id,
    required this.profileUuid,
    required this.name,
    required this.dosage,
    required this.color,
    required this.priority,
    required this.repeatType,
    required this.weekdays,
    required this.interval,
    required this.startDate,
    this.endDate,
    this.minutesFromMidnight = 480,
    required this.isActive,
    this.stockQuantity,
    this.reorderThreshold,
    this.foodInstruction = FoodInstruction.none,
    this.imagePath,
  });
}
