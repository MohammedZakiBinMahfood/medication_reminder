import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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

    return MaterialApp(
      title: 'Mudawy',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
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

class _WizardOrHome extends ConsumerStatefulWidget {
  const _WizardOrHome();

  @override
  ConsumerState<_WizardOrHome> createState() => _WizardOrHomeState();
}

class _WizardOrHomeState extends ConsumerState<_WizardOrHome> {
  bool? _wizardCompleted;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkWizardStatus();
    });
  }

  Future<void> _checkWizardStatus() async {
    try {
      final repo = ref.read(wizardRepositoryProvider);
      final completed = await repo.isWizardCompleted();
      if (mounted) {
        setState(() {
          _wizardCompleted = completed;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _wizardCompleted = false;
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const SplashScreen();
    }

    if (_wizardCompleted == false) {
      return const WizardScreen();
    }

    return const DashboardScreen();
  }
}
