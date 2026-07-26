import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/history_filter_model.dart';
import '../models/history_enums.dart';
import '../../medication_management/models/enums/medication_enums.dart';

final historyFilterProvider =
    NotifierProvider<HistoryFilterNotifier, HistoryFilterModel>(
      HistoryFilterNotifier.new,
    );

class HistoryFilterNotifier extends Notifier<HistoryFilterModel> {
  @override
  HistoryFilterModel build() => const HistoryFilterModel();

  void setDateRange(HistoryDateRange range) {
    state = state.copyWith(dateRange: range);
  }

  void setCustomDateRange(DateTime start, DateTime end) {
    state = state.copyWith(
      dateRange: HistoryDateRange.custom,
      customStartDate: start,
      customEndDate: end,
    );
  }

  void setMedicationFilter(String? medicationUuid) {
    state = state.copyWith(
      medicationUuid: medicationUuid ?? '',
      clearMedication: medicationUuid == null,
    );
  }

  void setStatusFilter(DoseStatus? status) {
    state = state.copyWith(status: status, clearStatus: status == null);
  }

  void setPriorityFilter(MedicationPriority? priority) {
    state = state.copyWith(priority: priority, clearPriority: priority == null);
  }

  void setGroupBy(HistoryGroupBy groupBy) {
    state = state.copyWith(groupBy: groupBy);
  }

  void setSortOrder(HistorySortOrder order) {
    state = state.copyWith(sortOrder: order);
  }

  void setProfileFilter(String? profileUuid) {
    state = state.copyWith(
      profileUuid: profileUuid ?? '',
      clearProfile: profileUuid == null,
    );
  }

  void reset() {
    state = const HistoryFilterModel();
  }
}
