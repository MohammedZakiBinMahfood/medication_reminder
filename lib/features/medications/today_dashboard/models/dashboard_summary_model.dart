import 'dashboard_medication_model.dart';

class DashboardSummaryModel {
  final int totalMedications;
  final int completed;
  final int missed;
  final int upcoming;
  final DashboardMedicationModel? nextMedication;

  const DashboardSummaryModel({
    required this.totalMedications,
    required this.completed,
    required this.missed,
    required this.upcoming,
    this.nextMedication,
  });

  double get completionPercentage =>
      totalMedications > 0 ? (completed / totalMedications) * 100 : 0.0;

  factory DashboardSummaryModel.empty() {
    return const DashboardSummaryModel(
      totalMedications: 0,
      completed: 0,
      missed: 0,
      upcoming: 0,
    );
  }
}
