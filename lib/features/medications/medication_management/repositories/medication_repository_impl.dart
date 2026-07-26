import 'package:app_platform_core/core.dart';
import 'package:flutter/foundation.dart';
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
  final String profileUuid;

  MedicationRepositoryImpl({required this.isar, required this.profileUuid});

  @override
  Future<Result<MedicationModel>> createMedication(
    MedicationAddModel model,
  ) async {
    debugPrint('🔴 [REPO] createMedication called');
    debugPrint('🔴 [REPO] model: name=${model.name}, dosage=${model.dosage}, profileUuid=${model.profileUuid}');
    try {
      final uuid = UuidService.generate();
      final now = DateTime.now();
      debugPrint('🔴 [REPO] generated uuid=$uuid');

      final medication = MedicationMapper.fromAddModel(
        uuid: uuid,
        profileUuid: model.profileUuid,
        name: model.name,
        dosage: model.dosage,
        color: model.color,
        priority: model.priority,
        isActive: model.isActive,
        stockQuantity: model.stockQuantity,
        reorderThreshold: model.reorderThreshold,
        foodInstruction: model.foodInstruction,
        imagePath: model.imagePath,
        now: now,
      );
      debugPrint('🔴 [REPO] medication collection created');

      final scheduleUuid = UuidService.generate();
      final schedule = MedicationScheduleMapper.fromAddModel(
        uuid: scheduleUuid,
        profileUuid: model.profileUuid,
        medicationUuid: uuid,
        minutesFromMidnight: model.minutesFromMidnight,
        repeatType: model.repeatType,
        weekdays: model.weekdays,
        interval: model.interval,
        startDate: model.startDate,
        endDate: model.endDate,
        now: now,
      );
      debugPrint('🔴 [REPO] schedule collection created');

      debugPrint('🔴 [REPO] writing to Isar...');
      await isar.writeTxn(() async {
        await isar.medicationCollections.put(medication);
        debugPrint('🔴 [REPO] medication put to Isar');
        await isar.medicationScheduleCollections.put(schedule);
        debugPrint('🔴 [REPO] schedule put to Isar');
      });
      debugPrint('🔴 [REPO] Isar writeTxn completed');

      final domain = MedicationMapper.toDomain(medication);
      debugPrint('🔴 [REPO] returning Success with uuid=${domain.uuid}');
      return Success(domain);
    } catch (e, stackTrace) {
      debugPrint('🔴 [REPO] EXCEPTION: $e');
      debugPrint('🔴 [REPO] StackTrace: $stackTrace');
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
          profileUuid: model.profileUuid,
          name: model.name,
          dosage: model.dosage,
          color: model.color,
          priority: model.priority,
          isActive: model.isActive,
          stockQuantity: model.stockQuantity,
          reorderThreshold: model.reorderThreshold,
          foodInstruction: model.foodInstruction,
          imagePath: model.imagePath,
          createdAt: existing.createdAt,
          updatedAt: now,
        ),
        isarId: existing.id,
      );

      final scheduleUuid = UuidService.generate();
      final schedule = MedicationScheduleMapper.fromAddModel(
        uuid: scheduleUuid,
        profileUuid: model.profileUuid,
        medicationUuid: model.id,
        minutesFromMidnight: model.minutesFromMidnight,
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
          .profileUuidEqualTo(profileUuid)
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
    MedicationStateModel state, {
    String profileUuid = '',
  }) async {
    if (state.id != null) {
      final editModel = MedicationEditModel(
        id: state.id!,
        profileUuid: profileUuid,
        name: state.name ?? '',
        dosage: state.dosage ?? '',
        color: state.color ?? '#4F46E5',
        priority: state.priority,
        repeatType: state.repeatType,
        weekdays: state.weekdays,
        interval: state.interval,
        startDate: state.startDate ?? DateTime.now(),
        endDate: state.endDate,
        minutesFromMidnight: state.minutesFromMidnight,
        isActive: state.isActive,
        stockQuantity: state.stockQuantity,
        reorderThreshold: state.reorderThreshold,
        foodInstruction: state.foodInstruction,
        imagePath: state.imagePath,
      );
      return updateMedication(editModel);
    } else {
      final addModel = MedicationAddModel(
        profileUuid: profileUuid,
        name: state.name ?? '',
        dosage: state.dosage ?? '',
        color: state.color ?? '#4F46E5',
        priority: state.priority,
        repeatType: state.repeatType,
        weekdays: state.weekdays,
        interval: state.interval,
        startDate: state.startDate ?? DateTime.now(),
        endDate: state.endDate,
        minutesFromMidnight: state.minutesFromMidnight,
        isActive: state.isActive,
        stockQuantity: state.stockQuantity,
        reorderThreshold: state.reorderThreshold,
        foodInstruction: state.foodInstruction,
        imagePath: state.imagePath,
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

      if (filters?.includeAllProfiles != true) {
        filterQuery = filterQuery.profileUuidEqualTo(profileUuid);
      }

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
          profileUuid: s.profileUuid,
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

        // Auto-decrement stock if dose is taken
        if (log.status == DoseStatus.taken) {
          final medication = await isar.medicationCollections
              .where()
              .uuidEqualTo(log.medicationUuid)
              .findFirst();

          if (medication != null &&
              medication.stockQuantity != null &&
              medication.stockQuantity! > 0) {
            medication.stockQuantity = medication.stockQuantity! - 1;
            medication.updatedAt = DateTime.now();
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
  Future<Result<void>> refillStock(String medicationUuid, int quantity) async {
    try {
      final medication = await isar.medicationCollections
          .where()
          .uuidEqualTo(medicationUuid)
          .findFirst();

      if (medication == null) {
        return Failure(UnknownError('Medication not found'));
      }

      medication.stockQuantity = (medication.stockQuantity ?? 0) + quantity;
      medication.updatedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.medicationCollections.put(medication);
      });

      return const Success(null);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }
}
