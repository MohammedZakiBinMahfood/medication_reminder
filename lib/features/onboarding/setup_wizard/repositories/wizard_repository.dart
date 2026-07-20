abstract class WizardRepository {
  Future<bool> isWizardCompleted();
  Future<void> markWizardCompleted();
  Future<void> resetWizard();
}
