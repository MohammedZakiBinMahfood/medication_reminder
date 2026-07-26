import 'package:dart_mappable/dart_mappable.dart';
import '../enums/medication_enums.dart';

part 'medication_edit_model.mapper.dart';

@MappableClass()
class MedicationEditModel with MedicationEditModelMappable {
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

  const MedicationEditModel({
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
  });
}
