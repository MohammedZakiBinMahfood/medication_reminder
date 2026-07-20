import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:medication_reminder/features/medications/medication_management/providers/providers.dart';
import 'package:medication_reminder/features/medications/medication_management/repositories/medication_filters.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';
import 'package:medication_reminder/features/medications/compliance_history/providers/history_filter_provider.dart';
import 'package:medication_reminder/features/medications/compliance_history/models/history_enums.dart';
import 'package:medication_reminder/features/medications/today_dashboard/providers/dashboard_filter_provider.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_enums.dart';
import 'package:medication_reminder/features/settings/providers/settings_notifier.dart';
import 'package:medication_reminder/features/settings/repositories/settings_repository_impl.dart';
import 'package:medication_reminder/features/settings/models/settings_enums.dart';
import 'package:medication_reminder/features/settings/models/settings_model.dart';

import '../helpers/test_fixtures.dart';
import '../mocks/mock_repositories.dart';

void main() {
  late MockSettingsRepository mockSettingsRepo;

  setUpAll(() {
    registerFallbackValue(Pagination(page: 1, limit: 20));
    registerFallbackValue(const MedicationFilters());
    registerFallbackValue(TestFixtures.settings());
  });

  setUp(() {
    mockSettingsRepo = MockSettingsRepository();
  });

  group('Settings Flow', () {
    test('load settings → update language → persists', () async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockSettingsRepo.updateLanguage('en'),
      ).thenAnswer((_) async => const Success(null));

      final container = ProviderContainer(
        overrides: [
          settingsRepositoryProvider.overrideWithValue(mockSettingsRepo),
        ],
      );
      addTearDown(container.dispose);

      await _waitForSettings(container);

      await container.read(settingsProvider.notifier).updateLanguage('en');

      final state = container.read(settingsProvider);
      expect(state.data?.language, equals('en'));
      verify(() => mockSettingsRepo.updateLanguage('en')).called(1);
    });

    test('load settings → update theme → persists', () async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockSettingsRepo.updateThemeMode(AppThemeMode.dark),
      ).thenAnswer((_) async => const Success(null));

      final container = ProviderContainer(
        overrides: [
          settingsRepositoryProvider.overrideWithValue(mockSettingsRepo),
        ],
      );
      addTearDown(container.dispose);

      await _waitForSettings(container);

      await container
          .read(settingsProvider.notifier)
          .updateThemeMode(AppThemeMode.dark);

      final state = container.read(settingsProvider);
      expect(state.data?.themeMode, equals(AppThemeMode.dark));
      verify(
        () => mockSettingsRepo.updateThemeMode(AppThemeMode.dark),
      ).called(1);
    });

    test('load settings → update notifications → persists', () async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockSettingsRepo.updateNotificationsEnabled(false),
      ).thenAnswer((_) async => const Success(null));

      final container = ProviderContainer(
        overrides: [
          settingsRepositoryProvider.overrideWithValue(mockSettingsRepo),
        ],
      );
      addTearDown(container.dispose);

      await _waitForSettings(container);

      await container
          .read(settingsProvider.notifier)
          .updateNotificationsEnabled(false);

      final state = container.read(settingsProvider);
      expect(state.data?.notificationsEnabled, isFalse);
      verify(
        () => mockSettingsRepo.updateNotificationsEnabled(false),
      ).called(1);
    });

    test('load settings → update default snooze → persists', () async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockSettingsRepo.updateDefaultSnoozeMinutes(15),
      ).thenAnswer((_) async => const Success(null));

      final container = ProviderContainer(
        overrides: [
          settingsRepositoryProvider.overrideWithValue(mockSettingsRepo),
        ],
      );
      addTearDown(container.dispose);

      await _waitForSettings(container);

      await container
          .read(settingsProvider.notifier)
          .updateDefaultSnoozeMinutes(15);

      final state = container.read(settingsProvider);
      expect(state.data?.defaultSnoozeMinutes, equals(15));
      verify(() => mockSettingsRepo.updateDefaultSnoozeMinutes(15)).called(1);
    });

    test('load settings → rollback on failure', () async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockSettingsRepo.updateLanguage('en'),
      ).thenAnswer((_) async => Failure(UnknownError('Save failed')));

      final container = ProviderContainer(
        overrides: [
          settingsRepositoryProvider.overrideWithValue(mockSettingsRepo),
        ],
      );
      addTearDown(container.dispose);

      await _waitForSettings(container);

      await container.read(settingsProvider.notifier).updateLanguage('en');

      final state = container.read(settingsProvider);
      expect(state.data?.language, equals('ar'));
    });

    test('load settings → multiple updates in sequence', () async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockSettingsRepo.updateLanguage('en'),
      ).thenAnswer((_) async => const Success(null));
      when(
        () => mockSettingsRepo.updateThemeMode(AppThemeMode.dark),
      ).thenAnswer((_) async => const Success(null));
      when(
        () => mockSettingsRepo.updateNotificationsEnabled(false),
      ).thenAnswer((_) async => const Success(null));

      final container = ProviderContainer(
        overrides: [
          settingsRepositoryProvider.overrideWithValue(mockSettingsRepo),
        ],
      );
      addTearDown(container.dispose);

      await _waitForSettings(container);

      await container.read(settingsProvider.notifier).updateLanguage('en');
      await container
          .read(settingsProvider.notifier)
          .updateThemeMode(AppThemeMode.dark);
      await container
          .read(settingsProvider.notifier)
          .updateNotificationsEnabled(false);

      final state = container.read(settingsProvider);
      expect(state.data?.language, equals('en'));
      expect(state.data?.themeMode, equals(AppThemeMode.dark));
      expect(state.data?.notificationsEnabled, isFalse);
    });
  });

  group('Form State Flow', () {
    test('reset → load from field → set values', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(medicationStateProvider.notifier).reset();
      var state = container.read(medicationStateProvider);
      expect(state.name, isNull);

      final field = TestFixtures.medicationField(
        name: 'Ibuprofen',
        dosage: '200mg',
      );
      container.read(medicationStateProvider.notifier).loadFromField(field);
      state = container.read(medicationStateProvider);
      expect(state.name, equals('Ibuprofen'));
      expect(state.dosage, equals('200mg'));

      container.read(medicationStateProvider.notifier).setName('Updated Med');
      container.read(medicationStateProvider.notifier).setDosage('400mg');
      state = container.read(medicationStateProvider);
      expect(state.name, equals('Updated Med'));
      expect(state.dosage, equals('400mg'));

      container
          .read(medicationStateProvider.notifier)
          .setPriority(MedicationPriority.high);
      state = container.read(medicationStateProvider);
      expect(state.priority, equals(MedicationPriority.high));
    });

    test('form validation catches empty name', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(medicationFormProvider.notifier).validateName();
      final formState = container.read(medicationFormProvider);
      expect(formState.field(MedicationFormField.name).error, isNotNull);
    });

    test('form validation passes for valid name', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(medicationStateProvider.notifier).setName('Valid Name');
      container.read(medicationFormProvider.notifier).validateName();
      final formState = container.read(medicationFormProvider);
      expect(formState.field(MedicationFormField.name).error, isNull);
    });

    test('form validation catches empty dosage', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(medicationFormProvider.notifier).validateDosage();
      final formState = container.read(medicationFormProvider);
      expect(formState.field(MedicationFormField.dosage).error, isNotNull);
    });

    test('form validation passes for valid dosage', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(medicationStateProvider.notifier).setDosage('200mg');
      container.read(medicationFormProvider.notifier).validateDosage();
      final formState = container.read(medicationFormProvider);
      expect(formState.field(MedicationFormField.dosage).error, isNull);
    });

    test('form validateForm checks all fields', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // All fields empty by default - should be invalid
      final isValid = container
          .read(medicationFormProvider.notifier)
          .validateForm();
      expect(isValid, isFalse);
    });

    test('form validateForm passes with valid data', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(medicationStateProvider.notifier).setName('Aspirin');
      container.read(medicationStateProvider.notifier).setDosage('100mg');
      container
          .read(medicationStateProvider.notifier)
          .setStartDate(DateTime.now());

      final isValid = container
          .read(medicationFormProvider.notifier)
          .validateForm();
      expect(isValid, isTrue);
    });
  });

  group('Medication Filter Flow', () {
    test('set priority filter updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      var filters = container.read(medicationFiltersProvider);
      expect(filters.priority, isNull);

      container
          .read(medicationFiltersProvider.notifier)
          .setPriority(MedicationPriority.high);
      filters = container.read(medicationFiltersProvider);
      expect(filters.priority, equals(MedicationPriority.high));
    });

    test('set search query updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(medicationFiltersProvider.notifier)
          .setSearchQuery('aspirin');
      final filters = container.read(medicationFiltersProvider);
      expect(filters.searchQuery, equals('aspirin'));
    });

    test('reset clears all filters', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(medicationFiltersProvider.notifier)
          .setPriority(MedicationPriority.high);
      container.read(medicationFiltersProvider.notifier).setSearchQuery('test');
      container.read(medicationFiltersProvider.notifier).setIsActive(true);

      container.read(medicationFiltersProvider.notifier).reset();
      final filters = container.read(medicationFiltersProvider);
      expect(filters.isEmpty, isTrue);
    });
  });

  group('Dashboard Filter Flow', () {
    test('set filter type updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(dashboardFilterProvider.notifier)
          .setFilterType(DashboardFilterType.critical);
      final filter = container.read(dashboardFilterProvider);
      expect(filter.filterType, equals(DashboardFilterType.critical));
    });

    test('set sort type updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(dashboardFilterProvider.notifier)
          .setSortType(DashboardSortType.priority);
      final filter = container.read(dashboardFilterProvider);
      expect(filter.sortType, equals(DashboardSortType.priority));
    });

    test('reset restores defaults', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(dashboardFilterProvider.notifier)
          .setFilterType(DashboardFilterType.completed);
      container
          .read(dashboardFilterProvider.notifier)
          .setSortType(DashboardSortType.name);

      container.read(dashboardFilterProvider.notifier).reset();
      final filter = container.read(dashboardFilterProvider);
      expect(filter.filterType, equals(DashboardFilterType.all));
      expect(filter.sortType, equals(DashboardSortType.time));
    });
  });

  group('History Filter Flow', () {
    test('set date range updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(historyFilterProvider.notifier)
          .setDateRange(HistoryDateRange.last30Days);
      final filter = container.read(historyFilterProvider);
      expect(filter.dateRange, equals(HistoryDateRange.last30Days));
    });

    test('set medication filter updates state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(historyFilterProvider.notifier)
          .setMedicationFilter('med-uuid-1');
      final filter = container.read(historyFilterProvider);
      expect(filter.medicationUuid, equals('med-uuid-1'));
    });

    test('reset restores defaults', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(historyFilterProvider.notifier)
          .setDateRange(HistoryDateRange.last30Days);
      container
          .read(historyFilterProvider.notifier)
          .setMedicationFilter('med-uuid-1');

      container.read(historyFilterProvider.notifier).reset();
      final filter = container.read(historyFilterProvider);
      expect(filter.dateRange, equals(HistoryDateRange.last7Days));
      expect(filter.medicationUuid, isNull);
    });

    test('hasActiveFilters returns correct value', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(historyFilterProvider).hasActiveFilters, isFalse);

      container
          .read(historyFilterProvider.notifier)
          .setDateRange(HistoryDateRange.last30Days);
      expect(container.read(historyFilterProvider).hasActiveFilters, isTrue);
    });
  });
}

Future<BaseState<SettingsModel>> _waitForSettings(
  ProviderContainer container,
) async {
  final completer = Completer<BaseState<SettingsModel>>();
  final sub = container.listen(settingsProvider, (prev, next) {
    if (next.status == LoadStatus.success && !completer.isCompleted) {
      completer.complete(next);
    }
  });
  final current = container.read(settingsProvider);
  if (current.status == LoadStatus.success) {
    completer.complete(current);
  }
  final result = await completer.future.timeout(
    const Duration(seconds: 5),
    onTimeout: () => container.read(settingsProvider),
  );
  sub.close();
  return result;
}
