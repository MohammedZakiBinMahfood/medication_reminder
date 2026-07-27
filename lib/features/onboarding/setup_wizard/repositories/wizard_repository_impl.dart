import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'wizard_repository.dart';

const _kWizardCompletedKey = 'setup_wizard_completed';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'SharedPreferences must be overridden at app startup.',
  );
});

final wizardRepositoryProvider = Provider<WizardRepository>((ref) {
  return WizardRepositoryImpl(prefs: ref.watch(sharedPreferencesProvider));
});

class WizardRepositoryImpl implements WizardRepository {
  final SharedPreferences _prefs;

  WizardRepositoryImpl({required this._prefs});

  @override
  Future<bool> isWizardCompleted() async {
    return _prefs.getBool(_kWizardCompletedKey) ?? false;
  }

  @override
  Future<void> markWizardCompleted() async {
    await _prefs.setBool(_kWizardCompletedKey, true);
  }

  @override
  Future<void> resetWizard() async {
    await _prefs.remove(_kWizardCompletedKey);
  }
}
