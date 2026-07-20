import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/radius/app_radius.dart';
import '../../models/dashboard_summary_model.dart';

class DashboardSummaryCard extends StatelessWidget {
  final DashboardSummaryModel summary;

  const DashboardSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    final percent = summary.completionPercentage.toStringAsFixed(0);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.xs,
      ),
      child: CCard(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SummaryItem(
                  label: l10n.dashboardTotal,
                  value: '${summary.totalMedications}',
                  color: colorScheme.primary,
                ),
                _SummaryItem(
                  label: l10n.dashboardCompleted,
                  value: '${summary.completed}',
                  color: colorScheme.secondary,
                ),
                _SummaryItem(
                  label: l10n.dashboardMissed,
                  value: '${summary.missed}',
                  color: colorScheme.error,
                ),
                _SummaryItem(
                  label: l10n.dashboardUpcoming,
                  value: '${summary.upcoming}',
                  color: colorScheme.tertiary,
                ),
              ],
            ),
            if (summary.totalMedications > 0) ...[
              const SizedBox(height: AppSpacing.m),
              Semantics(
                label: l10n.a11yProgress(percent),
                child: ClipRRect(
                  borderRadius: AppRadius.borderXs,
                  child: LinearProgressIndicator(
                    value: summary.completionPercentage / 100,
                    minHeight: 6,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xxs),
              Semantics(
                excludeSemantics: true,
                child: Text(
                  '$percent% ${l10n.dashboardCompletedLower}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
            if (summary.nextMedication != null) ...[
              const SizedBox(height: AppSpacing.m),
              Row(
                children: [
                  Icon(Icons.alarm, size: 16, color: colorScheme.primary),
                  const SizedBox(width: AppSpacing.s),
                  Expanded(
                    child: Text(
                      '${l10n.dashboardNext}: ${summary.nextMedication!.name} - ${summary.nextMedication!.remainingTimeText ?? ''}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$label: $value',
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
