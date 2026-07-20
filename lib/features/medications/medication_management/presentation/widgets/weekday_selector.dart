import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';

class WeekdaySelector extends StatelessWidget {
  final List<int> selectedWeekdays;
  final ValueChanged<List<int>> onWeekdaysChanged;

  const WeekdaySelector({
    super.key,
    required this.selectedWeekdays,
    required this.onWeekdaysChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dayLabels = [
      l10n.dayMon,
      l10n.dayTue,
      l10n.dayWed,
      l10n.dayThu,
      l10n.dayFri,
      l10n.daySat,
      l10n.daySun,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final dayNumber = index + 1;
        final isSelected = selectedWeekdays.contains(dayNumber);
        final dayLabel = dayLabels[index];
        return Semantics(
          button: true,
          label: isSelected
              ? l10n.a11yDaySelected(dayLabel)
              : l10n.a11yDayNotSelected(dayLabel),
          selected: isSelected,
          child: GestureDetector(
            onTap: () {
              final updated = List<int>.from(selectedWeekdays);
              if (isSelected) {
                updated.remove(dayNumber);
              } else {
                updated.add(dayNumber);
              }
              onWeekdaysChanged(updated);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                dayLabels[index],
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
