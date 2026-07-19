import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../core/design_system/theme/app_theme.dart';
import '../features/medications/today_dashboard/presentation/screens/dashboard_screen.dart';
import '../features/settings/models/settings_enums.dart';
import '../features/settings/providers/providers.dart';
import '../l10n/app_localizations.dart';
import '../shared/navigation/c_navigator.dart';

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
      title: 'Medication Reminder',
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
      home: const DashboardScreen(),
    );
  }
}
