import 'package:flutter/material.dart';

class NameSuggestionsRow extends StatelessWidget {
  final ValueChanged<String> onSelect;

  const NameSuggestionsRow({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final names = isArabic
        ? [
            'بنادول',
            'فيتامين D',
            'بروفين',
            'أوميبرازول',
            'أموكسيسيلين',
            'كلوجوفاج',
          ]
        : [
            'Panadol',
            'Vitamin D',
            'Brufen',
            'Omeprazole',
            'Amoxicillin',
            'Glucophage',
          ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: names.map((name) {
          return Padding(
            padding: const EdgeInsets.only(right: 6, bottom: 8),
            child: ActionChip(
              avatar: const Icon(Icons.add, size: 14),
              label: Text(name, style: const TextStyle(fontSize: 12)),
              onPressed: () => onSelect(name),
            ),
          );
        }).toList(),
      ),
    );
  }
}
