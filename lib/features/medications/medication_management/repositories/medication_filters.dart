import '../models/enums/medication_enums.dart';
import '../models/medication_sort_field.dart';
import '../../../../core/constants/enums.dart';

class MedicationFilters {
  final MedicationPriority? priority;
  final bool? isActive;
  final RepeatType? repeatType;
  final String? searchQuery;
  final MedicationSortField? sortField;
  final SortDirection? sortDirection;
  final bool includeAllProfiles;

  const MedicationFilters({
    this.priority,
    this.isActive,
    this.repeatType,
    this.searchQuery,
    this.sortField,
    this.sortDirection,
    this.includeAllProfiles = false,
  });

  MedicationFilters copyWith({
    MedicationPriority? priority,
    bool? isActive,
    RepeatType? repeatType,
    String? searchQuery,
    MedicationSortField? sortField,
    SortDirection? sortDirection,
    bool? includeAllProfiles,
  }) {
    return MedicationFilters(
      priority: priority ?? this.priority,
      isActive: isActive ?? this.isActive,
      repeatType: repeatType ?? this.repeatType,
      searchQuery: searchQuery ?? this.searchQuery,
      sortField: sortField ?? this.sortField,
      sortDirection: sortDirection ?? this.sortDirection,
      includeAllProfiles: includeAllProfiles ?? this.includeAllProfiles,
    );
  }

  bool get isEmpty =>
      priority == null &&
      isActive == null &&
      repeatType == null &&
      searchQuery == null;
}
