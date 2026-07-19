import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../models/enums/medication_enums.dart';

class PrioritySelector extends StatelessWidget {
  final MedicationPriority selected;
  final ValueChanged<MedicationPriority> onSelected;

  const PrioritySelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Row(
      children: MedicationPriority.values.map((priority) {
        final isSelected = priority == selected;
        return Padding(
          padding: const EdgeInsets.only(right: AppSpacing.s),
          child: FilterChip(
            label: Text(_label(priority, l10n)),
            selected: isSelected,
            onSelected: (_) => onSelected(priority),
            selectedColor: _chipColor(priority).withValues(alpha: 0.15),
            checkmarkColor: _chipColor(priority),
            labelStyle: TextStyle(
              color: isSelected ? _chipColor(priority) : null,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
    );
  }

  String _label(MedicationPriority priority, AppLocalizations l10n) {
    return switch (priority) {
      MedicationPriority.low => l10n.priorityLow,
      MedicationPriority.medium => l10n.priorityMedium,
      MedicationPriority.high => l10n.priorityHigh,
    };
  }

  Color _chipColor(MedicationPriority priority) {
    return switch (priority) {
      MedicationPriority.low => AppColors.success,
      MedicationPriority.medium => AppColors.warning,
      MedicationPriority.high => AppColors.error,
    };
  }
}
