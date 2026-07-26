import 'package:app_platform_core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

import '../../../../core/database/database_provider.dart';
import '../../medication_management/data/collections/dose_log_collection.dart';
import '../../medication_management/data/collections/medication_collection.dart';
import '../../medication_management/data/mappers/medication_mapper.dart';
import '../../medication_management/models/enums/medication_enums.dart';
import '../models/history_enums.dart';
import '../models/history_filter_model.dart';
import '../models/history_group_model.dart';
import '../models/history_item_model.dart';
import '../models/history_statistics_model.dart';
import '../models/history_state_model.dart';
import 'compliance_history_repository.dart';

final complianceHistoryRepositoryProvider =
    Provider<ComplianceHistoryRepository>(
      (ref) => ComplianceHistoryRepositoryImpl(
        isar: ref.read(isarProvider),
      ),
    );

class ComplianceHistoryRepositoryImpl implements ComplianceHistoryRepository {
  final Isar isar;

  ComplianceHistoryRepositoryImpl({
    required this.isar,
  });

  @override
  Future<Result<HistoryStateModel>> getHistory({
    required HistoryFilterModel filter,
    required Pagination pagination,
  }) async {
    try {
      final items = await _queryItems(filter: filter, pagination: pagination);
      final totalCount = await _countItems(filter: filter);

      final groups = _groupBy(items: items, groupBy: filter.groupBy);

      // Compute statistics from ALL items (not just current page).
      final allItems = await _queryItems(filter: filter);
      final stats = _computeStatisticsFromItems(allItems);

      final currentOffset = (pagination.page - 1) * pagination.limit;
      final hasNext = currentOffset + pagination.limit < totalCount;

      return Success(
        HistoryStateModel(
          groups: groups,
          statistics: stats,
          totalCount: totalCount,
          hasNext: hasNext,
        ),
      );
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<List<HistoryItemModel>>> getAllHistory({
    required HistoryFilterModel filter,
  }) async {
    try {
      final items = await _queryItems(filter: filter);
      return Success(items);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<HistoryStatisticsModel>> getStatistics({
    required HistoryFilterModel filter,
  }) async {
    try {
      final stats = await _computeStatistics(filter: filter);
      return Success(stats);
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<List<String>>> getMedicationUuidsWithLogs() async {
    try {
      final logs = await isar.doseLogCollections
          .where()
          .filter()
          .isDeletedEqualTo(false)
          .medicationUuidProperty()
          .findAll();
      return Success(logs.toSet().toList());
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  @override
  Future<Result<String>> getMedicationName(String medicationUuid) async {
    try {
      final med = await isar.medicationCollections
          .where()
          .filter()
          .uuidEqualTo(medicationUuid)
          .findFirst();
      return Success(med?.name ?? 'Deleted Medication');
    } catch (e) {
      return Failure(UnknownError(e.toString()));
    }
  }

  // ── Private helpers ──────────────────────────────────────────────────

  Future<List<HistoryItemModel>> _queryItems({
    required HistoryFilterModel filter,
    Pagination? pagination,
  }) async {
    var query = isar.doseLogCollections.where().filter().isDeletedEqualTo(
      false,
    );

    final startDate = filter.resolvedStartDate;
    final endDate = filter.resolvedEndDate;

    if (startDate != null) {
      query = query.scheduledAtGreaterThan(startDate, include: true);
    }
    if (endDate != null) {
      query = query.scheduledAtLessThan(endDate, include: false);
    }
    if (filter.medicationUuid != null) {
      query = query.medicationUuidEqualTo(filter.medicationUuid!);
    }
    if (filter.status != null) {
      query = query.statusEqualTo(filter.status!.index);
    }
    if (filter.profileUuid != null && filter.profileUuid!.isNotEmpty) {
      query = query.profileUuidEqualTo(filter.profileUuid!);
    }

    final sortedQuery = filter.sortOrder == HistorySortOrder.newestFirst
        ? query.sortByScheduledAtDesc()
        : query.sortByScheduledAt();

    final List<DoseLogCollection> doseLogs;
    if (pagination != null) {
      doseLogs = await sortedQuery
          .offset((pagination.page - 1) * pagination.limit)
          .limit(pagination.limit)
          .findAll();
    } else {
      doseLogs = await sortedQuery.findAll();
    }

    // Batch-fetch ALL medications across profiles (history is global).
    final allMeds = await isar.medicationCollections
        .where()
        .filter()
        .isDeletedEqualTo(false)
        .findAll();
    final medications = <String, MedicationCollection>{};
    for (final m in allMeds) {
      medications[m.uuid] = m;
    }

    // In-memory filtering for priority and repeatType
    var items = doseLogs.map((log) {
      final med = medications[log.medicationUuid];
      return HistoryItemModel(
        doseLogUuid: log.uuid,
        medicationUuid: log.medicationUuid,
        scheduleUuid: log.scheduleUuid,
        medicationName: med?.name ?? 'Deleted Medication',
        dosage: med?.dosage ?? '',
        medicationColor: med?.color ?? '#6B7280',
        priority: MedicationPriority.values[med?.priority ?? 1],
        status: _statusFromInt(log.status),
        scheduledAt: log.scheduledAt,
        actionAt: log.actionAt,
        createdAt: log.createdAt,
      );
    }).toList();

    if (filter.priority != null) {
      items = items.where((i) => i.priority == filter.priority).toList();
    }

    return items;
  }

  Future<int> _countItems({required HistoryFilterModel filter}) async {
    var query = isar.doseLogCollections.where().filter().isDeletedEqualTo(
      false,
    );

    final startDate = filter.resolvedStartDate;
    final endDate = filter.resolvedEndDate;

    if (startDate != null) {
      query = query.scheduledAtGreaterThan(startDate, include: true);
    }
    if (endDate != null) {
      query = query.scheduledAtLessThan(endDate, include: false);
    }
    if (filter.medicationUuid != null) {
      query = query.medicationUuidEqualTo(filter.medicationUuid!);
    }
    if (filter.status != null) {
      query = query.statusEqualTo(filter.status!.index);
    }
    if (filter.profileUuid != null && filter.profileUuid!.isNotEmpty) {
      query = query.profileUuidEqualTo(filter.profileUuid!);
    }

    return query.count();
  }

  List<HistoryGroupModel> _groupBy({
    required List<HistoryItemModel> items,
    required HistoryGroupBy groupBy,
  }) {
    final map = <String, List<HistoryItemModel>>{};

    for (final item in items) {
      final key = switch (groupBy) {
        HistoryGroupBy.day => _dayKey(item.scheduledAt),
        HistoryGroupBy.week => _weekKey(item.scheduledAt),
        HistoryGroupBy.month => _monthKey(item.scheduledAt),
        HistoryGroupBy.medication => item.medicationUuid,
      };
      map.putIfAbsent(key, () => []).add(item);
    }

    final groups = map.entries.map((entry) {
      final label = switch (groupBy) {
        HistoryGroupBy.day => _dayLabel(entry.value.first.scheduledAt),
        HistoryGroupBy.week => _weekLabel(entry.value.first.scheduledAt),
        HistoryGroupBy.month => _monthLabel(entry.value.first.scheduledAt),
        HistoryGroupBy.medication => entry.value.first.medicationName,
      };
      return HistoryGroupModel(label: label, items: entry.value);
    }).toList();

    // Sort groups
    if (groupBy == HistoryGroupBy.day ||
        groupBy == HistoryGroupBy.week ||
        groupBy == HistoryGroupBy.month) {
      groups.sort(
        (a, b) =>
            b.items.first.scheduledAt.compareTo(a.items.first.scheduledAt),
      );
    }

    return groups;
  }

  Future<HistoryStatisticsModel> _computeStatistics({
    required HistoryFilterModel filter,
  }) async {
    final items = await _queryItems(filter: filter);
    return _computeStatisticsFromItems(items);
  }

  HistoryStatisticsModel _computeStatisticsFromItems(
    List<HistoryItemModel> items,
  ) {
    if (items.isEmpty) return HistoryStatisticsModel.empty();

    final taken = items.where((i) => i.status == DoseStatus.taken).length;
    final missed = items.where((i) => i.status == DoseStatus.missed).length;
    final skipped = items.where((i) => i.status == DoseStatus.skipped).length;
    final snoozed = items.where((i) => i.status == DoseStatus.pending).length;
    final total = items.length;

    final adherence = total > 0 ? (taken / total) * 100 : 0.0;

    // Daily average
    final days = <String>{};
    for (final item in items) {
      days.add(_dayKey(item.scheduledAt));
    }
    final dailyAverage = days.isNotEmpty ? total / days.length : 0.0;

    // Streaks — computed from daily taken ratio
    final currentStreak = _computeCurrentStreak(items);
    final longestStreak = _computeLongestStreak(items);

    return HistoryStatisticsModel(
      totalDoses: total,
      taken: taken,
      missed: missed,
      skipped: skipped,
      snoozed: snoozed,
      adherencePercentage: adherence,
      dailyAverage: dailyAverage,
      currentStreak: currentStreak,
      longestStreak: longestStreak,
    );
  }

  int _computeCurrentStreak(List<HistoryItemModel> items) {
    final dailyTaken = <String, bool>{};
    for (final item in items) {
      final day = _dayKey(item.scheduledAt);
      if (!dailyTaken.containsKey(day)) {
        dailyTaken[day] = false;
      }
      if (item.status == DoseStatus.taken) {
        dailyTaken[day] = true;
      }
    }

    final sortedDays = dailyTaken.keys.toList()..sort();
    var streak = 0;
    for (var i = sortedDays.length - 1; i >= 0; i--) {
      if (dailyTaken[sortedDays[i]] == true) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  int _computeLongestStreak(List<HistoryItemModel> items) {
    final dailyTaken = <String, bool>{};
    for (final item in items) {
      final day = _dayKey(item.scheduledAt);
      if (!dailyTaken.containsKey(day)) {
        dailyTaken[day] = false;
      }
      if (item.status == DoseStatus.taken) {
        dailyTaken[day] = true;
      }
    }

    final sortedDays = dailyTaken.keys.toList()..sort();
    var longest = 0;
    var current = 0;
    for (final day in sortedDays) {
      if (dailyTaken[day] == true) {
        current++;
        if (current > longest) longest = current;
      } else {
        current = 0;
      }
    }
    return longest;
  }

  String _dayKey(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

  String _weekKey(DateTime date) {
    final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    return _dayKey(startOfWeek);
  }

  String _monthKey(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}';

  String _dayLabel(DateTime date) {
    final months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month]} ${date.year}';
  }

  String _weekLabel(DateTime date) {
    final start = date.subtract(Duration(days: date.weekday - 1));
    final end = start.add(const Duration(days: 6));
    return '${_dayLabel(start)} - ${_dayLabel(end)}';
  }

  String _monthLabel(DateTime date) {
    final months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month]} ${date.year}';
  }

  DoseStatus _statusFromInt(int value) {
    return MedicationMapper.doseStatusFromInt(value);
  }
}
