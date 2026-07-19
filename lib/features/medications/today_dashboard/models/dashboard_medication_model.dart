import 'package:medication_reminder/features/medications/medication_management/models/enums/medication_enums.dart';
import 'dashboard_enums.dart';

class DashboardMedicationModel {
  final String medicationUuid;
  final String scheduleUuid;
  final String name;
  final String dosage;
  final String color;
  final MedicationPriority priority;
  final DateTime scheduledTime;
  final DoseStatus doseStatus;
  final String? doseLogUuid;
  final bool isOverdue;
  final String? remainingTimeText;

  const DashboardMedicationModel({
    required this.medicationUuid,
    required this.scheduleUuid,
    required this.name,
    required this.dosage,
    required this.color,
    required this.priority,
    required this.scheduledTime,
    required this.doseStatus,
    this.doseLogUuid,
    required this.isOverdue,
    this.remainingTimeText,
  });

  DashboardSectionType get section {
    if (doseStatus == DoseStatus.taken || doseStatus == DoseStatus.skipped) {
      return DashboardSectionType.completed;
    }
    if (doseStatus == DoseStatus.missed || isOverdue) {
      return DashboardSectionType.overdue;
    }
    return DashboardSectionType.upcoming;
  }

  DashboardMedicationModel copyWith({
    DoseStatus? doseStatus,
    String? doseLogUuid,
    bool? isOverdue,
    String? remainingTimeText,
  }) {
    return DashboardMedicationModel(
      medicationUuid: medicationUuid,
      scheduleUuid: scheduleUuid,
      name: name,
      dosage: dosage,
      color: color,
      priority: priority,
      scheduledTime: scheduledTime,
      doseStatus: doseStatus ?? this.doseStatus,
      doseLogUuid: doseLogUuid ?? this.doseLogUuid,
      isOverdue: isOverdue ?? this.isOverdue,
      remainingTimeText: remainingTimeText ?? this.remainingTimeText,
    );
  }
}
