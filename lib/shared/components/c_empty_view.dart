import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/shared/components/c_button.dart';

class CEmptyView extends StatelessWidget {
  final String? message;
  final IconData? icon;
  final String? title;
  final String? description;
  final String? actionLabel;
  final VoidCallback? onAction;

  const CEmptyView({
    super.key,
    this.message,
    this.icon,
    this.title,
    this.description,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasNewFeatures = title != null || description != null;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 64,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: AppSpacing.l),
            ],
            if (hasNewFeatures) ...[
              if (title != null)
                Text(
                  title!,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (title != null && description != null)
                const SizedBox(height: AppSpacing.l),
              if (description != null)
                Text(
                  description!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (title != null && message != null && message!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.l),
                Text(
                  message!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ] else if (message != null) ...[
              Text(
                message!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.l),
              CButton(text: actionLabel!, onPressed: onAction!),
            ],
          ],
        ),
      ),
    );
  }
}
