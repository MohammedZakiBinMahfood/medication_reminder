import 'wizard_step.dart';

class WizardState {
  final WizardStep currentStep;
  final bool notificationGranted;
  final bool exactAlarmGranted;
  final bool exactAlarmAvailable;
  final bool batteryOptimizationRestricted;
  final bool isLoading;
  final bool isCompleted;

  const WizardState({
    this.currentStep = WizardStep.welcome,
    this.notificationGranted = false,
    this.exactAlarmGranted = false,
    this.exactAlarmAvailable = true,
    this.batteryOptimizationRestricted = false,
    this.isLoading = false,
    this.isCompleted = false,
  });

  WizardState copyWith({
    WizardStep? currentStep,
    bool? notificationGranted,
    bool? exactAlarmGranted,
    bool? exactAlarmAvailable,
    bool? batteryOptimizationRestricted,
    bool? isLoading,
    bool? isCompleted,
  }) {
    return WizardState(
      currentStep: currentStep ?? this.currentStep,
      notificationGranted: notificationGranted ?? this.notificationGranted,
      exactAlarmGranted: exactAlarmGranted ?? this.exactAlarmGranted,
      exactAlarmAvailable: exactAlarmAvailable ?? this.exactAlarmAvailable,
      batteryOptimizationRestricted:
          batteryOptimizationRestricted ?? this.batteryOptimizationRestricted,
      isLoading: isLoading ?? this.isLoading,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  bool get canProceed => switch (currentStep) {
    WizardStep.welcome => true,
    WizardStep.notification => true,
    WizardStep.exactAlarm => true,
    WizardStep.battery => true,
    WizardStep.completion => true,
  };

  WizardStep? get nextStep {
    final index = currentStep.value;
    if (index < WizardStep.completion.value) {
      return WizardStep.fromValue(index + 1);
    }
    return null;
  }

  WizardStep? get previousStep {
    final index = currentStep.value;
    if (index > WizardStep.welcome.value) {
      return WizardStep.fromValue(index - 1);
    }
    return null;
  }
}
