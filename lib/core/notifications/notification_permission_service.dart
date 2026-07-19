import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Handles notification permission requests across platforms.
class NotificationPermissionService {
  final FlutterLocalNotificationsPlugin _plugin;

  NotificationPermissionService({required this._plugin});

  /// Requests notification permissions on the current platform.
  ///
  /// Returns `true` when at least one platform granted permission.
  Future<bool> request() async {
    final androidGranted = await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    final iosGranted = await _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    final granted = (androidGranted == true) || (iosGranted == true);
    debugPrint(
      'NotificationPermission — granted: $granted '
      '(android: $androidGranted, ios: $iosGranted)',
    );
    return granted;
  }

  /// Checks whether notification permission has been granted.
  Future<bool> get isGranted async {
    final androidGranted = await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.areNotificationsEnabled();

    final iosSettings = await _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.checkPermissions();

    final iosGranted = iosSettings?.isEnabled ?? false;

    return (androidGranted == true) || iosGranted;
  }
}
