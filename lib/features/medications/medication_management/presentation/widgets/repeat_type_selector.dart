import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../models/enums/medication_enums.dart';

class RepeatTypeSelector extends StatelessWidget {
  final RepeatType selected;
  final ValueChanged<RepeatType> onSelected;

  const RepeatTypeSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: RepeatType.values.map((type) {
        final isSelected = type == selected;
        final label = _label(type, l10n);
        return Semantics(
          label: isSelected
              ? l10n.a11yChipSelected(label)
              : l10n.a11yChipNotSelected(label),
          selected: isSelected,
          child: FilterChip(
            label: Text(label),
            selected: isSelected,
            onSelected: (_) => onSelected(type),
          ),
        );
      }).toList(),
    );
  }

  String _label(RepeatType type, AppLocalizations l10n) {
    return switch (type) {
      RepeatType.daily => l10n.repeatDaily,
      RepeatType.specificDays => l10n.repeatSpecificDays,
      RepeatType.asNeeded => l10n.repeatAsNeeded,
      RepeatType.interval => l10n.repeatInterval,
    };
  }
}
