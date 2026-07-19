import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/radius/app_radius.dart';
import '../../models/history_statistics_model.dart';

class HistoryStatisticsCard extends StatelessWidget {
  final HistoryStatisticsModel statistics;

  const HistoryStatisticsCard({super.key, required this.statistics});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.historyStatistics,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.m),
            _buildAdherenceBar(context, statistics, l10n),
            const SizedBox(height: AppSpacing.m),
            _buildStatsGrid(context, statistics, l10n),
            const SizedBox(height: AppSpacing.m),
            _buildStreaks(context, statistics, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildAdherenceBar(
    BuildContext context,
    HistoryStatisticsModel statistics,
    AppLocalizations l10n,
  ) {
    final theme = Theme.of(context);
    final adherence = statistics.adherencePercentage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.historyAdherence,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              '${adherence.toStringAsFixed(1)}%',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: _adherenceColor(adherence),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        ClipRRect(
          borderRadius: AppRadius.borderS,
          child: LinearProgressIndicator(
            value: adherence / 100,
            backgroundColor: AppColors.border,
            valueColor: AlwaysStoppedAnimation<Color>(
              _adherenceColor(adherence),
            ),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(
    BuildContext context,
    HistoryStatisticsModel statistics,
    AppLocalizations l10n,
  ) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.s,
      crossAxisSpacing: AppSpacing.s,
      childAspectRatio: 1,
      children: [
        _StatItem(
          label: l10n.historyTaken,
          value: '${statistics.taken}',
          color: AppColors.success,
        ),
        _StatItem(
          label: l10n.historyMissed,
          value: '${statistics.missed}',
          color: AppColors.error,
        ),
        _StatItem(
          label: l10n.historySkipped,
          value: '${statistics.skipped}',
          color: AppColors.warning,
        ),
        _StatItem(
          label: l10n.historySnoozed,
          value: '${statistics.snoozed}',
          color: AppColors.info,
        ),
      ],
    );
  }

  Widget _buildStreaks(
    BuildContext context,
    HistoryStatisticsModel statistics,
    AppLocalizations l10n,
  ) {
    return Row(
      children: [
        Expanded(
          child: _StreakItem(
            label: l10n.historyCurrentStreak,
            value: '${statistics.currentStreak}',
            icon: Icons.local_fire_department,
          ),
        ),
        const SizedBox(width: AppSpacing.m),
        Expanded(
          child: _StreakItem(
            label: l10n.historyLongestStreak,
            value: '${statistics.longestStreak}',
            icon: Icons.emoji_events,
          ),
        ),
      ],
    );
  }

  Color _adherenceColor(double adherence) {
    if (adherence >= 80) return AppColors.success;
    if (adherence >= 50) return AppColors.warning;
    return AppColors.error;
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: AppRadius.borderS,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _StreakItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StreakItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.m),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: AppRadius.borderM,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(width: AppSpacing.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$value days',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
