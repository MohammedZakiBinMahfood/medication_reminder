import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_card.dart';
import '../../../../../shared/components/c_text_field.dart';
import '../../models/enums/medication_enums.dart';
import '../../models/medication_form_field.dart';
import '../../providers/providers.dart';
import 'food_instruction_section.dart';
import 'form_date_tile.dart';
import 'form_section_label.dart';
import 'form_time_tile.dart';
import 'repeat_type_selector.dart';
import 'time_presets_row.dart';
import 'weekday_selector.dart';

class MedicationScheduleCard extends ConsumerWidget {
  final VoidCallback onPickStartDate;
  final VoidCallback onPickEndDate;
  final VoidCallback onPickTime;

  const MedicationScheduleCard({
    super.key,
    required this.onPickStartDate,
    required this.onPickEndDate,
    required this.onPickTime,
  });

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
                Icons.schedule_outlined,
                color: theme.colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.medicationScheduleHeading,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FormSectionLabel(label: l10n.repeatType),
          RepeatTypeSelector(
            selected: medState.repeatType,
            onSelected: (type) {
              ref.read(medicationStateProvider.notifier).setRepeatType(type);
            },
          ),
          if (medState.repeatType == RepeatType.specificDays) ...[
            const SizedBox(height: 12),
            FormSectionLabel(label: l10n.selectDays),
            WeekdaySelector(
              selectedWeekdays: medState.weekdays,
              onWeekdaysChanged: (weekdays) {
                ref
                    .read(medicationStateProvider.notifier)
                    .setWeekdays(weekdays);
              },
            ),
          ],
          if (medState.repeatType == RepeatType.interval) ...[
            const SizedBox(height: 12),
            CTextField(
              initialValue: medState.interval.toString(),
              labelText: l10n.intervalHours,
              hintText: l10n.intervalHint,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                final interval = int.tryParse(value) ?? 1;
                ref
                    .read(medicationStateProvider.notifier)
                    .setInterval(interval);
              },
            ),
          ],
          const SizedBox(height: 16),
          FormSectionLabel(label: l10n.startDate),
          FormDateTile(
            date: medState.startDate,
            sectionLabel: l10n.startDate,
            errorText: formState.field(MedicationFormField.startDate).error,
            onTap: onPickStartDate,
          ),
          const SizedBox(height: 12),
          FormSectionLabel(label: l10n.time),
          TimePresetsRow(
            selectedMinutes: medState.minutesFromMidnight,
            onSelectMinutes: (minutes) {
              ref
                  .read(medicationStateProvider.notifier)
                  .setMinutesFromMidnight(minutes);
            },
          ),
          const SizedBox(height: 8),
          FormTimeTile(
            minutesFromMidnight: medState.minutesFromMidnight,
            onTap: onPickTime,
          ),
          const SizedBox(height: 12),
          FormSectionLabel(label: l10n.endDateOptional),
          FormDateTile(
            date: medState.endDate,
            sectionLabel: l10n.endDateOptional,
            errorText: formState.field(MedicationFormField.endDate).error,
            onTap: onPickEndDate,
            isClearable: true,
            onClear: () {
              ref.read(medicationStateProvider.notifier).setEndDate(null);
            },
          ),
          const SizedBox(height: 12),
          FoodInstructionSection(
            selected: medState.foodInstruction,
            onSelected: (val) {
              ref
                  .read(medicationStateProvider.notifier)
                  .setFoodInstruction(val);
            },
          ),
        ],
      ),
    );
  }
}
