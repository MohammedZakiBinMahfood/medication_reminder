import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_platform_core/core.dart';
import 'package:medication_reminder/features/settings/repositories/settings_repository_impl.dart';
import 'package:medication_reminder/features/settings/presentation/screens/settings_screen.dart';
import 'package:medication_reminder/features/settings/models/settings_model.dart';

import '../helpers/widget_test_helper.dart';
import '../helpers/test_fixtures.dart';
import '../mocks/mock_repositories.dart';

void main() {
  late MockSettingsRepository mockRepo;

  setUp(() {
    mockRepo = MockSettingsRepository();
    registerFallbackValue(TestFixtures.settings());
  });

  group('SettingsScreen', () {
    testWidgets('shows loading indicator while loading', (tester) async {
      when(
        () => mockRepo.loadSettings(),
      ).thenAnswer((_) => Completer<Result<SettingsModel>>().future);

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [settingsRepositoryProvider.overrideWithValue(mockRepo)],
          child: const SettingsScreen(),
        ),
      );

      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows settings content when loaded', (tester) async {
      when(
        () => mockRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [settingsRepositoryProvider.overrideWithValue(mockRepo)],
          child: const SettingsScreen(),
        ),
      );

      // Let microtask _load complete + rebuild
      await tester.pump();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('shows error view when load fails', (tester) async {
      when(
        () => mockRepo.loadSettings(),
      ).thenAnswer((_) async => Failure(UnknownError('Failed')));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [settingsRepositoryProvider.overrideWithValue(mockRepo)],
          child: const SettingsScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('has app bar', (tester) async {
      when(
        () => mockRepo.loadSettings(),
      ).thenAnswer((_) async => Success(TestFixtures.settings()));

      await tester.pumpWidget(
        WidgetTestHelper.wrapFullScreen(
          overrides: [settingsRepositoryProvider.overrideWithValue(mockRepo)],
          child: const SettingsScreen(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
