import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/medications/medication_management/providers/repository_providers.dart';
import 'next_occurrence_calculator.dart';
import 'notification_action_handler.dart';
import 'notification_boot_handler.dart';
import 'notification_manager.dart';
import 'notification_permission_service.dart';
import 'notification_queue_manager.dart';
import 'notification_scheduler.dart';
import 'notification_service.dart';

/// The single plugin wrapper instance.
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

/// Permission handling.
final notificationPermissionServiceProvider =
    Provider<NotificationPermissionService>((ref) {
      final service = ref.watch(notificationServiceProvider);
      return NotificationPermissionService(plugin: service.plugin);
    });

/// Pure calculator for next occurrence of any schedule repeat type.
final nextOccurrenceCalculatorProvider = Provider<NextOccurrenceCalculator>((
  ref,
) {
  return NextOccurrenceCalculator();
});

/// Manages the iOS 64-notification limit queue.
final notificationQueueManagerProvider = Provider<NotificationQueueManager>((
  ref,
) {
  final service = ref.watch(notificationServiceProvider);
  final calculator = ref.watch(nextOccurrenceCalculatorProvider);
  return NotificationQueueManager(service: service, calculator: calculator);
});

/// Scheduling logic.
final notificationSchedulerProvider = Provider<NotificationScheduler>((ref) {
  final service = ref.watch(notificationServiceProvider);
  final repository = ref.watch(medicationRepositoryProvider);
  final calculator = ref.watch(nextOccurrenceCalculatorProvider);
  final queueManager = ref.watch(notificationQueueManagerProvider);
  return NotificationScheduler(
    service: service,
    repository: repository,
    calculator: calculator,
    queueManager: queueManager,
  );
});

/// Background action processing.
final notificationActionHandlerProvider = Provider<NotificationActionHandler>((
  ref,
) {
  final repository = ref.watch(medicationRepositoryProvider);
  final scheduler = ref.watch(notificationSchedulerProvider);
  return NotificationActionHandler(
    repository: repository,
    scheduler: scheduler,
  );
});

/// Boot and resume handling.
final notificationBootHandlerProvider = Provider<NotificationBootHandler>((
  ref,
) {
  final service = ref.watch(notificationServiceProvider);
  final scheduler = ref.watch(notificationSchedulerProvider);
  return NotificationBootHandler(service: service, scheduler: scheduler);
});

/// The single public API for the entire notification engine.
final notificationManagerProvider = Provider<NotificationManager>((ref) {
  final service = ref.watch(notificationServiceProvider);
  final permissions = ref.watch(notificationPermissionServiceProvider);
  final scheduler = ref.watch(notificationSchedulerProvider);
  final actionHandler = ref.watch(notificationActionHandlerProvider);
  final bootHandler = ref.watch(notificationBootHandlerProvider);
  final queueManager = ref.watch(notificationQueueManagerProvider);
  return NotificationManager(
    service: service,
    permissions: permissions,
    scheduler: scheduler,
    actionHandler: actionHandler,
    bootHandler: bootHandler,
    queueManager: queueManager,
  );
});
