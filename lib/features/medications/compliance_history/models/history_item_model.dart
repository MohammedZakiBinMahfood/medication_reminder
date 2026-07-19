import '../../medication_management/models/enums/medication_enums.dart';

class HistoryItemModel {
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

  String get formattedTime {
    final hours = scheduledAt.hour.toString().padLeft(2, '0');
    final minutes = scheduledAt.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  String get formattedActionTime {
    if (actionAt == null) return '';
    final hours = actionAt!.hour.toString().padLeft(2, '0');
    final minutes = actionAt!.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }
}
