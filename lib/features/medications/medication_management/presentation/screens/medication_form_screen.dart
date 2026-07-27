import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_app_bar.dart';
import '../../../../../shared/components/c_button.dart';
import '../../../../../shared/components/c_scaffold.dart';
import '../../../../../shared/components/c_snackbar.dart';
import '../../../../../shared/navigation/c_navigator.dart';
import '../../models/enums/medication_enums.dart';
import '../../models/medication_field.dart';
import '../../models/medication_model.dart';
import '../../models/medication_schedule_model.dart';
import '../../providers/providers.dart';
import '../widgets/medication_basic_info_card.dart';
import '../widgets/medication_schedule_card.dart';
import '../widgets/medication_stock_photo_card.dart';

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
    final picked = await showTimePicker(context: context, initialTime: initial);
    if (picked != null) {
      final total = picked.hour * 60 + picked.minute;
      ref.read(medicationStateProvider.notifier).setMinutesFromMidnight(total);
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
    debugPrint(
      '🔴 [SAVE] medicationState: name=${data.name}, dosage=${data.dosage}, id=${data.id}',
    );

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
    debugPrint(
      '🔴 [SAVE] key="$key", isFailure=${crudState.isFailure(key)}, isLoading=${crudState.isLoading(key)}',
    );

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
                  const MedicationBasicInfoCard(),
                  const SizedBox(height: 16),
                  MedicationScheduleCard(
                    onPickStartDate: _pickStartDate,
                    onPickEndDate: _pickEndDate,
                    onPickTime: _pickTime,
                  ),
                  const SizedBox(height: 16),
                  const MedicationStockPhotoCard(),
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
