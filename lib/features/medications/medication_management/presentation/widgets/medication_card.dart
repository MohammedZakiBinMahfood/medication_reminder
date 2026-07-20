import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_card.dart';
import '../../../../../shared/components/c_dialog.dart';
import '../../../../../shared/components/c_snackbar.dart';
import '../../../../../shared/components/priority_badge.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/design_system/spacing/app_spacing.dart';
import '../../../../../core/design_system/radius/app_radius.dart';
import '../../models/medication_list_model.dart';
import '../../providers/providers.dart';

class MedicationCard extends ConsumerWidget {
  final MedicationListModel medication;
  final VoidCallback? onTap;

  const MedicationCard({super.key, required this.medication, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = medication.color.toColor();
    final l10n = AppLocalizations.of(context);

    return Semantics(
      label:
          '${medication.name}, ${medication.dosage}, ${medication.priority.name}',
      hint: l10n.a11yMedicationCardHint,
      child: CCard(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.m,
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: AppRadius.borderXs,
              ),
            ),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medication.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    medication.dosage,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            PriorityBadge(priority: medication.priority),
            const SizedBox(width: AppSpacing.s),
            Semantics(
              label: medication.isActive
                  ? l10n.a11yMedicationActive(medication.name)
                  : l10n.a11yMedicationInactive(medication.name),
              value: medication.isActive
                  ? l10n.a11ySwitchOn
                  : l10n.a11ySwitchOff,
              child: Switch(
                value: medication.isActive,
                onChanged: (value) {
                  if (!value) {
                    CDialog.confirm(
                      context: context,
                      title: l10n.confirm,
                      content: l10n.confirmDeactivateMedication,
                      confirmText: l10n.confirm,
                      cancelText: l10n.cancel,
                      isDestructive: true,
                    ).then((confirmed) {
                      if (confirmed == true) {
                        _toggleMedication(ref, value, context, l10n);
                      }
                    });
                  } else {
                    _toggleMedication(ref, value, context, l10n);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleMedication(
    WidgetRef ref,
    bool value,
    BuildContext context,
    AppLocalizations l10n,
  ) async {
    final notifier = ref.read(medicationCrudProvider.notifier);
    if (value) {
      await notifier.activate(medication.id);
    } else {
      await notifier.deactivate(medication.id);
    }
    if (context.mounted) {
      ref.read(medicationListProvider.notifier).refresh();
      CSnackbar.success(context, value ? l10n.done : l10n.medicationDeleted);
    }
  }
}
