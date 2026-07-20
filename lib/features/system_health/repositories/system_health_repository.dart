import 'package:app_platform_core/core.dart';
import '../models/models.dart';

abstract class SystemHealthRepository {
  Future<Result<HealthCheckModel>> checkNotificationPermission();
  Future<Result<HealthCheckModel>> checkExactAlarmPermission();
  Future<Result<HealthCheckModel>> checkBatteryOptimization();
  Future<Result<HealthCheckModel>> checkNotificationService();
  Future<Result<HealthCheckModel>> checkPendingNotifications();
  Future<Result<HealthCheckModel>> checkDatabase();
  Future<Result<HealthCheckModel>> checkTimeZone();
  Future<Result<HealthCheckModel>> checkApplication();
  Future<Result<void>> requestNotificationPermission();
  Future<Result<void>> openExactAlarmSettings();
  Future<Result<void>> openBatterySettings();
  Future<Result<void>> refreshScheduler();
}
