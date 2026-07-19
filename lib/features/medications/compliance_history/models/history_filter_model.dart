import '../../medication_management/models/enums/medication_enums.dart';
import 'history_enums.dart';

class HistoryFilterModel {
  final HistoryDateRange dateRange;
  final DateTime? customStartDate;
  final DateTime? customEndDate;
  final String? medicationUuid;
  final DoseStatus? status;
  final MedicationPriority? priority;
  final HistoryGroupBy groupBy;
  final HistorySortOrder sortOrder;

  const HistoryFilterModel({
    this.dateRange = HistoryDateRange.last7Days,
    this.customStartDate,
    this.customEndDate,
    this.medicationUuid,
    this.status,
    this.priority,
    this.groupBy = HistoryGroupBy.day,
    this.sortOrder = HistorySortOrder.newestFirst,
  });

  HistoryFilterModel copyWith({
    HistoryDateRange? dateRange,
    DateTime? customStartDate,
    DateTime? customEndDate,
    bool clearCustomDates = false,
    String? medicationUuid,
    bool clearMedication = false,
    DoseStatus? status,
    bool clearStatus = false,
    MedicationPriority? priority,
    bool clearPriority = false,
    HistoryGroupBy? groupBy,
    HistorySortOrder? sortOrder,
  }) {
    return HistoryFilterModel(
      dateRange: dateRange ?? this.dateRange,
      customStartDate: clearCustomDates
          ? null
          : (customStartDate ?? this.customStartDate),
      customEndDate: clearCustomDates
          ? null
          : (customEndDate ?? this.customEndDate),
      medicationUuid: clearMedication
          ? null
          : (medicationUuid ?? this.medicationUuid),
      status: clearStatus ? null : (status ?? this.status),
      priority: clearPriority ? null : (priority ?? this.priority),
      groupBy: groupBy ?? this.groupBy,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  DateTime? get resolvedStartDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return switch (dateRange) {
      HistoryDateRange.last7Days => today.subtract(const Duration(days: 6)),
      HistoryDateRange.last30Days => today.subtract(const Duration(days: 29)),
      HistoryDateRange.custom => customStartDate,
      HistoryDateRange.all => null,
    };
  }

  DateTime? get resolvedEndDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return switch (dateRange) {
      HistoryDateRange.last7Days => today.add(const Duration(days: 1)),
      HistoryDateRange.last30Days => today.add(const Duration(days: 1)),
      HistoryDateRange.custom => customEndDate,
      HistoryDateRange.all => null,
    };
  }

  bool get hasActiveFilters =>
      medicationUuid != null ||
      status != null ||
      priority != null ||
      dateRange != HistoryDateRange.last7Days;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryFilterModel &&
          dateRange == other.dateRange &&
          customStartDate == other.customStartDate &&
          customEndDate == other.customEndDate &&
          medicationUuid == other.medicationUuid &&
          status == other.status &&
          priority == other.priority &&
          groupBy == other.groupBy &&
          sortOrder == other.sortOrder;

  @override
  int get hashCode => Object.hash(
    dateRange,
    customStartDate,
    customEndDate,
    medicationUuid,
    status,
    priority,
    groupBy,
    sortOrder,
  );
}
