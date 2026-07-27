import 'package:flutter/material.dart';

class DosageSuggestionsRow extends StatelessWidget {
  final ValueChanged<String> onSelect;

  const DosageSuggestionsRow({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final dosages = isArabic
        ? ['500 ملجم', '1000 ملجم', '1 قرص', '2 قرص', '5 مل']
        : ['500mg', '1000mg', '1 Pill', '2 Pills', '5ml'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dosages.map((dosage) {
          return Padding(
            padding: const EdgeInsets.only(right: 6, bottom: 8),
            child: ActionChip(
              avatar: const Icon(Icons.add, size: 14),
              label: Text(dosage, style: const TextStyle(fontSize: 12)),
              onPressed: () => onSelect(dosage),
            ),
          );
        }).toList(),
      ),
    );
  }
}
