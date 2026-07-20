import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_platform_core/core.dart';
import 'package:medication_reminder/features/medications/medication_management/providers/repository_providers.dart';
import 'package:medication_reminder/features/medications/medication_management/presentation/screens/medication_list_screen.dart';
import 'package:medication_reminder/features/medications/medication_management/models/models.dart';
import 'package:medication_reminder/features/medications/medication_management/repositories/medication_filters.dart';

import '../helpers/widget_test_helper.dart';
import '../helpers/test_fixtures.dart';
import '../mocks/mock_repositories.dart';

void main() {
  late MockMedicationRepository mockRepo;

  setUpAll(() {
    registerFallbackValue(Pagination(page: 1, limit: 20));
    registerFallbackValue(const MedicationFilters());
  });

  setUp(() {
    mockRepo = MockMedicationRepository();
  });

  group('MedicationListScreen', () {
    testWidgets('shows loading indicator while loading first page', (
      tester,
    ) async {
      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer(
        (_) => Completer<Result<Paginated<MedicationListModel>>>().future,
      );

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [medicationRepositoryProvider.overrideWithValue(mockRepo)],
          child: const MedicationListScreen(),
        ),
      );

      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows empty state when no medications', (tester) async {
      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer(
        (_) async => Success(
          Paginated(
            items: const [],
            pagination: Pagination(page: 1, limit: 20),
            hasNext: false,
          ),
        ),
      );

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [medicationRepositoryProvider.overrideWithValue(mockRepo)],
          child: const MedicationListScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byIcon(Icons.search_off), findsOneWidget);
    });

    testWidgets('shows error view on load failure', (tester) async {
      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer((_) async => Failure(UnknownError('Failed')));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [medicationRepositoryProvider.overrideWithValue(mockRepo)],
          child: const MedicationListScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('displays medication cards when data is loaded', (
      tester,
    ) async {
      final medications = [
        TestFixtures.medicationList(name: 'Aspirin', dosage: '100mg'),
        TestFixtures.medicationList(
          id: 'test-med-uuid-002',
          name: 'Paracetamol',
          dosage: '500mg',
        ),
      ];

      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer(
        (_) async => Success(
          Paginated(
            items: medications,
            pagination: Pagination(page: 1, limit: 20),
            hasNext: false,
          ),
        ),
      );

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [medicationRepositoryProvider.overrideWithValue(mockRepo)],
          child: const MedicationListScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.text('Aspirin'), findsOneWidget);
      expect(find.text('Paracetamol'), findsOneWidget);
    });

    testWidgets('shows search field', (tester) async {
      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer(
        (_) async => Success(
          Paginated(
            items: const [],
            pagination: Pagination(page: 1, limit: 20),
            hasNext: false,
          ),
        ),
      );

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [medicationRepositoryProvider.overrideWithValue(mockRepo)],
          child: const MedicationListScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('has app bar with add button', (tester) async {
      when(
        () => mockRepo.getList(
          pagination: any(named: 'pagination'),
          filters: any(named: 'filters'),
        ),
      ).thenAnswer(
        (_) async => Success(
          Paginated(
            items: const [],
            pagination: Pagination(page: 1, limit: 20),
            hasNext: false,
          ),
        ),
      );

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [medicationRepositoryProvider.overrideWithValue(mockRepo)],
          child: const MedicationListScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}
