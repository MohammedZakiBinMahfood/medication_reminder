import 'package:flutter/foundation.dart';

enum HealthStatus { granted, denied, unknown, ignored, optimized, ready, error, healthy, unavailable }

enum HealthCheckType {
  notificationPermission,
  exactAlarmPermission,
  batteryOptimization,
  notificationService,
  pendingNotifications,
  database,
  timeZone,
  application,
}

class HealthCheckModel {
  final HealthCheckType type;
  final HealthStatus status;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;
  final int? pendingCount;
  final int? maxSlots;
  final int? availableSlots;
  final String? detail;
  final String? errorDetail;

  const HealthCheckModel({
    required this.type,
    required this.status,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onAction,
    this.pendingCount,
    this.maxSlots,
    this.availableSlots,
    this.detail,
    this.errorDetail,
  });

  HealthCheckModel copyWith({
    HealthStatus? status,
    String? description,
    String? actionLabel,
    VoidCallback? onAction,
    int? pendingCount,
    int? maxSlots,
    int? availableSlots,
    String? detail,
    String? errorDetail,
  }) {
    return HealthCheckModel(
      type: type,
      status: status ?? this.status,
      title: title,
      description: description ?? this.description,
      actionLabel: actionLabel ?? this.actionLabel,
      onAction: onAction ?? this.onAction,
      pendingCount: pendingCount ?? this.pendingCount,
      maxSlots: maxSlots ?? this.maxSlots,
      availableSlots: availableSlots ?? this.availableSlots,
      detail: detail ?? this.detail,
      errorDetail: errorDetail ?? this.errorDetail,
    );
  }

  bool get isFailed =>
      status == HealthStatus.denied ||
      status == HealthStatus.error ||
      status == HealthStatus.optimized ||
      status == HealthStatus.unknown;
}
