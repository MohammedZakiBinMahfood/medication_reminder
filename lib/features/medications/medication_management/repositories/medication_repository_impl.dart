import 'package:app_platform_core/core.dart';
import 'package:isar_community/isar.dart';
import '../../../../core/services/uuid_service.dart';
import '../../../../core/constants/enums.dart';
import '../data/collections/medication_collection.dart';
import '../data/collections/medication_schedule_collection.dart';
import '../data/collections/dose_log_collection.dart';
import '../data/mappers/mappers.dart';
import '../models/models.dart';
import 'medication_repository.dart';
import 'medication_filters.dart';

class MedicationRepositoryImpl implements MedicationRepository {
  final Isar isar;

  MedicationRepositoryImpl({required this.isar});

  @override
  Future<Result<MedicationModel>> createMedication(
    MedicationAddModel model,
  ) async {
    try {
      final uuid = UuidService.generate();
      final now = DateTime.now();

      final medication = MedicationMapper.fromAddModel(
        uuid: uuid,
        name: model.name,
        dosage: model.dosage,
        color: model.color,
        priority: model.priority,
        isActive: model.isActive,
        now: now,
      );

      final scheduleUuid = UuidService.generate();
      final schedule = MedicationScheduleMapper.fromAddModel(
        uuid: scheduleUuid,
        medicationUuid: uuid,
        minutesFromMidnight: model.startDate.hour * 60 + model.startDate.minute,
        repeatType: model.repeatType,
        weekdays: model.weekdays,
        interval: model.interval,
        startDate: model.startDate,
        endDate: model.endDate,
        now: now,
      );

      await isar.writeTxn(() async {
        await isar.medicationCollections.put(medication);
        await isar.medicationScheduleCollections.put(schedule);
      });

      return Success(MedicationMapper.toDomain(medication));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<MedicationModel>> updateMedication(
    MedicationEditModel model,
  ) async {
    try {
      final now = DateTime.now();

      final existing = await isar.medicationCollections
          .where()
          .uuidEqualTo(model.id)
          .findFirst();

      if (existing == null) {
        return Failure(UnknownError('Medication not found'));
      }

      final medication = MedicationMapper.toCollection(
        MedicationModel(
          uuid: model.id,
          name: model.name,
          dosage: model.dosage,
          color: model.color,
          priority: model.priority,
          isActive: model.isActive,
          createdAt: existing.createdAt,
          updatedAt: now,
        ),
        isarId: existing.id,
      );

      final scheduleUuid = UuidService.generate();
      final schedule = MedicationScheduleMapper.fromAddModel(
        uuid: scheduleUuid,
        medicationUuid: model.id,
        minutesFromMidnight: model.startDate.hour * 60 + model.startDate.minute,
        repeatType: model.repeatType,
        weekdays: model.weekdays,
        interval: model.interval,
        startDate: model.startDate,
        endDate: model.endDate,
        now: now,
      );

      await isar.writeTxn(() async {
        await isar.medicationCollections.put(medication);

        final oldSchedules = await isar.medicationScheduleCollections
            .where()
            .filter()
            .medicationUuidEqualTo(model.id)
            .findAll();
        await isar.medicationScheduleCollections.deleteAll(
          oldSchedules.map((e) => e.id).toList(),
        );

        await isar.medicationScheduleCollections.put(schedule);
      });

      return Success(MedicationMapper.toDomain(medication));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteMedication(String uuid) async {
    try {
      final now = DateTime.now();

      final medication = await isar.medicationCollections
          .where()
          .uuidEqualTo(uuid)
          .findFirst();

      if (medication == null) {
        return Failure(UnknownError('Medication not found'));
      }

      medication
        ..isActive = false
        ..isDeleted = true
        ..updatedAt = now;

      final schedules = await isar.medicationScheduleCollections
          .where()
          .filter()
          .medicationUuidEqualTo(uuid)
          .findAll();

      final doseLogs = await isar.doseLogCollections
          .where()
          .filter()
          .medicationUuidEqualTo(uuid)
          .findAll();

      await isar.writeTxn(() async {
        await isar.medicationCollections.put(medication);

        for (final schedule in schedules) {
          schedule
            ..isDeleted = true
            ..updatedAt = now;
        }
        await isar.medicationScheduleCollections.putAll(schedules);

        for (final log in doseLogs) {
          log
            ..isDeleted = true
            ..updatedAt = now;
        }
        await isar.doseLogCollections.putAll(doseLogs);
      });

      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<MedicationModel>> getMedication(String uuid) async {
    try {
      final medication = await isar.medicationCollections
          .where()
          .uuidEqualTo(uuid)
          .findFirst();

      if (medication == null) {
        return Failure(UnknownError('Medication not found'));
      }

      return Success(MedicationMapper.toDomain(medication));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<List<MedicationModel>>> getAllMedications() async {
    try {
      final medications = await isar.medicationCollections
          .where()
          .filter()
          .isDeletedEqualTo(false)
          .isActiveEqualTo(true)
          .findAll();

      return Success(medications.map(MedicationMapper.toDomain).toList());
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<MedicationModel>> saveMedication(
    MedicationStateModel state,
  ) async {
    if (state.id != null) {
      final editModel = MedicationEditModel(
        id: state.id!,
        name: state.name ?? '',
        dosage: state.dosage ?? '',
        color: state.color ?? '#4F46E5',
        priority: state.priority,
        repeatType: state.repeatType,
        weekdays: state.weekdays,
        interval: state.interval,
        startDate: state.startDate ?? DateTime.now(),
        endDate: state.endDate,
        isActive: state.isActive,
      );
      return updateMedication(editModel);
    } else {
      final addModel = MedicationAddModel(
        name: state.name ?? '',
        dosage: state.dosage ?? '',
        color: state.color ?? '#4F46E5',
        priority: state.priority,
        repeatType: state.repeatType,
        weekdays: state.weekdays,
        interval: state.interval,
        startDate: state.startDate ?? DateTime.now(),
        endDate: state.endDate,
        isActive: state.isActive,
      );
      return createMedication(addModel);
    }
  }

  @override
  Future<Result<void>> activate(String uuid) async {
    try {
      final now = DateTime.now();

      final medication = await isar.medicationCollections
          .where()
          .uuidEqualTo(uuid)
          .findFirst();

      if (medication == null) {
        return Failure(UnknownError('Medication not found'));
      }

      medication
        ..isActive = true
        ..isDeleted = false
        ..updatedAt = now;

      await isar.writeTxn(() async {
        await isar.medicationCollections.put(medication);
      });

      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> deactivate(String uuid) async {
    try {
      final now = DateTime.now();

      final medication = await isar.medicationCollections
          .where()
          .uuidEqualTo(uuid)
          .findFirst();

      if (medication == null) {
        return Failure(UnknownError('Medication not found'));
      }

      medication
        ..isActive = false
        ..updatedAt = now;

      await isar.writeTxn(() async {
        await isar.medicationCollections.put(medication);
      });

      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<Paginated<MedicationListModel>>> getList({
    required Pagination pagination,
    MedicationFilters? filters,
  }) async {
    try {
      var filterQuery = isar.medicationCollections
          .where()
          .filter()
          .isDeletedEqualTo(false);

      if (filters != null) {
        if (filters.searchQuery != null && filters.searchQuery!.isNotEmpty) {
          filterQuery = filterQuery.nameContains(
            filters.searchQuery!,
            caseSensitive: false,
          );
        }

        if (filters.priority != null) {
          filterQuery = filterQuery.priorityEqualTo(filters.priority!.index);
        }

        if (filters.isActive != null) {
          filterQuery = filterQuery.isActiveEqualTo(filters.isActive!);
        }
      }

      final allMatches = await filterQuery.findAll();

      Set<String>? repeatTypeMedUuids;
      if (filters?.repeatType != null) {
        final scheduleMedUuids = await isar.medicationScheduleCollections
            .where()
            .filter()
            .repeatTypeEqualTo(filters!.repeatType!.index)
            .isDeletedEqualTo(false)
            .medicationUuidProperty()
            .findAll();

        repeatTypeMedUuids = scheduleMedUuids.toSet();
      }

      List<MedicationCollection> filtered;
      if (repeatTypeMedUuids != null) {
        filtered = allMatches
            .where((m) => repeatTypeMedUuids!.contains(m.uuid))
            .toList();
      } else {
        filtered = allMatches;
      }

      if (filters?.sortField != null) {
        final sortField = filters!.sortField!;
        final isAsc =
            (filters.sortDirection ?? SortDirection.asc) == SortDirection.asc;

        filtered.sort((a, b) {
          int comparison;
          switch (sortField) {
            case MedicationSortField.name:
              comparison = a.name.compareTo(b.name);
            case MedicationSortField.createdAt:
              comparison = a.createdAt.compareTo(b.createdAt);
            case MedicationSortField.priority:
              comparison = a.priority.compareTo(b.priority);
            case MedicationSortField.updatedAt:
              comparison = a.updatedAt.compareTo(b.updatedAt);
          }
          return isAsc ? comparison : -comparison;
        });
      }

      final totalCount = filtered.length;
      final offset = (pagination.page - 1) * pagination.limit;
      final pageItems = filtered.skip(offset).take(pagination.limit).toList();

      final listModels = pageItems.map((m) {
        return MedicationListModel(
          id: m.uuid,
          name: m.name,
          dosage: m.dosage,
          color: m.color,
          priority: MedicationMapper.priorityFromInt(m.priority),
          isActive: m.isActive,
        );
      }).toList();

      final hasNext = offset + pagination.limit < totalCount;

      return Success(
        Paginated<MedicationListModel>(
          items: listModels,
          pagination: pagination,
          hasNext: hasNext,
        ),
      );
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<List<MedicationScheduleModel>>> getSchedules(
    String medicationUuid,
  ) async {
    try {
      final schedules = await isar.medicationScheduleCollections
          .where()
          .filter()
          .medicationUuidEqualTo(medicationUuid)
          .isDeletedEqualTo(false)
          .findAll();

      return Success(schedules.map(MedicationScheduleMapper.toDomain).toList());
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<void>> replaceSchedules(
    String medicationUuid,
    List<MedicationScheduleAddModel> schedules,
  ) async {
    try {
      final now = DateTime.now();

      final existingSchedules = await isar.medicationScheduleCollections
          .where()
          .filter()
          .medicationUuidEqualTo(medicationUuid)
          .findAll();

      final newCollections = schedules.map((s) {
        return MedicationScheduleMapper.fromAddModel(
          uuid: UuidService.generate(),
          medicationUuid: medicationUuid,
          minutesFromMidnight: s.minutesFromMidnight,
          repeatType: s.repeatType,
          weekdays: s.weekdays,
          interval: s.interval,
          startDate: s.startDate,
          endDate: s.endDate,
          now: now,
        );
      }).toList();

      await isar.writeTxn(() async {
        for (final old in existingSchedules) {
          old
            ..isDeleted = true
            ..updatedAt = now;
        }
        await isar.medicationScheduleCollections.putAll(existingSchedules);

        await isar.medicationScheduleCollections.putAll(newCollections);
      });

      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<List<DoseLogModel>>> getDoseLogs(String medicationUuid) async {
    try {
      final logs = await isar.doseLogCollections
          .where()
          .filter()
          .medicationUuidEqualTo(medicationUuid)
          .isDeletedEqualTo(false)
          .sortByScheduledAtDesc()
          .findAll();

      return Success(logs.map(DoseLogMapper.toDomain).toList());
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<DoseLogModel>> logDose(DoseLogModel log) async {
    try {
      final collection = DoseLogMapper.toCollection(log);

      await isar.writeTxn(() async {
        await isar.doseLogCollections.put(collection);
      });

      return Success(DoseLogMapper.toDomain(collection));
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }
}
