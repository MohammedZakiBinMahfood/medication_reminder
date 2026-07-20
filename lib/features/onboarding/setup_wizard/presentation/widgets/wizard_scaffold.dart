import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/shared/components/c_scaffold.dart';
import 'package:medication_reminder/features/onboarding/setup_wizard/models/wizard_step.dart';
import 'wizard_progress_indicator.dart';

class WizardScaffold extends StatelessWidget {
  final WizardStep currentStep;
  final Widget body;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final PreferredSizeWidget? appBar;

  const WizardScaffold({
    super.key,
    required this.currentStep,
    required this.body,
    this.showBackButton = false,
    this.onBackPressed,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.l),
            WizardProgressIndicator(currentStep: currentStep),
            const SizedBox(height: AppSpacing.xl),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
