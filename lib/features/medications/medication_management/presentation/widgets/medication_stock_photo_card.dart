import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_card.dart';
import '../../providers/providers.dart';
import 'medication_photo_section.dart';
import 'medication_stock_section.dart';

class MedicationStockPhotoCard extends ConsumerWidget {
  const MedicationStockPhotoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final medState = ref.watch(medicationStateProvider);

    return CCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: theme.colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.medicationStockAndPhotoHeading,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          MedicationPhotoSection(
            imagePath: medState.imagePath,
            onImagePicked: (path) {
              ref.read(medicationStateProvider.notifier).setImagePath(path);
            },
          ),
          const SizedBox(height: 16),
          MedicationStockSection(
            stockQuantity: medState.stockQuantity,
            reorderThreshold: medState.reorderThreshold,
            onStockChanged: (val) {
              ref.read(medicationStateProvider.notifier).setStockQuantity(val);
            },
            onThresholdChanged: (val) {
              ref
                  .read(medicationStateProvider.notifier)
                  .setReorderThreshold(val);
            },
          ),
        ],
      ),
    );
  }
}
