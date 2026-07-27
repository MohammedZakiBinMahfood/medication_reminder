import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_card.dart';
import '../../../../../shared/components/c_text_field.dart';
import '../../models/medication_form_field.dart';
import '../../providers/providers.dart';
import 'color_picker_widget.dart';
import 'dosage_suggestions_row.dart';
import 'form_section_label.dart';
import 'name_suggestions_row.dart';
import 'priority_selector.dart';

class MedicationBasicInfoCard extends ConsumerWidget {
  const MedicationBasicInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final medState = ref.watch(medicationStateProvider);
    final formState = ref.watch(medicationFormProvider);

    return CCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.medication_outlined,
                color: theme.colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.medicationBasicInfo,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CTextField(
            autofocus: true,
            initialValue: medState.name,
            labelText: l10n.medicationName,
            hintText: l10n.medicationNameHint,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.name],
            errorText: formState.field(MedicationFormField.name).error,
            onChanged: (value) {
              ref.read(medicationStateProvider.notifier).setName(value);
              ref.read(medicationFormProvider.notifier).validateName();
            },
          ),
          NameSuggestionsRow(
            onSelect: (name) {
              ref.read(medicationStateProvider.notifier).setName(name);
              ref.read(medicationFormProvider.notifier).validateName();
            },
          ),
          const SizedBox(height: 8),
          CTextField(
            initialValue: medState.dosage,
            labelText: l10n.dosage,
            hintText: l10n.dosageHint,
            textInputAction: TextInputAction.next,
            errorText: formState.field(MedicationFormField.dosage).error,
            onChanged: (value) {
              ref.read(medicationStateProvider.notifier).setDosage(value);
              ref.read(medicationFormProvider.notifier).validateDosage();
            },
          ),
          DosageSuggestionsRow(
            onSelect: (dosage) {
              ref.read(medicationStateProvider.notifier).setDosage(dosage);
              ref.read(medicationFormProvider.notifier).validateDosage();
            },
          ),
          const SizedBox(height: 12),
          FormSectionLabel(label: l10n.color),
          ColorPickerWidget(
            selectedColor: medState.color ?? '#4F46E5',
            onColorSelected: (color) {
              ref.read(medicationStateProvider.notifier).setColor(color);
            },
          ),
          const SizedBox(height: 16),
          FormSectionLabel(label: l10n.priority),
          PrioritySelector(
            selected: medState.priority,
            onSelected: (priority) {
              ref.read(medicationStateProvider.notifier).setPriority(priority);
            },
          ),
        ],
      ),
    );
  }
}
