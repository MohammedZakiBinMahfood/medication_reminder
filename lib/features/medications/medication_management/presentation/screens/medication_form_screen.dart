import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/features/medications/medication_management/models/medication_form_field.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_app_bar.dart';
import '../../../../../shared/components/c_button.dart';
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
      name: med.name,
      dosage: med.dosage,
      color: med.color,
      priority: med.priority,
      repeatType: schedule?.repeatType ?? RepeatType.daily,
      weekdays: schedule?.weekdays ?? [],
      interval: schedule?.interval ?? 1,
      startDate: schedule?.startDate ?? DateTime.now(),
      endDate: schedule?.endDate,
      isActive: med.isActive,
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

  Future<void> _onSave() async {
    final isValid = ref.read(medicationFormProvider.notifier).validateForm();
    if (!isValid) return;

    final notifier = ref.read(medicationCrudProvider.notifier);
    final data = ref.read(medicationStateProvider);

    if (widget.isEditMode) {
      await notifier.update();
    } else {
      await notifier.create();
    }

    if (!mounted) return;

    final crudState = ref.read(medicationCrudProvider);
    final key = widget.isEditMode
        ? ActionKey(ActionType.update, data.id ?? '').value
        : const ActionKey(ActionType.create).value;

    if (crudState.isFailure(key)) {
      final error = crudState.get(key).error;
      if (error != null) {
        _showError(error.errorMessage);
      }
      return;
    }

    CNavigator.pop();
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    CSnackbar.success(
      context,
      widget.isEditMode ? l10n.medicationUpdated : l10n.medicationCreated,
    );
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
                  CTextField(
                    autofocus: true,
                    initialValue: medState.name,
                    labelText: l10n.medicationName,
                    hintText: l10n.medicationNameHint,
                    textInputAction: TextInputAction.next,
                    errorText: formState.field(MedicationFormField.name).error,
                    onChanged: (value) {
                      ref.read(medicationStateProvider.notifier).setName(value);
                      ref.read(medicationFormProvider.notifier).validateName();
                    },
                  ),
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
                  const SizedBox(height: 16),
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
                    errorText: formState
                        .field(MedicationFormField.startDate)
                        .error,
                    onTap: _pickStartDate,
                  ),
                  const SizedBox(height: 12),
                  _SectionLabel(label: l10n.endDateOptional),
                  _DateTile(
                    date: medState.endDate,
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

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  final DateTime? date;
  final String? errorText;
  final VoidCallback onTap;
  final bool isClearable;
  final VoidCallback? onClear;

  const _DateTile({
    required this.date,
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
        InkWell(
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
      ],
    );
  }
}
