import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medication_reminder/features/onboarding/setup_wizard/providers/wizard_notifier.dart';
import '../core/design_system/theme/app_theme.dart';
import '../features/medications/today_dashboard/presentation/screens/dashboard_screen.dart';
import '../features/onboarding/setup_wizard/presentation/screens/wizard_screen.dart';
import '../features/onboarding/setup_wizard/repositories/wizard_repository_impl.dart';
import '../features/settings/models/settings_enums.dart';
import '../features/settings/providers/providers.dart';
import '../l10n/app_localizations.dart';
import '../shared/navigation/c_navigator.dart';
import 'screens/splash_screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);
    final settings = settingsState.data;

    final themeMode = switch (settings?.themeMode) {
      AppThemeMode.light => ThemeMode.light,
      AppThemeMode.dark => ThemeMode.dark,
      AppThemeMode.system || null => ThemeMode.system,
    };

    final locale = switch (settings?.language) {
      'en' => const Locale('en'),
      _ => const Locale('ar'),
    };

    final accent = settings?.accentColor ?? AppAccentColor.indigo;

    return MaterialApp(
      title: 'Mudawy',
      theme: AppTheme.buildLightTheme(accent),
      darkTheme: AppTheme.buildDarkTheme(accent),
      themeMode: themeMode,
      navigatorKey: CNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const _WizardOrHome(),
    );
  }
}

class _WizardOrHome extends ConsumerWidget {
  const _WizardOrHome();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wizardProvider);

    if (state.isLoading) {
      return const SplashScreen();
    }

    if (!state.isCompleted) {
      return const WizardScreen();
    }

    return const DashboardScreen();
  }
}
