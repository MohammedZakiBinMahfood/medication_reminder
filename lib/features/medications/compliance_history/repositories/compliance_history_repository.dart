import 'package:app_platform_core/core.dart';

import '../models/history_filter_model.dart';
import '../models/history_item_model.dart';
import '../models/history_state_model.dart';
import '../models/history_statistics_model.dart';

abstract class ComplianceHistoryRepository {
  /// Returns paginated history grouped by the filter's groupBy setting.
  Future<Result<HistoryStateModel>> getHistory({
    required HistoryFilterModel filter,
    required Pagination pagination,
  });

  /// Returns all history items for export (no pagination).
  Future<Result<List<HistoryItemModel>>> getAllHistory({
    required HistoryFilterModel filter,
  });

  /// Returns statistics computed from all dose logs matching the filter.
  Future<Result<HistoryStatisticsModel>> getStatistics({
    required HistoryFilterModel filter,
  });

  /// Returns available medication UUIDs that have dose log entries.
  Future<Result<List<String>>> getMedicationUuidsWithLogs();

  /// Returns the medication name for a given UUID.
  /// Used to display soft-deleted medication names in history.
  Future<Result<String>> getMedicationName(String medicationUuid);
}
