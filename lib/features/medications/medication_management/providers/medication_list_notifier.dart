import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../profiles/providers/profile_providers.dart';
import '../models/models.dart';
import '../repositories/medication_filters.dart';
import '../repositories/medication_repository.dart';
import 'medication_filters_provider.dart';
import 'repository_providers.dart';

final medicationListProvider =
    NotifierProvider.autoDispose<
      MedicationListNotifier,
      BaseState<Paginated<MedicationListModel>>
    >(MedicationListNotifier.new);

class MedicationListNotifier
    extends BaseNotifier<Paginated<MedicationListModel>> {
  late MedicationRepository repository;
  Pagination _pagination = const Pagination(page: 1, limit: 20);
  bool _showAllProfiles = false;

  @override
  BaseState<Paginated<MedicationListModel>> build() {
    repository = ref.read(medicationRepositoryProvider);

    ref.listen<AsyncValue<String>>(activeProfileUuidProvider, (prev, next) {
      final prevUuid = prev?.value;
      final nextUuid = next.value;
      if (prev?.hasValue == true && prevUuid != nextUuid && !_showAllProfiles) {
        repository = ref.read(medicationRepositoryProvider);
        Future.microtask(loadFirstPage);
      }
    });

    Future.microtask(loadFirstPage);
    return const BaseState();
  }

  void setShowAllProfiles(bool showAll) {
    _showAllProfiles = showAll;
    loadFirstPage();
  }

  MedicationFilters _currentFilters() {
    final filters = ref.read(medicationFiltersProvider);
    if (_showAllProfiles) {
      return filters.copyWith(includeAllProfiles: true);
    }
    return filters.copyWith(includeAllProfiles: false);
  }

  Future<void> loadFirstPage() async {
    _pagination = _pagination.first();
    setLoading();

    final result = await repository.getList(
      pagination: _pagination,
      filters: _currentFilters(),
    );

    if (result case Success(:final data)) {
      setSuccess(data);
    } else if (result case Failure(:final error)) {
      setError(error);
    }
  }

  Future<void> loadNextPage() async {
    final current = state.data;
    if (current == null || !current.hasNext || current.isLoadingMore) return;

    setSuccess(current.copyWith(isLoadingMore: true));
    _pagination = _pagination.next();

    final result = await repository.getList(
      pagination: _pagination,
      filters: _currentFilters(),
    );

    if (result case Success(:final data)) {
      setSuccess(
        current.copyWith(
          items: [...current.items, ...data.items],
          isLoadingMore: false,
        ),
      );
    } else if (result case Failure()) {
      setSuccess(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() => loadFirstPage();
}
