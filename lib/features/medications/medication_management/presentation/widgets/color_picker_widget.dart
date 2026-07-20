import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/extensions/color_extensions.dart';
import '../../../../../l10n/app_localizations.dart';

class ColorPickerWidget extends StatelessWidget {
  final String selectedColor;
  final ValueChanged<String> onColorSelected;

  static const _colors = [
    '#4F46E5',
    '#10B981',
    '#EF4444',
    '#F59E0B',
    '#3B82F6',
    '#8B5CF6',
    '#EC4899',
    '#14B8A6',
    '#F97316',
    '#6366F1',
  ];

  static const _colorNames = [
    'Indigo',
    'Emerald',
    'Red',
    'Amber',
    'Blue',
    'Violet',
    'Pink',
    'Teal',
    'Orange',
    'Indigo',
  ];

  const ColorPickerWidget({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Wrap(
      spacing: AppSpacing.s,
      runSpacing: AppSpacing.s,
      children: List.generate(_colors.length, (index) {
        final hex = _colors[index];
        final color = hex.toColor();
        final isSelected = hex == selectedColor;
        final colorName = _colorNames[index];
        return Semantics(
          button: true,
          label: isSelected
              ? l10n.a11yColorSelected(colorName)
              : l10n.a11yColorNotSelected(colorName),
          selected: isSelected,
          child: GestureDetector(
            onTap: () => onColorSelected(hex),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).colorScheme.onSurface
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 18,
                      color: Theme.of(context).colorScheme.surface,
                    )
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
