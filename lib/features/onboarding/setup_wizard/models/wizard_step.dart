enum WizardStep {
  welcome(0),
  notification(1),
  exactAlarm(2),
  battery(3),
  completion(4);

  const WizardStep(this.value);

  final int value;

  static WizardStep fromValue(int value) {
    return WizardStep.values.firstWhere(
      (s) => s.value == value,
      orElse: () => WizardStep.welcome,
    );
  }

  bool get isLast => this == WizardStep.completion;
  bool get isFirst => this == WizardStep.welcome;
}
