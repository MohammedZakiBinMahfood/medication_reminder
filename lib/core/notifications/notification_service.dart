import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import 'notification_constants.dart';

/// Low-level wrapper around `flutter_local_notifications`.
///
/// Owns the plugin instance, timezone initialisation, and all primitive
/// scheduling/cancelling operations.  Contains zero business logic.
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  /// Expose the plugin instance for services that need platform access
  /// (e.g. permission checks).
  FlutterLocalNotificationsPlugin get plugin => _plugin;

  /// Callback invoked when the user taps a notification action.
  void Function(NotificationResponse response)? onActionReceived;

  // ── Initialisation ─────────────────────────────────────────────────────

  Future<void> init() async {
    if (_initialized) return;

    tz_data.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const darwinSettings = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
    );

    await _plugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: _handleResponse,
    );

    _initialized = true;
  }

  bool get isInitialised => _initialized;

  // ── Response routing ───────────────────────────────────────────────────

  void _handleResponse(NotificationResponse response) {
    debugPrint(
      'NotificationService — response id=${response.id} '
      'action=${response.actionId} payload=${response.payload}',
    );
    onActionReceived?.call(response);
  }

  // ── Scheduling primitives ──────────────────────────────────────────────

  NotificationDetails _buildDetails() {
    const android = AndroidNotificationDetails(
      NotificationConstants.androidChannelId,
      NotificationConstants.androidChannelName,
      channelDescription: NotificationConstants.androidChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );
    const darwin = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    return const NotificationDetails(
      android: android,
      iOS: darwin,
      macOS: darwin,
    );
  }

  /// One-shot notification at a specific [scheduledDate].
  Future<void> scheduleOneShot({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    final tzDateTime = tz.TZDateTime.from(scheduledDate, tz.local);
    if (tzDateTime.isBefore(tz.TZDateTime.now(tz.local))) {
      debugPrint('NotificationService — skipped past id=$notificationId');
      return;
    }
    await _plugin.zonedSchedule(
      id: notificationId,
      title: title,
      body: body,
      scheduledDate: tzDateTime,
      notificationDetails: _buildDetails(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: payload,
    );
  }

  /// Daily recurring notification (matches time-of-day).
  Future<void> scheduleDaily({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    final tzDateTime = tz.TZDateTime.from(scheduledDate, tz.local);
    await _plugin.zonedSchedule(
      id: notificationId,
      title: title,
      body: body,
      scheduledDate: tzDateTime,
      notificationDetails: _buildDetails(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }

  /// Weekly recurring notification on a specific day-of-week + time.
  Future<void> scheduleWeekly({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    final tzDateTime = tz.TZDateTime.from(scheduledDate, tz.local);
    await _plugin.zonedSchedule(
      id: notificationId,
      title: title,
      body: body,
      scheduledDate: tzDateTime,
      notificationDetails: _buildDetails(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: payload,
    );
  }

  /// Periodic notification at a fixed [interval].
  Future<void> schedulePeriodic({
    required int notificationId,
    required Duration interval,
    required String title,
    required String body,
    String? payload,
  }) async {
    await _plugin.periodicallyShowWithDuration(
      id: notificationId,
      repeatDurationInterval: interval,
      title: title,
      body: body,
      notificationDetails: _buildDetails(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: payload,
    );
  }

  // ── Cancellation ───────────────────────────────────────────────────────

  Future<void> cancel(int notificationId) async {
    await _plugin.cancel(id: notificationId);
  }

  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  // ── Queries ────────────────────────────────────────────────────────────

  Future<List<PendingNotificationRequest>> getPending() async {
    return _plugin.pendingNotificationRequests();
  }
}
