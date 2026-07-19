import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'core/database/database_initializer.dart';
import 'core/database/database_provider.dart';
import 'core/database/database_service.dart';
import 'core/notifications/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databaseService = DatabaseService();
  await DatabaseInitializer.initialize(databaseService);

  final notificationService = NotificationService();
  await notificationService.init();

  final container = ProviderContainer(
    overrides: [
      databaseServiceProvider.overrideWithValue(databaseService),
      notificationServiceProvider.overrideWithValue(notificationService),
    ],
  );

  // Request permissions (result is safely wrapped in Result<bool>)
  final manager = container.read(notificationManagerProvider);
  await manager.requestPermissions();

  runApp(UncontrolledProviderScope(container: container, child: const App()));

  // Defer heavy reschedule work to after the first frame renders.
  // The idempotency guard prevents duplicate scheduling if the user
  // navigates before this completes.
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await manager.rescheduleAll();
  });
}
