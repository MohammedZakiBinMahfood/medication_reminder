import 'package:app_platform_core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:medication_reminder/features/medications/medication_management/models/dose_log_model.dart';
import '../../../profiles/providers/profile_providers.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/services/uuid_service.dart';
import '../../medication_management/data/collections/medication_collection.dart';
import '../../medication_management/data/collections/medication_schedule_collection.dart';
import '../../medication_management/data/collections/dose_log_collection.dart';
import '../../medication_management/data/mappers/medication_mapper.dart';
import '../../medication_management/data/mappers/dose_log_mapper.dart';
import '../../medication_management/models/enums/medication_enums.dart';
import '../models/dashboard_state_model.dart';
import '../models/dashboard_medication_model.dart';
import '../models/dashboard_section_model.dart';
import '../models/dashboard_summary_model.dart';
import '../models/dashboard_filter_model.dart';
import '../models/dashboard_enums.dart';
import '../../../../core/widgets/home_widget_sync_service.dart';
import 'today_dashboard_repository.dart';

final todayDashboardRepositoryProvider = Provider<TodayDashboardRepository>(
  (ref) {
    final profileUuid = ref.watch(activeProfileUuidProvider).value ?? '';
    return TodayDashboardRepositoryImpl(
      isar: ref.read(isarProvider),
      profileUuid: profileUuid,
    );
  },
);

class TodayDashboardRepositoryImpl implements TodayDashboardRepository {
  final Isar isar;
  final String profileUuid;

  TodayDashboardRepositoryImpl({
    required this.isar,
    required this.profileUuid,
  });

  @override
  Future<Result<DashboardStateModel>> getTodayDashboard({
    DashboardFilterModel? filter,
  }) async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final tomorrow = today.add(const Duration(days: 1));

      final medications = await isar.medicationCollections
          .where()
          .filter()
          .profileUuidEqualTo(profileUuid)
          .isActiveEqualTo(true)
          .isDeletedEqualTo(false)
          .findAll();

      final medicationUuids = medications.map((m) => m.uuid).toList();
      if (medicationUuids.isEmpty) {
        return Success(DashboardStateModel.empty());
      }

      final allSchedules = await isar.medicationScheduleCollections
          .where()
          .filter()
          .profileUuidEqualTo(profileUuid)
          .isDeletedEqualTo(false)
          .findAll();

      // Only keep schedules belonging to active medications.
      final activeMedUuidSet = medicationUuids.toSet();
      final todaySchedules = <MedicationScheduleCollection>[];
      for (final schedule in allSchedules) {
        if (!activeMedUuidSet.contains(schedule.medicationUuid)) continue;
        if (schedule.startDate.isAfter(tomorrow)) continue;
        if (schedule.endDate != null && schedule.endDate!.isBefore(today)) {
          continue;
        }
        if (_isScheduleActiveToday(schedule, today)) {
          todaySchedules.add(schedule);
        }
      }

      // Filter dose logs by today's date range at DB level (avoids full scan).
      final doseLogs = await isar.doseLogCollections
          .where()
          .filter()
          .profileUuidEqualTo(profileUuid)
          .isDeletedEqualTo(false)
          .scheduledAtGreaterThan(today, include: true)
          .scheduledAtLessThan(tomorrow, include: false)
          .findAll();

      final doseLogMap = <String, DoseLogCollection>{};
      for (final log in doseLogs) {
        final key =
            '${log.medicationUuid}_${log.scheduleUuid}_${log.scheduledAt.hour}_${log.scheduledAt.minute}';
        doseLogMap[key] = log;
      }

      final medicationMap = <String, MedicationCollection>{
        for (final m in medications) m.uuid: m,
      };

      final dashboardMedications = <DashboardMedicationModel>[];
      for (final schedule in todaySchedules) {
        final medication = medicationMap[schedule.medicationUuid];
        if (medication == null) continue;

        final scheduledTime = DateTime(
          today.year,
          today.month,
          today.day,
          schedule.minutesFromMidnight ~/ 60,
          schedule.minutesFromMidnight % 60,
        );

        final logKey =
            '${schedule.medicationUuid}_${schedule.uuid}_${scheduledTime.hour}_${scheduledTime.minute}';
        final existingLog = doseLogMap[logKey];

        DoseStatus doseStatus;
        String? doseLogUuid;
        if (existingLog != null) {
          doseStatus = MedicationMapper.doseStatusFromInt(existingLog.status);
          doseLogUuid = existingLog.uuid;
        } else {
          doseStatus = now.isAfter(scheduledTime)
              ? DoseStatus.missed
              : DoseStatus.pending;
        }

        final isOverdue =
            doseStatus == DoseStatus.missed ||
            (doseStatus == DoseStatus.pending && now.isAfter(scheduledTime));
        final remainingText = _buildRemainingTimeText(now, scheduledTime);

        dashboardMedications.add(
          DashboardMedicationModel(
            medicationUuid: schedule.medicationUuid,
            scheduleUuid: schedule.uuid,
            name: medication.name,
            dosage: medication.dosage,
            color: medication.color,
            priority: MedicationMapper.priorityFromInt(medication.priority),
            scheduledTime: scheduledTime,
            doseStatus: doseStatus,
            doseLogUuid: doseLogUuid,
            isOverdue: isOverdue,
            remainingTimeText: remainingText,
            stockQuantity: medication.stockQuantity,
            reorderThreshold: medication.reorderThreshold,
            foodInstruction: MedicationMapper.foodInstructionFromInt(
              medication.foodInstruction,
            ),
            imagePath: medication.imagePath,
          ),
        );
      }

      final sortedAll = _applySort(dashboardMedications, filter?.sortType);
      final summary = _buildSummary(sortedAll);

      // Synchronize with Home Screen Widget asynchronously
      HomeWidgetSyncService.syncNextMedication(
        nextMedication: summary.nextMedication,
        summary: summary,
      );

      final filtered = _applyFilter(dashboardMedications, filter?.filterType);
      final filteredSorted = _applySort(filtered, filter?.sortType);
      final sections = _buildSections(filteredSorted);

      final isFiltered =
          filter?.filterType != null &&
          filter!.filterType != DashboardFilterType.all;

      return Success(
        DashboardStateModel(
          sections: sections,
          summary: summary,
          isFiltered: isFiltered,
        ),
      );
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  bool _isScheduleActiveToday(
    MedicationScheduleCollection schedule,
    DateTime today,
  ) {
    switch (schedule.repeatType) {
      case 0: // daily
        return true;
      case 1: // specificDays
        final todayWeekday = today.weekday;
        return schedule.weekdays.contains(todayWeekday);
      case 3: // interval
        final daysSinceStart = today.difference(schedule.startDate).inDays;
        return daysSinceStart >= 0 && daysSinceStart % schedule.interval == 0;
      default:
        return false;
    }
  }

  List<DashboardMedicationModel> _applyFilter(
    List<DashboardMedicationModel> medications,
    DashboardFilterType? filterType,
  ) {
    if (filterType == null || filterType == DashboardFilterType.all) {
      return medications;
    }
    return medications.where((m) {
      switch (filterType) {
        case DashboardFilterType.all:
          return true;
        case DashboardFilterType.upcoming:
          return m.section == DashboardSectionType.upcoming;
        case DashboardFilterType.completed:
          return m.section == DashboardSectionType.completed;
        case DashboardFilterType.missed:
          return m.doseStatus == DoseStatus.missed;
        case DashboardFilterType.critical:
          return m.priority == MedicationPriority.high;
        case DashboardFilterType.normal:
          return m.priority == MedicationPriority.medium;
        case DashboardFilterType.low:
          return m.priority == MedicationPriority.low;
      }
    }).toList();
  }

  List<DashboardMedicationModel> _applySort(
    List<DashboardMedicationModel> medications,
    DashboardSortType? sortType,
  ) {
    final sorted = List<DashboardMedicationModel>.from(medications);
    switch (sortType) {
      case DashboardSortType.time:
        sorted.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
      case DashboardSortType.priority:
        sorted.sort((a, b) => b.priority.index.compareTo(a.priority.index));
      case DashboardSortType.name:
        sorted.sort((a, b) => a.name.compareTo(b.name));
      case null:
        sorted.sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
    }
    return sorted;
  }

  List<DashboardSectionModel> _buildSections(
    List<DashboardMedicationModel> medications,
  ) {
    final overdue = <DashboardMedicationModel>[];
    final upcoming = <DashboardMedicationModel>[];
    final completed = <DashboardMedicationModel>[];

    for (final m in medications) {
      switch (m.section) {
        case DashboardSectionType.overdue:
          overdue.add(m);
        case DashboardSectionType.upcoming:
          upcoming.add(m);
        case DashboardSectionType.completed:
          completed.add(m);
      }
    }

    return [
      if (overdue.isNotEmpty)
        DashboardSectionModel(
          type: DashboardSectionType.overdue,
          medications: overdue,
        ),
      if (upcoming.isNotEmpty)
        DashboardSectionModel(
          type: DashboardSectionType.upcoming,
          medications: upcoming,
        ),
      if (completed.isNotEmpty)
        DashboardSectionModel(
          type: DashboardSectionType.completed,
          medications: completed,
        ),
    ];
  }

  DashboardSummaryModel _buildSummary(
    List<DashboardMedicationModel> medications,
  ) {
    final completed = medications
        .where(
          (m) =>
              m.doseStatus == DoseStatus.taken ||
              m.doseStatus == DoseStatus.skipped,
        )
        .length;
    final missed = medications
        .where((m) => m.doseStatus == DoseStatus.missed || m.isOverdue)
        .length;
    final upcoming = medications
        .where((m) => m.doseStatus == DoseStatus.pending && !m.isOverdue)
        .length;

    final now = DateTime.now();
    final nextMed = medications
        .where(
          (m) =>
              m.scheduledTime.isAfter(now) &&
              m.doseStatus == DoseStatus.pending,
        )
        .fold<DashboardMedicationModel?>(
          null,
          (prev, m) =>
              prev == null || m.scheduledTime.isBefore(prev.scheduledTime)
              ? m
              : prev,
        );

    return DashboardSummaryModel(
      totalMedications: medications.length,
      completed: completed,
      missed: missed,
      upcoming: upcoming,
      nextMedication: nextMed,
    );
  }

  String? _buildRemainingTimeText(DateTime now, DateTime scheduledTime) {
    if (now.isAfter(scheduledTime)) return null;
    final diff = scheduledTime.difference(now);
    if (diff.inHours > 0) {
      return '${diff.inHours}س ${diff.inMinutes % 60}د';
    }
    return '${diff.inMinutes}د';
  }

  @override
  Future<Result<DoseLogModel>> markDose({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
    required DoseStatus status,
  }) async {
    try {
      final now = DateTime.now();
      final logKey =
          '${medicationUuid}_${scheduleUuid}_${scheduledAt.hour}_${scheduledAt.minute}';

      final existing = await isar.doseLogCollections
          .where()
          .filter()
          .medicationUuidEqualTo(medicationUuid)
          .scheduleUuidEqualTo(scheduleUuid)
          .isDeletedEqualTo(false)
          .findAll();

      DoseLogCollection? existingLog;
      for (final log in existing) {
        final logKeyCheck =
            '${log.medicationUuid}_${log.scheduleUuid}_${log.scheduledAt.hour}_${log.scheduledAt.minute}';
        if (logKeyCheck == logKey) {
          existingLog = log;
          break;
        }
      }

      DoseLogCollection collection;
      if (existingLog != null) {
        existingLog
          ..status = status.index
          ..actionAt = now
          ..updatedAt = now;
        collection = existingLog;
      } else {
        final medResult = await isar.medicationCollections
            .where()
            .filter()
            .uuidEqualTo(medicationUuid)
            .findFirst();
        final profileUuid = medResult?.profileUuid ?? '';

        collection = DoseLogMapper.fromModel(
          uuid: UuidService.generate(),
          profileUuid: profileUuid,
          medicationUuid: medicationUuid,
          scheduleUuid: scheduleUuid,
          scheduledAt: scheduledAt,
          status: status,
          now: now,
        );
        collection.actionAt = now;
      }

      await isar.writeTxn(() async {
        await isar.doseLogCollections.put(collection);

        if (status == DoseStatus.taken) {
          final medication = await isar.medicationCollections
              .where()
              .filter()
              .uuidEqualTo(medicationUuid)
              .findFirst();

          if (medication != null &&
              medication.stockQuantity != null &&
              medication.stockQuantity! > 0) {
            medication.stockQuantity = medication.stockQuantity! - 1;
            medication.updatedAt = now;
            await isar.medicationCollections.put(medication);
          }
        }
      });

      return Success(DoseLogMapper.toDomain(collection));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<DoseLogModel>> snoozeDose({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
    required int snoozeMinutes,
  }) async {
    return markDose(
      medicationUuid: medicationUuid,
      scheduleUuid: scheduleUuid,
      scheduledAt: scheduledAt,
      status: DoseStatus.pending,
    );
  }

  @override
  Future<Result<DoseLogModel>> getDoseLog({
    required String medicationUuid,
    required String scheduleUuid,
    required DateTime scheduledAt,
  }) async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      final logs = await isar.doseLogCollections
          .where()
          .filter()
          .medicationUuidEqualTo(medicationUuid)
          .scheduleUuidEqualTo(scheduleUuid)
          .isDeletedEqualTo(false)
          .findAll();

      final logKey =
          '${medicationUuid}_${scheduleUuid}_${scheduledAt.hour}_${scheduledAt.minute}';

      for (final log in logs) {
        final logDay = DateTime(
          log.scheduledAt.year,
          log.scheduledAt.month,
          log.scheduledAt.day,
        );
        if (!logDay.isAtSameMomentAs(today)) continue;
        final logKeyCheck =
            '${log.medicationUuid}_${log.scheduleUuid}_${log.scheduledAt.hour}_${log.scheduledAt.minute}';
        if (logKeyCheck == logKey) {
          return Success(DoseLogMapper.toDomain(log));
        }
      }

      final medResult = await isar.medicationCollections
          .where()
          .filter()
          .uuidEqualTo(medicationUuid)
          .findFirst();
      final profileUuid = medResult?.profileUuid ?? '';

      final newLog = DoseLogMapper.fromModel(
        uuid: UuidService.generate(),
        profileUuid: profileUuid,
        medicationUuid: medicationUuid,
        scheduleUuid: scheduleUuid,
        scheduledAt: scheduledAt,
        status: DoseStatus.pending,
        now: now,
      );

      await isar.writeTxn(() async {
        await isar.doseLogCollections.put(newLog);
      });

      return Success(DoseLogMapper.toDomain(newLog));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }
}
