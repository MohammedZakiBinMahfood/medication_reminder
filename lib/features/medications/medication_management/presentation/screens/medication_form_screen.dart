import 'dart:io';
import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medication_reminder/features/medications/medication_management/models/medication_form_field.dart';
import 'package:medication_reminder/core/utils/time_formatter.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_app_bar.dart';
import '../../../../../shared/components/c_button.dart';
import '../../../../../shared/components/c_card.dart';
import '../../../../../shared/components/c_scaffold.dart';
import '../../../../../shared/components/c_snackbar.dart';
import '../../../../../shared/components/c_text_field.dart';
import '../../../../../shared/navigation/c_navigator.dart';
import '../../models/enums/medication_enums.dart';
import '../../models/medication_field.dart';
import '../../models/medication_model.dart';
import '../../models/medication_schedule_model.dart';
import '../../providers/providers.dart';
import '../widgets/color_picker_widget.dart';
import '../widgets/priority_selector.dart';
import '../widgets/repeat_type_selector.dart';
import '../widgets/weekday_selector.dart';

class MedicationFormScreen extends ConsumerStatefulWidget {
  final String? medicationId;

  const MedicationFormScreen({super.key, this.medicationId});

  bool get isEditMode => medicationId != null;

  @override
  ConsumerState<MedicationFormScreen> createState() =>
      _MedicationFormScreenState();
}

class _MedicationFormScreenState extends ConsumerState<MedicationFormScreen> {
  bool _isLoadingDetails = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(medicationStateProvider.notifier).reset();
      if (widget.isEditMode) {
        _loadMedicationDetails();
      }
    });
  }

  Future<void> _loadMedicationDetails() async {
    setState(() => _isLoadingDetails = true);

    final repository = ref.read(medicationRepositoryProvider);
    final medResult = await repository.getMedication(widget.medicationId!);

    MedicationModel? medication;
    if (medResult case Success(:final data)) {
      medication = data;
    }

    if (medication != null && mounted) {
      final scheduleResult = await repository.getSchedules(
        widget.medicationId!,
      );

      MedicationScheduleModel? schedule;
      if (scheduleResult case Success(:final data)) {
        schedule = data.isNotEmpty ? data.first : null;
      }

      final field = _buildFieldFromModels(medication, schedule);
      if (mounted) {
        ref.read(medicationStateProvider.notifier).loadFromField(field);
      }
    }

    if (mounted) {
      setState(() => _isLoadingDetails = false);
    }
  }

  MedicationField _buildFieldFromModels(
    MedicationModel med,
    MedicationScheduleModel? schedule,
  ) {
    return MedicationField(
      id: med.uuid,
      profileUuid: med.profileUuid,
      name: med.name,
      dosage: med.dosage,
      color: med.color,
      priority: med.priority,
      repeatType: schedule?.repeatType ?? RepeatType.daily,
      weekdays: schedule?.weekdays ?? [],
      interval: schedule?.interval ?? 1,
      startDate: schedule?.startDate ?? DateTime.now(),
      endDate: schedule?.endDate,
      minutesFromMidnight: schedule?.minutesFromMidnight ?? 480,
      isActive: med.isActive,
      stockQuantity: med.stockQuantity,
      reorderThreshold: med.reorderThreshold,
      foodInstruction: med.foodInstruction,
      imagePath: med.imagePath,
    );
  }

  void _showError(String message) {
    CSnackbar.error(context, message);
  }

  Future<void> _pickStartDate() async {
    final state = ref.read(medicationStateProvider);
    final picked = await showDatePicker(
      context: context,
      initialDate: state.startDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      ref.read(medicationStateProvider.notifier).setStartDate(picked);
      ref.read(medicationFormProvider.notifier).validateStartDate();
    }
  }

  Future<void> _pickEndDate() async {
    final state = ref.read(medicationStateProvider);
    final picked = await showDatePicker(
      context: context,
      initialDate: state.endDate ?? state.startDate ?? DateTime.now(),
      firstDate: state.startDate ?? DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      ref.read(medicationStateProvider.notifier).setEndDate(picked);
      ref.read(medicationFormProvider.notifier).validateEndDate();
    }
  }

  Future<void> _pickTime() async {
    final state = ref.read(medicationStateProvider);
    final minutes = state.minutesFromMidnight;
    final initial = TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
    );
    if (picked != null) {
      final total = picked.hour * 60 + picked.minute;
      ref
          .read(medicationStateProvider.notifier)
          .setMinutesFromMidnight(total);
    }
  }

  Future<void> _onSave() async {
    debugPrint('🔴 [SAVE] _onSave called, isEditMode: ${widget.isEditMode}');
    
    final isValid = ref.read(medicationFormProvider.notifier).validateForm();
    debugPrint('🔴 [SAVE] validateForm result: $isValid');
    
    if (!isValid) {
      final l10n = AppLocalizations.of(context);
      CSnackbar.error(context, l10n.a11yFormRequired);
      return;
    }

    final notifier = ref.read(medicationCrudProvider.notifier);
    final data = ref.read(medicationStateProvider);
    debugPrint('🔴 [SAVE] medicationState: name=${data.name}, dosage=${data.dosage}, id=${data.id}');

    if (widget.isEditMode) {
      debugPrint('🔴 [SAVE] calling notifier.update()');
      await notifier.update();
    } else {
      debugPrint('🔴 [SAVE] calling notifier.create()');
      await notifier.create();
    }
    debugPrint('🔴 [SAVE] notifier.create/update completed');

    if (!mounted) {
      debugPrint('🔴 [SAVE] widget not mounted after create/update, aborting');
      return;
    }

    final crudState = ref.read(medicationCrudProvider);
    final key = widget.isEditMode
        ? ActionKey(ActionType.update, data.id ?? '').value
        : const ActionKey(ActionType.create).value;
    debugPrint('🔴 [SAVE] key="$key", isFailure=${crudState.isFailure(key)}, isLoading=${crudState.isLoading(key)}');

    if (crudState.isFailure(key)) {
      final error = crudState.get(key).error;
      debugPrint('🔴 [SAVE] FAILURE: error=${error?.errorMessage}');
      if (error != null) {
        _showError(error.errorMessage);
      }
      return;
    }

    debugPrint('🔴 [SAVE] SUCCESS - resetting state and showing snackbar');
    ref.read(medicationStateProvider.notifier).reset();
    if (!mounted) {
      debugPrint('🔴 [SAVE] widget not mounted after reset, aborting');
      return;
    }
    final l10n = AppLocalizations.of(context);
    CSnackbar.success(
      context,
      widget.isEditMode ? l10n.medicationUpdated : l10n.medicationCreated,
    );
    CNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(medicationFormProvider);
    final medState = ref.watch(medicationStateProvider);
    final crudState = ref.watch(medicationCrudProvider);
    final l10n = AppLocalizations.of(context);

    final isCreateLoading = crudState.isLoading('create');
    final isUpdateLoading = crudState.isLoading('update');
    final isSubmitting = isCreateLoading || isUpdateLoading;

    final theme = Theme.of(context);

    return CScaffold(
      appBar: CAppBar(
        title: widget.isEditMode ? l10n.editMedication : l10n.addMedication,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => CNavigator.pop(),
        ),
      ),
      body: _isLoadingDetails
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CARD 1: BASIC INFORMATION
                  CCard(
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
                          errorText:
                              formState.field(MedicationFormField.name).error,
                          onChanged: (value) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setName(value);
                            ref
                                .read(medicationFormProvider.notifier)
                                .validateName();
                          },
                        ),
                        _NameSuggestionsRow(
                          onSelect: (name) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setName(name);
                            ref
                                .read(medicationFormProvider.notifier)
                                .validateName();
                          },
                        ),
                        const SizedBox(height: 8),
                        CTextField(
                          initialValue: medState.dosage,
                          labelText: l10n.dosage,
                          hintText: l10n.dosageHint,
                          textInputAction: TextInputAction.next,
                          errorText: formState
                              .field(MedicationFormField.dosage)
                              .error,
                          onChanged: (value) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setDosage(value);
                            ref
                                .read(medicationFormProvider.notifier)
                                .validateDosage();
                          },
                        ),
                        _DosageSuggestionsRow(
                          onSelect: (dosage) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setDosage(dosage);
                            ref
                                .read(medicationFormProvider.notifier)
                                .validateDosage();
                          },
                        ),
                        const SizedBox(height: 12),
                        _SectionLabel(label: l10n.color),
                        ColorPickerWidget(
                          selectedColor: medState.color ?? '#4F46E5',
                          onColorSelected: (color) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setColor(color);
                          },
                        ),
                        const SizedBox(height: 16),
                        _SectionLabel(label: l10n.priority),
                        PrioritySelector(
                          selected: medState.priority,
                          onSelected: (priority) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setPriority(priority);
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // CARD 2: SCHEDULE & TIMING
                  CCard(
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
                        _SectionLabel(label: l10n.repeatType),
                        RepeatTypeSelector(
                          selected: medState.repeatType,
                          onSelected: (type) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setRepeatType(type);
                          },
                        ),
                        if (medState.repeatType == RepeatType.specificDays) ...[
                          const SizedBox(height: 12),
                          _SectionLabel(label: l10n.selectDays),
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
                        _SectionLabel(label: l10n.startDate),
                        _DateTile(
                          date: medState.startDate,
                          sectionLabel: l10n.startDate,
                          errorText: formState
                              .field(MedicationFormField.startDate)
                              .error,
                          onTap: _pickStartDate,
                        ),
                        const SizedBox(height: 12),
                        _SectionLabel(label: l10n.time),
                        _TimePresetsRow(
                          selectedMinutes: medState.minutesFromMidnight,
                          onSelectMinutes: (minutes) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setMinutesFromMidnight(minutes);
                          },
                        ),
                        const SizedBox(height: 8),
                        _TimeTile(
                          minutesFromMidnight: medState.minutesFromMidnight,
                          onTap: _pickTime,
                        ),
                        const SizedBox(height: 12),
                        _SectionLabel(label: l10n.endDateOptional),
                        _DateTile(
                          date: medState.endDate,
                          sectionLabel: l10n.endDateOptional,
                          errorText: formState
                              .field(MedicationFormField.endDate)
                              .error,
                          onTap: _pickEndDate,
                          isClearable: true,
                          onClear: () {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setEndDate(null);
                          },
                        ),
                        const SizedBox(height: 12),
                        _FoodInstructionSection(
                          selected: medState.foodInstruction,
                          onSelected: (val) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setFoodInstruction(val);
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // CARD 3: STOCK & PHOTO
                  CCard(
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
                        _PhotoSection(
                          imagePath: medState.imagePath,
                          onImagePicked: (path) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setImagePath(path);
                          },
                        ),
                        const SizedBox(height: 16),
                        _StockSection(
                          stockQuantity: medState.stockQuantity,
                          reorderThreshold: medState.reorderThreshold,
                          onStockChanged: (val) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setStockQuantity(val);
                          },
                          onThresholdChanged: (val) {
                            ref
                                .read(medicationStateProvider.notifier)
                                .setReorderThreshold(val);
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: CButton(
                      text: widget.isEditMode ? l10n.update : l10n.save,
                      isLoading: isSubmitting,
                      onPressed: isSubmitting ? null : _onSave,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _StockSection extends StatelessWidget {
  final int? stockQuantity;
  final int? reorderThreshold;
  final ValueChanged<int?> onStockChanged;
  final ValueChanged<int?> onThresholdChanged;

  const _StockSection({
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
        _SectionLabel(label: l10n.medicationStockTrackingOptional),
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
                      onThresholdChanged(
                        (updated * 0.2).round().clamp(1, 10),
                      );
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

class _NameSuggestionsRow extends StatelessWidget {
  final ValueChanged<String> onSelect;

  const _NameSuggestionsRow({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final names = isArabic
        ? ['بنادول', 'فيتامين D', 'بروفين', 'أوميبرازول', 'أموكسيسيلين', 'كلوجوفاج']
        : ['Panadol', 'Vitamin D', 'Brufen', 'Omeprazole', 'Amoxicillin', 'Glucophage'];

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

class _DosageSuggestionsRow extends StatelessWidget {
  final ValueChanged<String> onSelect;

  const _DosageSuggestionsRow({required this.onSelect});

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

class _TimePresetsRow extends StatelessWidget {
  final int selectedMinutes;
  final ValueChanged<int> onSelectMinutes;

  const _TimePresetsRow({
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

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  final DateTime? date;
  final String sectionLabel;
  final String? errorText;
  final VoidCallback onTap;
  final bool isClearable;
  final VoidCallback? onClear;

  const _DateTile({
    required this.date,
    required this.sectionLabel,
    this.errorText,
    required this.onTap,
    this.isClearable = false,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final displayText = date != null
        ? '${date!.day}/${date!.month}/${date!.year}'
        : l10n.selectDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          container: true,
          button: true,
          explicitChildNodes: true,
          label: '$sectionLabel: $displayText',
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: InputDecorator(
              decoration: InputDecoration(
                errorText: errorText,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isClearable && date != null)
                      IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        tooltip: l10n.a11yClearDate,
                        onPressed: onClear,
                      ),
                    const Icon(Icons.calendar_today, size: 18),
                  ],
                ),
              ),
              child: Text(
                displayText,
                style: date != null
                    ? null
                    : TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TimeTile extends StatelessWidget {
  final int minutesFromMidnight;
  final VoidCallback onTap;

  const _TimeTile({
    required this.minutesFromMidnight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final displayText = AppTimeFormatter.formatMinutesFromMidnight(
      minutesFromMidnight,
      isArabic: isArabic,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          container: true,
          button: true,
          label: displayText,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: InputDecorator(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.access_time, size: 18),
              ),
              child: Text(displayText),
            ),
          ),
        ),
      ],
    );
  }
}

class _FoodInstructionSection extends StatelessWidget {
  final FoodInstruction selected;
  final ValueChanged<FoodInstruction> onSelected;

  const _FoodInstructionSection({
    required this.selected,
    required this.onSelected,
  });

  String _getLabel(AppLocalizations l10n, FoodInstruction inst) {
    switch (inst) {
      case FoodInstruction.none:
        return l10n.foodInstructionNone;
      case FoodInstruction.beforeMeal:
        return l10n.foodInstructionBeforeMeal;
      case FoodInstruction.withMeal:
        return l10n.foodInstructionWithMeal;
      case FoodInstruction.afterMeal:
        return l10n.foodInstructionAfterMeal;
      case FoodInstruction.onEmptyStomach:
        return l10n.foodInstructionOnEmptyStomach;
      case FoodInstruction.beforeBed:
        return l10n.foodInstructionBeforeBed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: l10n.foodInstructionLabel),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: FoodInstruction.values.map((inst) {
            final isSelected = selected == inst;
            return ChoiceChip(
              label: Text(_getLabel(l10n, inst)),
              selected: isSelected,
              onSelected: (val) {
                if (val) onSelected(inst);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _PhotoSection extends StatelessWidget {
  final String? imagePath;
  final ValueChanged<String?> onImagePicked;

  const _PhotoSection({
    required this.imagePath,
    required this.onImagePicked,
  });

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );
      if (picked != null) {
        onImagePicked(picked.path);
      }
    } catch (_) {
      try {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.image,
        );
        if (result != null && result.files.single.path != null) {
          onImagePicked(result.files.single.path);
        }
      } catch (_) {}
    }
  }

  void _showSourceBottomSheet(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined, color: Colors.indigo),
                title: Text(
                  isArabic ? 'التقاط صورة بالكاميرا' : 'Take Photo with Camera',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(context, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined, color: Colors.indigo),
                title: Text(
                  isArabic ? 'اختيار من المعرض' : 'Choose from Gallery',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(context, ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hasImage = imagePath != null && imagePath!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: l10n.medicationPhotoLabel),
        if (hasImage) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.file(
                  File(imagePath!),
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
                IconButton(
                  icon: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.close, color: Colors.white, size: 18),
                  ),
                  tooltip: l10n.medicationPhotoRemove,
                  onPressed: () => onImagePicked(null),
                ),
              ],
            ),
          ),
        ] else ...[
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => _showSourceBottomSheet(context),
            icon: const Icon(Icons.add_a_photo_outlined),
            label: Text(l10n.medicationPhotoAdd),
          ),
        ],
      ],
    );
  }
}
