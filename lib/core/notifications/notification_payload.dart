import 'dart:convert';

import 'notification_constants.dart';

/// Immutable payload attached to every scheduled notification.
///
/// Contains only IDs and action metadata — no medication names or UI text.
class NotificationPayload {
  final String medicationId;
  final String scheduleId;
  final int notificationId;
  final String actionType;

  const NotificationPayload({
    required this.medicationId,
    required this.scheduleId,
    required this.notificationId,
    required this.actionType,
  });

  /// Serialise to a JSON string for `flutter_local_notifications` payload.
  String toJsonString() => jsonEncode({
    NotificationConstants.payloadMedicationId: medicationId,
    NotificationConstants.payloadScheduleId: scheduleId,
    NotificationConstants.payloadNotificationId: notificationId,
    NotificationConstants.payloadActionType: actionType,
  });

  /// Deserialise from the raw payload string received by the plugin.
  ///
  /// Returns `null` when the string is malformed or missing required keys.
  static NotificationPayload? fromJsonString(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return NotificationPayload(
        medicationId: map[NotificationConstants.payloadMedicationId] as String,
        scheduleId: map[NotificationConstants.payloadScheduleId] as String,
        notificationId:
            (map[NotificationConstants.payloadNotificationId] as num).toInt(),
        actionType: map[NotificationConstants.payloadActionType] as String,
      );
    } catch (_) {
      return null;
    }
  }

  /// Creates a copy with a different [actionType].
  NotificationPayload withAction(String newAction) => NotificationPayload(
    medicationId: medicationId,
    scheduleId: scheduleId,
    notificationId: notificationId,
    actionType: newAction,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPayload &&
          medicationId == other.medicationId &&
          scheduleId == other.scheduleId &&
          notificationId == other.notificationId &&
          actionType == other.actionType;

  @override
  int get hashCode =>
      Object.hash(medicationId, scheduleId, notificationId, actionType);

  @override
  String toString() =>
      'NotificationPayload(med: $medicationId, sch: $scheduleId, '
      'id: $notificationId, action: $actionType)';
}
