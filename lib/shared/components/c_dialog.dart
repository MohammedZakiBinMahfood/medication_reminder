import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';

class CDialog {
  CDialog._();

  static Future<bool?> confirm({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmText,
    required String cancelText,
    VoidCallback? onConfirm,
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Semantics(
            label: title,
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          content: Text(content, style: Theme.of(context).textTheme.bodyMedium),
          actions: [
            TextButton(
              autofocus: true,
              onPressed: () => Navigator.pop(context),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () {
                onConfirm?.call();
                Navigator.pop(context);
              },
              child: Text(
                confirmText,
                style: isDestructive
                    ? const TextStyle(color: AppColors.error)
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
