import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';

class CSnackbar {
  static void success(BuildContext context, String message) {
    _show(
      context,
      message,
      AppColors.success,
      Icons.check_circle,
      const Duration(seconds: 2),
    );
  }

  static void error(BuildContext context, String message) {
    _show(
      context,
      message,
      AppColors.error,
      Icons.error,
      const Duration(seconds: 3),
    );
  }

  static void warning(BuildContext context, String message) {
    _show(
      context,
      message,
      AppColors.warning,
      Icons.warning,
      const Duration(seconds: 3),
    );
  }

  static void info(BuildContext context, String message) {
    _show(
      context,
      message,
      AppColors.info,
      Icons.info,
      const Duration(seconds: 2),
    );
  }

  static void _show(
    BuildContext context,
    String message,
    Color color,
    IconData icon,
    Duration duration,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: duration,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
