import 'package:flutter/material.dart';
import '../core/design_system/theme/app_theme.dart';
import '../shared/navigation/c_navigator.dart';
import 'home_placeholder_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Reminder',
      theme: AppTheme.lightTheme,
      navigatorKey: CNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const HomePlaceholderScreen(),
    );
  }
}
