import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'core/database/database_initializer.dart';
import 'core/database/database_service.dart';
import 'core/notifications/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Database
  final databaseService = DatabaseService();
  await DatabaseInitializer.initialize(databaseService);

  // Initialize Notifications
  final notificationService = NotificationService();
  await notificationService.init();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
