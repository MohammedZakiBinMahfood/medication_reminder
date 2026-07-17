import 'package:app_platform_core/core.dart';
import '../models/models.dart';
import 'medication_filters.dart';

abstract class MedicationRepository {
  Future<Result<MedicationModel>> createMedication(MedicationAddModel model);

  Future<Result<MedicationModel>> updateMedication(MedicationEditModel model);

  Future<Result<void>> deleteMedication(String uuid);

  Future<Result<MedicationModel>> getMedication(String uuid);

  Future<Result<List<MedicationModel>>> getAllMedications();

  Future<Result<MedicationModel>> saveMedication(MedicationStateModel state);

  Future<Result<void>> activate(String uuid);

  Future<Result<void>> deactivate(String uuid);

  Future<Result<Paginated<MedicationListModel>>> getList({
    required Pagination pagination,
    MedicationFilters? filters,
  });

  Future<Result<List<MedicationScheduleModel>>> getSchedules(
    String medicationUuid,
  );

  Future<Result<void>> replaceSchedules(
    String medicationUuid,
    List<MedicationScheduleAddModel> schedules,
  );

  Future<Result<List<DoseLogModel>>> getDoseLogs(String medicationUuid);

  Future<Result<DoseLogModel>> logDose(DoseLogModel log);
}
