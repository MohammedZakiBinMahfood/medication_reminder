import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_text_field.dart';
import 'form_section_label.dart';

class MedicationStockSection extends StatelessWidget {
  final int? stockQuantity;
  final int? reorderThreshold;
  final ValueChanged<int?> onStockChanged;
  final ValueChanged<int?> onThresholdChanged;

  const MedicationStockSection({
    super.key,
    required this.stockQuantity,
    required this.reorderThreshold,
    required this.onStockChanged,
    required this.onThresholdChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormSectionLabel(label: l10n.medicationStockTrackingOptional),
        Row(
          children: [
            Expanded(
              child: CTextField(
                labelText: l10n.medicationStockQuantity,
                hintText: l10n.medicationStockQuantityHint,
                keyboardType: TextInputType.number,
                initialValue: stockQuantity?.toString(),
                onChanged: (v) => onStockChanged(int.tryParse(v)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CTextField(
                labelText: l10n.medicationStockThreshold,
                hintText: l10n.medicationStockThresholdHint,
                keyboardType: TextInputType.number,
                initialValue: reorderThreshold?.toString(),
                onChanged: (v) => onThresholdChanged(int.tryParse(v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [10, 30, 60].map((add) {
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ActionChip(
                  avatar: const Icon(Icons.add, size: 14),
                  label: Text('+$add'),
                  onPressed: () {
                    final current = stockQuantity ?? 0;
                    final updated = current + add;
                    onStockChanged(updated);
                    if (reorderThreshold == null || reorderThreshold == 0) {
                      onThresholdChanged((updated * 0.2).round().clamp(1, 10));
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
