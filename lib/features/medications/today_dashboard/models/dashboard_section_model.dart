import 'dashboard_enums.dart';
import 'dashboard_medication_model.dart';

class DashboardSectionModel {
  final DashboardSectionType type;
  final List<DashboardMedicationModel> medications;

  const DashboardSectionModel({required this.type, required this.medications});

  bool get isEmpty => medications.isEmpty;
  int get count => medications.length;
}
