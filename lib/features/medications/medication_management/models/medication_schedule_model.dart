import 'package:dart_mappable/dart_mappable.dart';
import 'package:medication_reminder/core/utils/time_formatter.dart';
import 'enums/medication_enums.dart';

part 'medication_schedule_model.mapper.dart';

@MappableClass()
class MedicationScheduleModel with MedicationScheduleModelMappable {
  final String uuid;
  final String profileUuid;
  final String medicationUuid;
  final int minutesFromMidnight;
  final RepeatType repeatType;
  final List<int> weekdays;
  final int interval;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MedicationScheduleModel({
    required this.uuid,
    required this.profileUuid,
    required this.medicationUuid,
    required this.minutesFromMidnight,
    required this.repeatType,
    required this.weekdays,
    required this.interval,
    required this.startDate,
    this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  String formatTime({bool isArabic = true}) {
    return AppTimeFormatter.formatMinutesFromMidnight(
      minutesFromMidnight,
      isArabic: isArabic,
    );
  }

  String get formattedTime => formatTime();
}
