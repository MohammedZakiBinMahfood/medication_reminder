import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_platform_core/core.dart';
import 'package:medication_reminder/core/providers/first_run_provider.dart';
import 'package:medication_reminder/features/medications/today_dashboard/repositories/today_dashboard_repository_impl.dart';
import 'package:medication_reminder/features/medications/today_dashboard/presentation/screens/dashboard_screen.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_state_model.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_section_model.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_medication_model.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_summary_model.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_enums.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_filter_model.dart';
import 'package:medication_reminder/core/notifications/notification_providers.dart';
import 'package:medication_reminder/features/medications/medication_management/models/enums/medication_enums.dart';
import 'package:medication_reminder/features/settings/repositories/settings_repository_impl.dart';

import '../helpers/widget_test_helper.dart';
import '../helpers/test_fixtures.dart';
import '../mocks/mock_repositories.dart';

class _MockFirstRunNotifier extends FirstRunNotifier {
  @override
  FirstRunState build() {
    return const FirstRunState(
      welcomeDismissed: true,
      notificationHintDismissed: true,
      firstMedicationAdded: true,
    );
  }
}

void main() {
  late MockTodayDashboardRepository mockDashboardRepo;
  late MockSettingsRepository mockSettingsRepo;
  late MockNotificationManager mockNotificationManager;

  setUpAll(() {
    registerFallbackValue(const DashboardFilterModel());
  });

  setUp(() {
    mockDashboardRepo = MockTodayDashboardRepository();
    mockSettingsRepo = MockSettingsRepository();
    mockNotificationManager = MockNotificationManager();
  });

  DashboardStateModel emptyDashboardState() => DashboardStateModel.empty();

  DashboardStateModel populatedDashboardState() {
    return DashboardStateModel(
      sections: [
        DashboardSectionModel(
          type: DashboardSectionType.upcoming,
          medications: [
            DashboardMedicationModel(
              medicationUuid: 'med-1',
              scheduleUuid: 'sched-1',
              name: 'Aspirin',
              dosage: '100mg',
              color: '#FF4F46E5',
              priority: MedicationPriority.high,
              scheduledTime: DateTime.now(),
              doseStatus: DoseStatus.pending,
              isOverdue: false,
              remainingTimeText: '30 min',
            ),
          ],
        ),
      ],
      summary: const DashboardSummaryModel(
        totalMedications: 1,
        completed: 0,
        missed: 0,
        upcoming: 1,
      ),
    );
  }

  List<Override> baseOverrides() => [
    todayDashboardRepositoryProvider.overrideWithValue(mockDashboardRepo),
    settingsRepositoryProvider.overrideWithValue(mockSettingsRepo),
    notificationManagerProvider.overrideWithValue(mockNotificationManager),
    firstRunProvider.overrideWith(() => _MockFirstRunNotifier()),
  ];

  group('DashboardScreen', () {
    testWidgets('shows loading indicator while loading', (tester) async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockDashboardRepo.getTodayDashboard(filter: any(named: 'filter')),
      ).thenAnswer((_) => Completer<Result<DashboardStateModel>>().future);

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: baseOverrides(),
          child: const DashboardScreen(),
        ),
      );

      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsWidgets);
    });

    testWidgets('shows empty view when no medications', (tester) async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockDashboardRepo.getTodayDashboard(filter: any(named: 'filter')),
      ).thenAnswer((_) async => Success(emptyDashboardState()));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: baseOverrides(),
          child: const DashboardScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byIcon(Icons.medication_outlined), findsOneWidget);
    });

    testWidgets('shows error view on load failure', (tester) async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockDashboardRepo.getTodayDashboard(filter: any(named: 'filter')),
      ).thenAnswer((_) async => Failure(UnknownError('Failed')));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: baseOverrides(),
          child: const DashboardScreen(),
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
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockDashboardRepo.getTodayDashboard(filter: any(named: 'filter')),
      ).thenAnswer((_) async => Success(populatedDashboardState()));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: baseOverrides(),
          child: const DashboardScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.text('Aspirin'), findsOneWidget);
    });

    testWidgets('has app bar with history and settings buttons', (
      tester,
    ) async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockDashboardRepo.getTodayDashboard(filter: any(named: 'filter')),
      ).thenAnswer((_) async => Success(emptyDashboardState()));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: baseOverrides(),
          child: const DashboardScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byIcon(Icons.history), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('has floating action button', (tester) async {
      when(
        () => mockSettingsRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));
      when(
        () => mockDashboardRepo.getTodayDashboard(filter: any(named: 'filter')),
      ).thenAnswer((_) async => Success(emptyDashboardState()));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: baseOverrides(),
          child: const DashboardScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsWidgets);
    });
  });
}
