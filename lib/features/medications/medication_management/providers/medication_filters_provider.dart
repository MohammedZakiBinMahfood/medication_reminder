import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/enums/medication_enums.dart';
import '../models/medication_sort_field.dart';
import '../../../../core/constants/enums.dart';
import '../repositories/medication_filters.dart';

final medicationFiltersProvider =
    NotifierProvider<MedicationFiltersNotifier, MedicationFilters>(
      MedicationFiltersNotifier.new,
    );

class MedicationFiltersNotifier extends Notifier<MedicationFilters> {
  @override
  MedicationFilters build() => const MedicationFilters();

  void setPriority(MedicationPriority? priority) {
    state = state.copyWith(priority: priority);
  }

  void setIsActive(bool? isActive) {
    state = state.copyWith(isActive: isActive);
  }

  void setRepeatType(RepeatType? repeatType) {
    state = state.copyWith(repeatType: repeatType);
  }

  void setSearchQuery(String? query) {
    state = state.copyWith(searchQuery: query);
  }

  void setSortField(MedicationSortField? sortField) {
    state = state.copyWith(sortField: sortField);
  }

  void setSortDirection(SortDirection? sortDirection) {
    state = state.copyWith(sortDirection: sortDirection);
  }

  void reset() => state = const MedicationFilters();
}
