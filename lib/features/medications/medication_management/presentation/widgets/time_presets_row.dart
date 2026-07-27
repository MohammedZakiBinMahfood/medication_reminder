import 'package:flutter/material.dart';

class TimePresetsRow extends StatelessWidget {
  final int selectedMinutes;
  final ValueChanged<int> onSelectMinutes;

  const TimePresetsRow({
    super.key,
    required this.selectedMinutes,
    required this.onSelectMinutes,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final presets = [
      (label: isArabic ? '🌅 الصباح' : '🌅 Morning', minutes: 480),
      (label: isArabic ? '☀️ الظهر' : '☀️ Afternoon', minutes: 780),
      (label: isArabic ? '🌆 المساء' : '🌆 Evening', minutes: 1200),
      (label: isArabic ? '🌙 النوم' : '🌙 Bedtime', minutes: 1380),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: presets.map((preset) {
          final isSelected = selectedMinutes == preset.minutes;
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ChoiceChip(
              label: Text(preset.label, style: const TextStyle(fontSize: 12)),
              selected: isSelected,
              onSelected: (val) {
                if (val) onSelectMinutes(preset.minutes);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
