import 'dashboard_medication_model.dart';
import 'dashboard_section_model.dart';
import 'dashboard_summary_model.dart';

class DashboardStateModel {
  final List<DashboardSectionModel> sections;
  final DashboardSummaryModel summary;
  final bool isLoading;
  final bool isFiltered;

  const DashboardStateModel({
    required this.sections,
    required this.summary,
    this.isLoading = false,
    this.isFiltered = false,
  });

  factory DashboardStateModel.empty() {
    return DashboardStateModel(
      sections: const [],
      summary: DashboardSummaryModel.empty(),
    );
  }

  factory DashboardStateModel.loading() {
    return DashboardStateModel(
      sections: const [],
      summary: DashboardSummaryModel.empty(),
      isLoading: true,
    );
  }

  List<DashboardMedicationModel> get allMedications {
    return sections.expand((s) => s.medications).toList();
  }

  bool get isEmpty => allMedications.isEmpty;

  DashboardStateModel copyWith({
    List<DashboardSectionModel>? sections,
    DashboardSummaryModel? summary,
    bool? isLoading,
    bool? isFiltered,
  }) {
    return DashboardStateModel(
      sections: sections ?? this.sections,
      summary: summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      isFiltered: isFiltered ?? this.isFiltered,
    );
  }
}
