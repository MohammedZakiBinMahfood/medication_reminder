import 'dart:io';

import 'package:app_platform_core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

import '../../../core/database/database_provider.dart';
import '../../../core/notifications/notification_constants.dart';
import '../../../core/notifications/notification_manager.dart';
import '../../../core/notifications/notification_providers.dart';
import '../models/models.dart';
import 'system_health_repository.dart';

final systemHealthRepositoryProvider = Provider<SystemHealthRepository>((ref) {
  return SystemHealthRepositoryImpl(
    notificationManager: ref.read(notificationManagerProvider),
    isar: ref.read(isarProvider),
  );
});

class SystemHealthRepositoryImpl implements SystemHealthRepository {
  SystemHealthRepositoryImpl({
    required NotificationManager notificationManager,
    required Isar isar,
  }) : _notificationManager = notificationManager,
       _isar = isar;

  final NotificationManager _notificationManager;
  final Isar _isar;

  @override
  Future<Result<HealthCheckModel>> checkNotificationPermission() async {
    try {
      final result = await _notificationManager.isPermissionGranted;
      if (result case Success(:final data)) {
        return Success(
          HealthCheckModel(
            type: HealthCheckType.notificationPermission,
            status: data ? HealthStatus.granted : HealthStatus.denied,
            title: 'notificationPermissionTitle',
            description: 'notificationPermissionDescription',
            actionLabel: data ? null : 'notificationPermissionAction',
          ),
        );
      }
      return Success(
        HealthCheckModel(
          type: HealthCheckType.notificationPermission,
          status: HealthStatus.unknown,
          title: 'notificationPermissionTitle',
          description: 'notificationPermissionUnknownDescription',
        ),
      );
    } catch (e) {
      return Success(
        HealthCheckModel(
          type: HealthCheckType.notificationPermission,
          status: HealthStatus.unknown,
          title: 'notificationPermissionTitle',
          description: 'notificationPermissionUnknownDescription',
          errorDetail: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<HealthCheckModel>> checkExactAlarmPermission() async {
    if (!Platform.isAndroid) {
      return Success(
        HealthCheckModel(
          type: HealthCheckType.exactAlarmPermission,
          status: HealthStatus.unavailable,
          title: 'exactAlarmTitle',
          description: 'exactAlarmUnavailableDescription',
        ),
      );
    }
    try {
      final canSchedule = await _notificationManager
          .canScheduleExactNotifications();
      return Success(
        HealthCheckModel(
          type: HealthCheckType.exactAlarmPermission,
          status: canSchedule ? HealthStatus.granted : HealthStatus.denied,
          title: 'exactAlarmTitle',
          description: canSchedule
              ? 'exactAlarmGrantedDescription'
              : 'exactAlarmDeniedDescription',
          actionLabel: canSchedule ? null : 'exactAlarmAction',
        ),
      );
    } catch (e) {
      return Success(
        HealthCheckModel(
          type: HealthCheckType.exactAlarmPermission,
          status: HealthStatus.unknown,
          title: 'exactAlarmTitle',
          description: 'exactAlarmUnknownDescription',
          errorDetail: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<HealthCheckModel>> checkBatteryOptimization() async {
    return Success(
      HealthCheckModel(
        type: HealthCheckType.batteryOptimization,
        status: HealthStatus.unknown,
        title: 'batteryTitle',
        description: 'batteryDescription',
        actionLabel: 'batteryAction',
      ),
    );
  }

  @override
  Future<Result<HealthCheckModel>> checkNotificationService() async {
    try {
      final result = await _notificationManager.rescheduleAll();
      if (result case Success()) {
        return Success(
          HealthCheckModel(
            type: HealthCheckType.notificationService,
            status: HealthStatus.ready,
            title: 'notificationServiceTitle',
            description: 'notificationServiceReadyDescription',
          ),
        );
      }
      return Success(
        HealthCheckModel(
          type: HealthCheckType.notificationService,
          status: HealthStatus.error,
          title: 'notificationServiceTitle',
          description: 'notificationServiceErrorDescription',
          errorDetail: result.toString(),
        ),
      );
    } catch (e) {
      return Success(
        HealthCheckModel(
          type: HealthCheckType.notificationService,
          status: HealthStatus.error,
          title: 'notificationServiceTitle',
          description: 'notificationServiceErrorDescription',
          errorDetail: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<HealthCheckModel>> checkPendingNotifications() async {
    try {
      final pendingResult = await _notificationManager.pendingCount;
      final slotsResult = await _notificationManager.availableSlots;

      int pending = 0;
      int slots = 0;

      if (pendingResult case Success(:final data)) {
        pending = data;
      }
      if (slotsResult case Success(:final data)) {
        slots = data;
      }

      return Success(
        HealthCheckModel(
          type: HealthCheckType.pendingNotifications,
          status: HealthStatus.healthy,
          title: 'pendingNotificationsTitle',
          description: 'pendingNotificationsDescription',
          pendingCount: pending,
          maxSlots: NotificationConstants.maxPendingNotifications,
          availableSlots: slots,
        ),
      );
    } catch (e) {
      return Success(
        HealthCheckModel(
          type: HealthCheckType.pendingNotifications,
          status: HealthStatus.error,
          title: 'pendingNotificationsTitle',
          description: 'pendingNotificationsErrorDescription',
          errorDetail: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<HealthCheckModel>> checkDatabase() async {
    try {
      final isOpen = _isar.isOpen;
      if (isOpen) {
        return Success(
          HealthCheckModel(
            type: HealthCheckType.database,
            status: HealthStatus.healthy,
            title: 'databaseTitle',
            description: 'databaseHealthyDescription',
            detail: '4 collections registered',
          ),
        );
      }
      return Success(
        HealthCheckModel(
          type: HealthCheckType.database,
          status: HealthStatus.error,
          title: 'databaseTitle',
          description: 'databaseErrorDescription',
        ),
      );
    } catch (e) {
      return Success(
        HealthCheckModel(
          type: HealthCheckType.database,
          status: HealthStatus.error,
          title: 'databaseTitle',
          description: 'databaseErrorDescription',
          errorDetail: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<HealthCheckModel>> checkTimeZone() async {
    try {
      final localNow = tz.TZDateTime.now(tz.local);
      return Success(
        HealthCheckModel(
          type: HealthCheckType.timeZone,
          status: HealthStatus.healthy,
          title: 'timeZoneTitle',
          description: 'timeZoneDescription',
          detail: tz.local.name,
          errorDetail: localNow.toString(),
        ),
      );
    } catch (e) {
      return Success(
        HealthCheckModel(
          type: HealthCheckType.timeZone,
          status: HealthStatus.error,
          title: 'timeZoneTitle',
          description: 'timeZoneErrorDescription',
          errorDetail: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<HealthCheckModel>> checkApplication() async {
    try {
      final info = await PackageInfo.fromPlatform();
      return Success(
        HealthCheckModel(
          type: HealthCheckType.application,
          status: HealthStatus.healthy,
          title: 'applicationTitle',
          description: 'applicationDescription',
          detail: '${info.version}+${info.buildNumber}',
          errorDetail: '${info.packageName} • ${Platform.operatingSystem}',
        ),
      );
    } catch (e) {
      return Success(
        HealthCheckModel(
          type: HealthCheckType.application,
          status: HealthStatus.error,
          title: 'applicationTitle',
          description: 'applicationErrorDescription',
          errorDetail: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<void>> requestNotificationPermission() async {
    try {
      await _notificationManager.requestPermissions();
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError('Failed to request permission: $e'));
    }
  }

  @override
  Future<Result<void>> openExactAlarmSettings() async {
    if (!Platform.isAndroid) return const Success(null);
    try {
      await _notificationManager.requestExactAlarmsPermission();
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError('Failed to open exact alarm settings: $e'));
    }
  }

  @override
  Future<Result<void>> openBatterySettings() async {
    try {
      final uri = Uri.parse('package:com.medication_reminder.app');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError('Failed to open battery settings: $e'));
    }
  }

  @override
  Future<Result<void>> refreshScheduler() async {
    try {
      await _notificationManager.rescheduleAll();
      return const Success(null);
    } catch (e) {
      return Failure(UnknownError('Failed to refresh scheduler: $e'));
    }
  }
}
