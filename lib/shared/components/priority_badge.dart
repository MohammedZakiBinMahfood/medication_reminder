import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/radius/app_radius.dart';
import '../../features/medications/medication_management/models/enums/medication_enums.dart';

class PriorityBadge extends StatelessWidget {
  final MedicationPriority priority;

  const PriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.1),
        borderRadius: AppRadius.borderM,
      ),
      child: Text(
        _label(l10n),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: _color,
        ),
      ),
    );
  }

  String _label(AppLocalizations l10n) => switch (priority) {
    MedicationPriority.low => l10n.priorityLow,
    MedicationPriority.medium => l10n.priorityMed,
    MedicationPriority.high => l10n.priorityHigh,
  };

  Color get _color => switch (priority) {
    MedicationPriority.low => AppColors.success,
    MedicationPriority.medium => AppColors.warning,
    MedicationPriority.high => AppColors.error,
  };
}
