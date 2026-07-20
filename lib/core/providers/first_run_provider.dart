import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medication_reminder/features/onboarding/setup_wizard/repositories/wizard_repository_impl.dart';

const _kWelcomeDismissedKey = 'welcome_card_dismissed';
const _kNotificationHintShownKey = 'notification_hint_shown';
const _kFirstMedicationAddedKey = 'first_medication_added';

final firstRunProvider = NotifierProvider<FirstRunNotifier, FirstRunState>(
  FirstRunNotifier.new,
);

class FirstRunState {
  final bool welcomeDismissed;
  final bool notificationHintDismissed;
  final bool firstMedicationAdded;

  const FirstRunState({
    this.welcomeDismissed = false,
    this.notificationHintDismissed = false,
    this.firstMedicationAdded = false,
  });

  FirstRunState copyWith({
    bool? welcomeDismissed,
    bool? notificationHintDismissed,
    bool? firstMedicationAdded,
  }) {
    return FirstRunState(
      welcomeDismissed: welcomeDismissed ?? this.welcomeDismissed,
      notificationHintDismissed:
          notificationHintDismissed ?? this.notificationHintDismissed,
      firstMedicationAdded:
          firstMedicationAdded ?? this.firstMedicationAdded,
    );
  }

  bool get shouldShowWelcome => !welcomeDismissed;
  bool get shouldShowNotificationHint => !notificationHintDismissed;
}

class FirstRunNotifier extends Notifier<FirstRunState> {
  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  FirstRunState build() {
    return FirstRunState(
      welcomeDismissed: _prefs.getBool(_kWelcomeDismissedKey) ?? false,
      notificationHintDismissed:
          _prefs.getBool(_kNotificationHintShownKey) ?? false,
      firstMedicationAdded:
          _prefs.getBool(_kFirstMedicationAddedKey) ?? false,
    );
  }

  Future<void> dismissWelcome() async {
    await _prefs.setBool(_kWelcomeDismissedKey, true);
    state = state.copyWith(welcomeDismissed: true);
  }

  Future<void> dismissNotificationHint() async {
    await _prefs.setBool(_kNotificationHintShownKey, true);
    state = state.copyWith(notificationHintDismissed: true);
  }

  Future<void> markFirstMedicationAdded() async {
    await _prefs.setBool(_kFirstMedicationAddedKey, true);
    state = state.copyWith(firstMedicationAdded: true);
  }

  Future<void> reset() async {
    await _prefs.remove(_kWelcomeDismissedKey);
    await _prefs.remove(_kNotificationHintShownKey);
    await _prefs.remove(_kFirstMedicationAddedKey);
    state = const FirstRunState();
  }
}
