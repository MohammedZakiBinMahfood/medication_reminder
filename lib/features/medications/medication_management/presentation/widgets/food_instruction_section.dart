import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../models/enums/medication_enums.dart';
import 'form_section_label.dart';

class FoodInstructionSection extends StatelessWidget {
  final FoodInstruction selected;
  final ValueChanged<FoodInstruction> onSelected;

  const FoodInstructionSection({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  String _getLabel(AppLocalizations l10n, FoodInstruction inst) {
    switch (inst) {
      case FoodInstruction.none:
        return l10n.foodInstructionNone;
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormSectionLabel(label: l10n.foodInstructionLabel),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: FoodInstruction.values.map((inst) {
            final isSelected = selected == inst;
            return ChoiceChip(
              label: Text(_getLabel(l10n, inst)),
              selected: isSelected,
              onSelected: (val) {
                if (val) onSelected(inst);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
