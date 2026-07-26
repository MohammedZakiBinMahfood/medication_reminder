import 'package:dart_mappable/dart_mappable.dart';
import 'package:medication_reminder/core/utils/time_formatter.dart';
import '../../medication_management/models/enums/medication_enums.dart';

part 'history_item_model.mapper.dart';

@MappableClass()
class HistoryItemModel with HistoryItemModelMappable {
  final String doseLogUuid;
  final String medicationUuid;
  final String scheduleUuid;
  final String medicationName;
  final String dosage;
  final String medicationColor;
  final MedicationPriority priority;
  final DoseStatus status;
  final DateTime scheduledAt;
  final DateTime? actionAt;
  final DateTime createdAt;

  const HistoryItemModel({
    required this.doseLogUuid,
    required this.medicationUuid,
    required this.scheduleUuid,
    required this.medicationName,
    required this.dosage,
    required this.medicationColor,
    required this.priority,
    required this.status,
    required this.scheduledAt,
    this.actionAt,
    required this.createdAt,
  });

  String get formattedDate {
    final day = scheduledAt.day.toString().padLeft(2, '0');
    final month = scheduledAt.month.toString().padLeft(2, '0');
    return '$day/$month/${scheduledAt.year}';
  }

  String formatTime({bool isArabic = true}) {
    return AppTimeFormatter.formatDateTime(scheduledAt, isArabic: isArabic);
  }

  String get formattedTime => formatTime();

  String formatActionTime({bool isArabic = true}) {
    if (actionAt == null) return '';
    return AppTimeFormatter.formatDateTime(actionAt!, isArabic: isArabic);
  }

  String get formattedActionTime => formatActionTime();
}
