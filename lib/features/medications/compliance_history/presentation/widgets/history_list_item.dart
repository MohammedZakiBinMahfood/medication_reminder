import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/radius/app_radius.dart';
import 'package:medication_reminder/shared/components/priority_badge.dart';
import '../../../medication_management/models/enums/medication_enums.dart';
import '../../models/history_item_model.dart';

class HistoryListItem extends StatelessWidget {
  final HistoryItemModel item;

  const HistoryListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final statusLabel = _statusLabel(item.status, l10n);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.xs,
      ),
      child: Semantics(
        label: l10n.a11yHistoryItem(
          item.medicationName,
          statusLabel,
          item.formattedTime,
        ),
        child: Row(
          children: [
            _buildColorBar(),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.medicationName,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      PriorityBadge(priority: item.priority),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        item.dosage,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.s),
                      Icon(
                        Icons.access_time,
                        size: 12,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        item.formattedTime,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            _buildStatusBadge(context, statusLabel),
          ],
        ),
      ),
    );
  }

  Widget _buildColorBar() {
    final color = _parseColor(item.medicationColor);
    return Semantics(
      excludeSemantics: true,
      child: Container(
        width: 4,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: AppRadius.borderXs,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String statusLabel) {
    final l10n = AppLocalizations.of(context);
    final (label, color, icon) = switch (item.status) {
      DoseStatus.taken => (
        l10n.historyTaken,
        AppColors.success,
        Icons.check_circle,
      ),
      DoseStatus.missed => (l10n.historyMissed, AppColors.error, Icons.cancel),
      DoseStatus.skipped => (
        l10n.historySkipped,
        AppColors.warning,
        Icons.skip_next,
      ),
      DoseStatus.pending => (l10n.historySnoozed, AppColors.info, Icons.snooze),
    };

    return Semantics(
      label: statusLabel,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s,
          vertical: AppSpacing.xxs,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: AppRadius.borderS,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _statusLabel(DoseStatus status, AppLocalizations l10n) {
    return switch (status) {
      DoseStatus.taken => l10n.historyTaken,
      DoseStatus.missed => l10n.historyMissed,
      DoseStatus.skipped => l10n.historySkipped,
      DoseStatus.pending => l10n.historySnoozed,
    };
  }

  Color _parseColor(String hex) {
    try {
      final buffer = StringBuffer();
      if (hex.length == 6 || hex.length == 7) buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return AppColors.textSecondary;
    }
  }
}
