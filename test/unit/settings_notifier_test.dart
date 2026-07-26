import 'dart:async';
import 'package:app_platform_state/base/base_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_platform_core/core.dart';
import 'package:medication_reminder/features/settings/providers/settings_notifier.dart';
import 'package:medication_reminder/features/settings/repositories/settings_repository_impl.dart';
import 'package:medication_reminder/features/settings/models/settings_model.dart';
import 'package:medication_reminder/features/settings/models/settings_enums.dart';

import '../mocks/mock_repositories.dart';

SettingsModel _defaultSettings() => SettingsModel(
  uuid: 'test-uuid',
  language: 'ar',
  themeMode: AppThemeMode.light,
  firstDayOfWeek: 6,
  timeFormat24: false,
  notificationsEnabled: true,
  notificationSound: true,
  vibrationEnabled: true,
  defaultSnoozeMinutes: 10,
  reminderBeforeMinutes: 0,
  defaultHistoryFilter: AppHistoryFilter.last7Days,
  defaultHistoryGrouping: AppHistoryGrouping.day,
  autoBackupEnabled: false,
  appVersion: '1.0.0',
  buildNumber: '1',
  createdAt: DateTime(2026),
  updatedAt: DateTime(2026),
);

Future<BaseState<SettingsModel>> _waitForState(
  ProviderContainer container, {
  bool expectSuccess = true,
}) async {
  final completer = Completer<BaseState<SettingsModel>>();
  final sub = container.listen(settingsProvider, (prev, next) {
    if (expectSuccess &&
        next.status == LoadStatus.success &&
        !completer.isCompleted) {
      completer.complete(next);
    } else if (!expectSuccess &&
        next.status == LoadStatus.error &&
        !completer.isCompleted) {
      completer.complete(next);
    }
  });
  // Check if already in desired state
  final current = container.read(settingsProvider);
  if (expectSuccess && current.status == LoadStatus.success) {
    completer.complete(current);
  } else if (!expectSuccess && current.status == LoadStatus.error) {
    completer.complete(current);
  }

  final result = await completer.future.timeout(
    const Duration(seconds: 5),
    onTimeout: () => container.read(settingsProvider),
  );
  sub.close();
  return result;
}

void main() {
  late MockSettingsRepository mockRepo;

  setUp(() {
    mockRepo = MockSettingsRepository();
    registerFallbackValue(_defaultSettings());
  });

  ProviderContainer createContainer({bool loadImmediately = true}) {
    if (loadImmediately) {
      when(
        () => mockRepo.loadSettings(),
      ).thenAnswer((_) async => Success(_defaultSettings()));
    }
    return ProviderContainer(
      overrides: [settingsRepositoryProvider.overrideWithValue(mockRepo)],
    );
  }

  group('SettingsNotifier', () {
    test('loads settings successfully', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final state = await _waitForState(container);
      expect(state.status, equals(LoadStatus.success));
      expect(state.data?.language, equals('ar'));
      expect(state.data?.themeMode, equals(AppThemeMode.light));
    });

    test('handles load failure', () async {
      when(
        () => mockRepo.loadSettings(),
      ).thenAnswer((_) async => Failure(UnknownError('Load failed')));

      final container = createContainer(loadImmediately: false);
      addTearDown(container.dispose);

      final state = await _waitForState(container, expectSuccess: false);
      expect(state.status, equals(LoadStatus.error));
    });

    test('updateLanguage performs optimistic update', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await _waitForState(container);

      when(
        () => mockRepo.updateLanguage('en'),
      ).thenAnswer((_) async => const Success(null));

      await container.read(settingsProvider.notifier).updateLanguage('en');

      final state = container.read(settingsProvider);
      expect(state.data?.language, equals('en'));
      verify(() => mockRepo.updateLanguage('en')).called(1);
    });

    test('updateLanguage rolls back on failure', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await _waitForState(container);

      when(
        () => mockRepo.updateLanguage('en'),
      ).thenAnswer((_) async => Failure(UnknownError('Save failed')));

      await container.read(settingsProvider.notifier).updateLanguage('en');

      final state = container.read(settingsProvider);
      expect(state.data?.language, equals('ar'));
    });

    test('updateThemeMode performs optimistic update', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await _waitForState(container);

      when(
        () => mockRepo.updateThemeMode(AppThemeMode.dark),
      ).thenAnswer((_) async => const Success(null));

      await container
          .read(settingsProvider.notifier)
          .updateThemeMode(AppThemeMode.dark);

      final state = container.read(settingsProvider);
      expect(state.data?.themeMode, equals(AppThemeMode.dark));
    });

    test('updateNotificationsEnabled', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await _waitForState(container);

      when(
        () => mockRepo.updateNotificationsEnabled(false),
      ).thenAnswer((_) async => const Success(null));

      await container
          .read(settingsProvider.notifier)
          .updateNotificationsEnabled(false);

      final state = container.read(settingsProvider);
      expect(state.data?.notificationsEnabled, isFalse);
    });

    test('updateDefaultSnoozeMinutes', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await _waitForState(container);

      when(
        () => mockRepo.updateDefaultSnoozeMinutes(15),
      ).thenAnswer((_) async => const Success(null));

      await container
          .read(settingsProvider.notifier)
          .updateDefaultSnoozeMinutes(15);

      final state = container.read(settingsProvider);
      expect(state.data?.defaultSnoozeMinutes, equals(15));
    });

    test('updateAutoBackupEnabled', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await _waitForState(container);

      when(
        () => mockRepo.updateAutoBackupEnabled(true),
      ).thenAnswer((_) async => const Success(null));

      await container
          .read(settingsProvider.notifier)
          .updateAutoBackupEnabled(true);

      final state = container.read(settingsProvider);
      expect(state.data?.autoBackupEnabled, isTrue);
    });

    test('resetToDefaults reloads settings', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await _waitForState(container);

      final resetSettings = _defaultSettings().copyWith(language: 'en');
      when(
        () => mockRepo.resetToDefaults(),
      ).thenAnswer((_) async => Success(resetSettings));

      await container.read(settingsProvider.notifier).resetToDefaults();

      final state = container.read(settingsProvider);
      expect(state.status, equals(LoadStatus.success));
      expect(state.data?.language, equals('en'));
    });
  });
}
