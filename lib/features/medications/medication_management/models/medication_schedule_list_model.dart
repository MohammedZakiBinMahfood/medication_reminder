import 'package:dart_mappable/dart_mappable.dart';
import 'enums/medication_enums.dart';

part 'medication_schedule_list_model.mapper.dart';

@MappableClass()
class MedicationScheduleListModel with MedicationScheduleListModelMappable {
  final String id;
  final String medicationUuid;
  final int minutesFromMidnight;
  final RepeatType repeatType;
  final List<int> weekdays;
  final int interval;
  final DateTime startDate;
  final DateTime? endDate;

  const MedicationScheduleListModel({
    required this.id,
    required this.medicationUuid,
    required this.minutesFromMidnight,
    required this.repeatType,
    required this.weekdays,
    required this.interval,
    required this.startDate,
    this.endDate,
  });

  String get formattedTime {
    final hours = minutesFromMidnight ~/ 60;
    final minutes = minutesFromMidnight % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }
}
