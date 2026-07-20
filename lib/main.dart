import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';
import 'core/database/database_initializer.dart';
import 'core/database/database_provider.dart';
import 'core/database/database_service.dart';
import 'core/notifications/notifications.dart';
import 'features/onboarding/setup_wizard/repositories/wizard_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Init Isar database
  final databaseService = DatabaseService();
  await DatabaseInitializer.initialize(databaseService);

  // 2. Init notifications
  final notificationService = NotificationService();
  await notificationService.init();

  // 3. Init SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // 4. Create ProviderContainer with overrides
  final container = ProviderContainer(
    overrides: [
      databaseServiceProvider.overrideWithValue(databaseService),
      notificationServiceProvider.overrideWithValue(notificationService),
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
  );

  // 5. Request notification permissions (result is safely wrapped in Result<bool>)
  final manager = container.read(notificationManagerProvider);
  await manager.requestPermissions();

  runApp(UncontrolledProviderScope(container: container, child: const App()));

  // 6. Defer heavy reschedule work to after the first frame renders.
  // The idempotency guard prevents duplicate scheduling if the user
  // navigates before this completes.
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await manager.rescheduleAll();
  });
}
