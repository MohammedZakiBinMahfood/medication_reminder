import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/features/medications/medication_management/presentation/screens/medication_form_screen.dart';
import 'package:medication_reminder/features/medications/today_dashboard/presentation/screens/dashboard_screen.dart';
import 'package:medication_reminder/features/onboarding/setup_wizard/models/wizard_state.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_scaffold.dart';
import 'package:medication_reminder/shared/navigation/c_navigator.dart';
import '../../models/wizard_step.dart';
import '../../providers/wizard_notifier.dart';
import '../widgets/wizard_progress_indicator.dart';
import '../widgets/wizard_step_welcome.dart';
import '../widgets/wizard_step_notification.dart';
import '../widgets/wizard_step_exact_alarm.dart';
import '../widgets/wizard_step_battery.dart';
import '../widgets/wizard_step_completion.dart';

class WizardScreen extends ConsumerStatefulWidget {
  const WizardScreen({super.key});

  @override
  ConsumerState<WizardScreen> createState() => _WizardScreenState();
}

class _WizardScreenState extends ConsumerState<WizardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeWizard();
    });
  }

  Future<void> _initializeWizard() async {
    final notifier = ref.read(wizardProvider.notifier);
    await notifier.initialize();

    final state = ref.read(wizardProvider);
    if (state.isCompleted) {
      _navigateToDashboard();
      return;
    }

    await notifier.checkNotificationPermission();
    if (Platform.isAndroid) {
      await notifier.checkExactAlarmAvailability();
    }
  }

  void _navigateToDashboard() {
    CNavigator.pushAndRemoveUntil(
      const DashboardScreen(),
      (route) => false,
    );
  }

  void _navigateToAddMedication() {
    CNavigator.pushAndRemoveUntil(
      const MedicationFormScreen(),
      (route) => false,
    ).then((_) {
      CNavigator.pushAndRemoveUntil(
        const DashboardScreen(),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(wizardProvider);
    final notifier = ref.read(wizardProvider.notifier);
    final l10n = AppLocalizations.of(context);

    if (state.isCompleted) {
      return const SizedBox.shrink();
    }

    return CScaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.l),
            WizardProgressIndicator(currentStep: state.currentStep),
            const SizedBox(height: AppSpacing.xl),
            Expanded(child: _buildCurrentStep(state, notifier, l10n)),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStep(
    WizardState state,
    WizardNotifier notifier,
    AppLocalizations l10n,
  ) {
    return switch (state.currentStep) {
      WizardStep.welcome => WizardStepWelcome(
        onStart: notifier.nextStep,
        onSkip: () async {
          await notifier.skipWizard();
          _navigateToDashboard();
        },
      ),
      WizardStep.notification => WizardStepNotification(
        isGranted: state.notificationGranted,
        isLoading: state.isLoading,
        onRequestPermission: notifier.requestNotificationPermission,
        onNext: notifier.nextStep,
      ),
      WizardStep.exactAlarm => WizardStepExactAlarm(
        isGranted: state.exactAlarmGranted,
        isAvailable: state.exactAlarmAvailable,
        isLoading: state.isLoading,
        onRequestPermission: notifier.requestExactAlarmPermission,
        onNext: notifier.nextStep,
      ),
      WizardStep.battery => WizardStepBattery(
        onNext: notifier.nextStep,
      ),
      WizardStep.completion => WizardStepCompletion(
        onAddMedication: () async {
          await notifier.completeWizard();
          _navigateToAddMedication();
        },
        onGoHome: () async {
          await notifier.completeWizard();
          _navigateToDashboard();
        },
      ),
    };
  }
}
