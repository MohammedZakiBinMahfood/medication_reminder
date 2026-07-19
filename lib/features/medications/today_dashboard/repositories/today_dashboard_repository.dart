import 'package:app_platform_core/core.dart';
import 'package:medication_reminder/features/medications/medication_management/models/enums/medication_enums.dart';
import '../models/dashboard_state_model.dart';
import '../models/dashboard_filter_model.dart';
import '../../medication_management/models/dose_log_model.dart';

abstract class TodayDashboardRepository {
  Future<Result<DashboardStateModel>> getTodayDashboard({
    DashboardFilterModel? filter,
  });

  Future<Result<DoseLogModel>> markDose({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
    required DoseStatus status,
  });

  Future<Result<DoseLogModel>> snoozeDose({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
    required int snoozeMinutes,
  });

  Future<Result<DoseLogModel>> getDoseLog({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
  });
}
