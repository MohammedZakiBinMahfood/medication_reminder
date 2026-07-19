import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/radius/app_radius.dart';
import '../../models/dashboard_enums.dart';

class DashboardSectionHeader extends StatelessWidget {
  final DashboardSectionType type;
  final int count;

  const DashboardSectionHeader({
    super.key,
    required this.type,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    final (label, icon, color) = switch (type) {
      DashboardSectionType.overdue => (
        l10n.dashboardOverdue,
        Icons.warning_amber_rounded,
        colorScheme.error,
      ),
      DashboardSectionType.upcoming => (
        l10n.dashboardUpcoming,
        Icons.schedule,
        colorScheme.tertiary,
      ),
      DashboardSectionType.completed => (
        l10n.dashboardCompleted,
        Icons.check_circle_outline,
        colorScheme.secondary,
      ),
    };

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.l,
        AppSpacing.l,
        AppSpacing.l,
        AppSpacing.s,
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: AppSpacing.s),
          Text(
            '$label ($count)',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s,
              vertical: AppSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: AppRadius.borderM,
            ),
            child: Text(
              '$count',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
