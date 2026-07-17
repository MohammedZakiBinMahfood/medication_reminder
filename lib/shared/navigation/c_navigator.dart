import 'package:flutter/material.dart';

class CNavigator {
  CNavigator._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?> push<T>(Widget page) {
    return navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<T?> pushReplacement<T, TO>(Widget page, {TO? result}) {
    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
      result: result,
    );
  }

  static Future<T?> pushAndRemoveUntil<T>(Widget page, bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      predicate,
    );
  }

  static void pop<T>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }
}
