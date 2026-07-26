import 'package:dart_mappable/dart_mappable.dart';
import 'package:medication_reminder/core/utils/time_formatter.dart';
import 'enums/medication_enums.dart';

part 'medication_schedule_list_model.mapper.dart';

@MappableClass()
class MedicationScheduleListModel with MedicationScheduleListModelMappable {
  final String uuid;
  final String medicationUuid;
  final int minutesFromMidnight;
  final RepeatType repeatType;
  final List<int> weekdays;
  final int interval;
  final DateTime startDate;
  final DateTime? endDate;

  const MedicationScheduleListModel({
    required this.uuid,
    required this.medicationUuid,
    required this.minutesFromMidnight,
    required this.repeatType,
    required this.weekdays,
    required this.interval,
    required this.startDate,
    this.endDate,
  });

  String formatTime({bool isArabic = true}) {
    return AppTimeFormatter.formatMinutesFromMidnight(
      minutesFromMidnight,
      isArabic: isArabic,
    );
  }

  String get formattedTime => formatTime();
}
