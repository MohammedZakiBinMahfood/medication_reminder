import 'package:dart_mappable/dart_mappable.dart';
import 'enums/medication_enums.dart';

part 'medication_schedule_add_model.mapper.dart';

@MappableClass()
class MedicationScheduleAddModel with MedicationScheduleAddModelMappable {
  final String medicationUuid;
  final int minutesFromMidnight;
  final RepeatType repeatType;
  final List<int> weekdays;
  final int interval;
  final DateTime startDate;
  final DateTime? endDate;

  const MedicationScheduleAddModel({
    required this.medicationUuid,
    required this.minutesFromMidnight,
    required this.repeatType,
    required this.weekdays,
    required this.interval,
    required this.startDate,
    this.endDate,
  });
}
