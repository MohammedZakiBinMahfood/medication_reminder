import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_platform_core/core.dart';
import 'package:medication_reminder/features/medications/medication_management/providers/medication_list_notifier.dart';
import 'package:medication_reminder/features/medications/medication_management/providers/repository_providers.dart';
import 'package:medication_reminder/features/medications/medication_management/providers/medication_filters_provider.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';
import 'package:medication_reminder/features/medications/medication_management/repositories/medication_filters.dart';

import '../mocks/mock_repositories.dart';

MedicationListModel _medList({String id = '1', String name = 'Aspirin'}) {
  return MedicationListModel(
    id: id,
    name: name,
    dosage: '100mg',
    color: '#FF000000',
    priority: MedicationPriority.medium,
    isActive: true,
  );
}

void main() {
  late MockMedicationRepository mockRepo;

  setUp(() {
    mockRepo = MockMedicationRepository();
    registerFallbackValue(const Pagination(page: 1, limit: 20));
    registerFallbackValue(const MedicationFilters());
  });

  ProviderContainer _createContainer() {
    return ProviderContainer(
      overrides: [medicationRepositoryProvider.overrideWithValue(mockRepo)],
    );
  }

  group('MedicationListNotifier', () {
    test('loads first page successfully', () async {
      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer(
        (_) async => Success(
          Paginated<MedicationListModel>(
            items: [_medList(id: '1', name: 'Aspirin')],
            pagination: const Pagination(page: 1, limit: 20),
            hasNext: false,
          ),
        ),
      );

      final container = _createContainer();
      addTearDown(container.dispose);

      await container.read(medicationListProvider.notifier).refresh();
      await Future.microtask(() {});

      final state = container.read(medicationListProvider);
      expect(state.status, equals(LoadStatus.success));
      expect(state.data?.items.length, equals(1));
    });

    test('handles load failure', () async {
      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer((_) async => Failure(UnknownError('Database error')));

      final container = _createContainer();
      addTearDown(container.dispose);

      await container.read(medicationListProvider.notifier).refresh();
      await Future.microtask(() {});

      final state = container.read(medicationListProvider);
      expect(state.status, equals(LoadStatus.error));
      expect(state.error, isNotNull);
    });

    test('refresh reloads first page', () async {
      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer(
        (_) async => Success(
          Paginated<MedicationListModel>(
            items: [_medList(id: '1')],
            pagination: const Pagination(page: 1, limit: 20),
            hasNext: false,
          ),
        ),
      );

      final container = _createContainer();
      addTearDown(container.dispose);

      await container.read(medicationListProvider.notifier).refresh();

      final state = container.read(medicationListProvider);
      expect(state.status, equals(LoadStatus.success));
      expect(state.data?.items.length, equals(1));
    });
  });

  group('MedicationFilters', () {
    test('filters provider starts with empty filters', () {
      final container = _createContainer();
      addTearDown(container.dispose);

      final filters = container.read(medicationFiltersProvider);
      expect(filters.isEmpty, isTrue);
    });

    test('setting filters updates state', () {
      final container = _createContainer();
      addTearDown(container.dispose);

      container
          .read(medicationFiltersProvider.notifier)
          .setPriority(MedicationPriority.high);
      final filters = container.read(medicationFiltersProvider);
      expect(filters.priority, equals(MedicationPriority.high));
    });
  });
}
