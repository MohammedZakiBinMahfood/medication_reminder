import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/shared/components/c_button.dart';
import '../../models/models.dart';

class HealthCheckTile extends StatelessWidget {
  final HealthCheckModel check;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;

  const HealthCheckTile({
    super.key,
    required this.check,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: '$title: ${_statusLabel(context)}',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.s,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StatusIcon(status: check.status),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (check.detail != null) ...[
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      check.detail!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (check.pendingCount != null && check.maxSlots != null) ...[
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      '${check.pendingCount} / ${check.maxSlots}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  if (actionLabel != null && onAction != null) ...[
                    const SizedBox(height: AppSpacing.s),
                    CButton.outlined(text: actionLabel!, onPressed: onAction),
                  ],
                ],
              ),
            ),
            _StatusBadge(status: check.status),
          ],
        ),
      ),
    );
  }

  String _statusLabel(BuildContext context) {
    return switch (check.status) {
      HealthStatus.granted => 'Granted',
      HealthStatus.denied => 'Denied',
      HealthStatus.unknown => 'Unknown',
      HealthStatus.ignored => 'Ignored',
      HealthStatus.optimized => 'Optimized',
      HealthStatus.ready => 'Ready',
      HealthStatus.error => 'Error',
      HealthStatus.healthy => 'Healthy',
      HealthStatus.unavailable => 'Unavailable',
    };
  }
}

class _StatusIcon extends StatelessWidget {
  final HealthStatus status;

  const _StatusIcon({required this.status});

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (status) {
      HealthStatus.granted => (Icons.check_circle, Colors.green),
      HealthStatus.healthy => (Icons.check_circle, Colors.green),
      HealthStatus.ready => (Icons.check_circle, Colors.green),
      HealthStatus.denied => (Icons.cancel, Colors.red),
      HealthStatus.error => (Icons.error, Colors.red),
      HealthStatus.optimized => (Icons.warning, Colors.orange),
      HealthStatus.unknown => (Icons.help_outline, Colors.grey),
      HealthStatus.unavailable => (Icons.not_interested, Colors.grey),
      HealthStatus.ignored => (Icons.warning_amber, Colors.orange),
    };

    return Semantics(
      label: 'Status: ${status.name}',
      child: Icon(icon, color: color, size: 24),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final HealthStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      HealthStatus.granted => ('OK', Colors.green),
      HealthStatus.healthy => ('OK', Colors.green),
      HealthStatus.ready => ('OK', Colors.green),
      HealthStatus.denied => ('FAIL', Colors.red),
      HealthStatus.error => ('ERR', Colors.red),
      HealthStatus.optimized => ('WARN', Colors.orange),
      HealthStatus.unknown => ('?', Colors.grey),
      HealthStatus.unavailable => ('N/A', Colors.grey),
      HealthStatus.ignored => ('WARN', Colors.orange),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Semantics(
        label: 'Status: $label',
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
