import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/shared/components/priority_badge.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/radius/app_radius.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/extensions/color_extensions.dart';
import 'package:medication_reminder/core/utils/time_formatter.dart';
import '../../../medication_management/models/enums/medication_enums.dart';
import '../../models/dashboard_medication_model.dart';

class DashboardMedicationCard extends StatelessWidget {
  final DashboardMedicationModel medication;
  final VoidCallback onTaken;
  final VoidCallback onSkipped;
  final Function(int minutes) onSnooze;

  const DashboardMedicationCard({
    super.key,
    required this.medication,
    required this.onTaken,
    required this.onSkipped,
    required this.onSnooze,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final medicationColor = medication.color.toColor();
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final cardLabel =
        '${medication.name} ${medication.dosage} ${_formatTime(medication.scheduledTime, isArabic)}';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.xs,
      ),
      child: Semantics(
        label: cardLabel,
        child: CCard(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Row(
            children: [
              if (medication.imagePath != null && medication.imagePath!.isNotEmpty) ...[
                ClipRRect(
                  borderRadius: AppRadius.borderS,
                  child: Image.file(
                    File(medication.imagePath!),
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(
                      width: 6,
                      height: 50,
                      decoration: BoxDecoration(
                        color: medicationColor,
                        borderRadius: AppRadius.borderXs,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.s),
              ] else ...[
                Container(
                  width: 6,
                  height: 50,
                  decoration: BoxDecoration(
                    color: medicationColor,
                    borderRadius: AppRadius.borderXs,
                  ),
                ),
                const SizedBox(width: AppSpacing.m),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            medication.name,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (medication.foodInstruction != FoodInstruction.none) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              _formatFoodInstruction(
                                l10n,
                                medication.foodInstruction,
                              )!,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.xs),
                        ],
                        PriorityBadge(priority: medication.priority),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Text(
                          medication.dosage,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                        const SizedBox(width: AppSpacing.m),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          _formatTime(medication.scheduledTime, isArabic),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                        if (medication.remainingTimeText != null) ...[
                          const SizedBox(width: AppSpacing.m),
                          Semantics(
                            label: l10n.a11yRemainingTime(
                              medication.remainingTimeText!,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 14,
                                  color: colorScheme.primary,
                                ),
                                const SizedBox(width: AppSpacing.xs),
                                Text(
                                  medication.remainingTimeText!,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (medication.isOverdue) ...[
                          const SizedBox(width: AppSpacing.m),
                          Semantics(
                            label: l10n.a11yOverdue,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  size: 14,
                                  color: colorScheme.error,
                                ),
                                const SizedBox(width: AppSpacing.xs),
                                Text(
                                  l10n.dashboardOverdueLabel,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: colorScheme.error,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (medication.stockQuantity != null) ...[
                          const SizedBox(width: AppSpacing.m),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                size: 14,
                                color: medication.isLowStock
                                    ? colorScheme.error
                                    : colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              Text(
                                '${medication.stockQuantity}',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: medication.isLowStock
                                          ? colorScheme.error
                                          : colorScheme.onSurfaceVariant,
                                      fontWeight: medication.isLowStock
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppSpacing.s),
                    _buildStatusRow(context, l10n),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusRow(BuildContext context, AppLocalizations l10n) {
    final colorScheme = Theme.of(context).colorScheme;

    if (medication.doseStatus == DoseStatus.taken) {
      return Semantics(
        label: l10n.a11yDoseTaken,
        child: Row(
          children: [
            Icon(Icons.check_circle, size: 16, color: colorScheme.secondary),
            const SizedBox(width: AppSpacing.xs),
            Text(
              l10n.dashboardTaken,
              style: TextStyle(fontSize: 12, color: colorScheme.secondary),
            ),
          ],
        ),
      );
    }
    if (medication.doseStatus == DoseStatus.skipped) {
      return Semantics(
        label: l10n.a11yDoseSkipped,
        child: Row(
          children: [
            Icon(Icons.cancel, size: 16, color: colorScheme.tertiary),
            const SizedBox(width: AppSpacing.xs),
            Text(
              l10n.dashboardSkipped,
              style: TextStyle(fontSize: 12, color: colorScheme.tertiary),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        _ActionButton(
          label: l10n.dashboardTake,
          icon: Icons.check,
          color: colorScheme.secondary,
          onPressed: onTaken,
        ),
        const SizedBox(width: AppSpacing.s),
        _ActionButton(
          label: l10n.dashboardSkip,
          icon: Icons.close,
          color: colorScheme.tertiary,
          onPressed: onSkipped,
        ),
        const SizedBox(width: AppSpacing.s),
        _SnoozeButton(onSnooze: onSnooze),
      ],
    );
  }

  String _formatTime(DateTime time, bool isArabic) {
    return AppTimeFormatter.formatDateTime(time, isArabic: isArabic);
  }

  String? _formatFoodInstruction(AppLocalizations l10n, FoodInstruction inst) {
    switch (inst) {
      case FoodInstruction.none:
        return null;
      case FoodInstruction.beforeMeal:
        return l10n.foodInstructionBeforeMeal;
      case FoodInstruction.withMeal:
        return l10n.foodInstructionWithMeal;
      case FoodInstruction.afterMeal:
        return l10n.foodInstructionAfterMeal;
      case FoodInstruction.onEmptyStomach:
        return l10n.foodInstructionOnEmptyStomach;
      case FoodInstruction.beforeBed:
        return l10n.foodInstructionBeforeBed;
    }
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: onPressed,
        borderRadius: AppRadius.borderM,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s,
            vertical: AppSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: AppRadius.borderM,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: AppSpacing.xs),
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SnoozeButton extends StatelessWidget {
  final Function(int minutes) onSnooze;

  const _SnoozeButton({required this.onSnooze});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      button: true,
      label: l10n.dashboardSnooze,
      child: InkWell(
        onTap: () => _showSnoozeOptions(context, l10n),
        borderRadius: AppRadius.borderM,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s,
            vertical: AppSpacing.xxs,
          ),
          decoration: BoxDecoration(
            color: AppColors.info.withValues(alpha: 0.1),
            borderRadius: AppRadius.borderM,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.snooze, size: 14, color: AppColors.info),
              const SizedBox(width: AppSpacing.xs),
              Text(
                l10n.dashboardSnooze,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.info,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnoozeOptions(BuildContext context, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Text(
                l10n.dashboardSnoozeDuration,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            for (final minutes in [5, 10, 15, 30])
              ListTile(
                leading: const Icon(Icons.snooze),
                title: Text('$minutes ${l10n.dashboardMinutes}'),
                onTap: () {
                  Navigator.pop(context);
                  onSnooze(minutes);
                },
              ),
          ],
        ),
      ),
    );
  }
}
