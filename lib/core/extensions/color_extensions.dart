import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// Converts the Color to a Hex String (e.g. #FF4F46E5)
  String toHex({bool leadingHashSign = true}) {
    final hexString = toARGB32()
        .toRadixString(16)
        .toUpperCase()
        .padLeft(8, '0');
    return '${leadingHashSign ? '#' : ''}$hexString';
  }
}

extension StringColorExtensions on String {
  /// Converts a Hex String to a Color object.
  /// Falls back to a default color if parsing fails.
  Color toColor({Color fallback = Colors.transparent}) {
    try {
      final buffer = StringBuffer();
      if (length == 6 || length == 7) buffer.write('ff');
      buffer.write(replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return fallback;
    }
  }
}
