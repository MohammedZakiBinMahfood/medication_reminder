import 'package:app_platform_state/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';
import 'medication_state_notifier.dart';

final medicationFormProvider =
    NotifierProvider.autoDispose<
      MedicationFormNotifier,
      FormValidationState<MedicationFormField>
    >(MedicationFormNotifier.new);

class MedicationFormNotifier extends ValidationController<MedicationFormField> {
  @override
  FormValidationState<MedicationFormField> build() {
    init(
      validators: {
        MedicationFormField.name: (context) {
          final data = context.read(medicationStateProvider);
          final nameError = requiredStringValidator(
            data.name,
            customMessage: 'Medication name is required',
          );
          if (nameError != null) return nameError;

          if (data.name != null && data.name!.length > 100) {
            return 'Name must not exceed 100 characters';
          }

          return null;
        },
        MedicationFormField.dosage: (context) {
          final data = context.read(medicationStateProvider);
          return requiredStringValidator(
            data.dosage,
            customMessage: 'Dosage is required',
          );
        },
        MedicationFormField.schedule: (context) {
          final data = context.read(medicationStateProvider);
          if (data.repeatType == RepeatType.specificDays &&
              data.weekdays.isEmpty) {
            return 'Please select at least one day';
          }
          return null;
        },
        MedicationFormField.startDate: (context) {
          final data = context.read(medicationStateProvider);
          if (data.startDate == null) {
            return 'Start date is required';
          }
          return null;
        },
        MedicationFormField.endDate: (context) {
          final data = context.read(medicationStateProvider);
          if (data.endDate != null && data.startDate != null) {
            if (data.endDate!.isBefore(data.startDate!)) {
              return 'End date must be after start date';
            }
          }
          return null;
        },
      },
    );
    return state;
  }

  void validateName() => validate(MedicationFormField.name);
  void validateDosage() => validate(MedicationFormField.dosage);
  void validateStartDate() => validate(MedicationFormField.startDate);
  void validateEndDate() => validate(MedicationFormField.endDate);
  bool validateForm() {
    debugPrint('🔴 [FORM] validateForm called');
    final result = validateAll();
    debugPrint('🔴 [FORM] validateAll result: $result');
    return result;
  }
}
