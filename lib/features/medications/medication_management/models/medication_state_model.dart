import 'package:dart_mappable/dart_mappable.dart';
import 'enums/medication_enums.dart';

part 'medication_state_model.mapper.dart';

@MappableClass()
class MedicationStateModel with MedicationStateModelMappable {
  final String? id;
  final String? name;
  final String? dosage;
  final String? color;
  final MedicationPriority priority;
  final RepeatType repeatType;
  final List<int> weekdays;
  final int interval;
  final DateTime? startDate;
  final DateTime? endDate;
  final int minutesFromMidnight;
  final bool isActive;
  final int? stockQuantity;
  final int? reorderThreshold;

  const MedicationStateModel({
    this.id,
    this.name,
    this.dosage,
    this.color,
    this.priority = MedicationPriority.low,
    this.repeatType = RepeatType.daily,
    this.weekdays = const [],
    this.interval = 1,
    this.startDate,
    this.endDate,
    this.minutesFromMidnight = 480,
    this.isActive = true,
    this.stockQuantity,
    this.reorderThreshold,
  });

  factory MedicationStateModel.empty() {
    return const MedicationStateModel();
  }
}
