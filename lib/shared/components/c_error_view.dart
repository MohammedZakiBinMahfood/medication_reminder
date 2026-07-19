import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'c_button.dart';

class CErrorView extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const CErrorView({super.key, required this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: AppSpacing.l),
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.xl),
              CButton.outlined(text: 'Retry', onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
