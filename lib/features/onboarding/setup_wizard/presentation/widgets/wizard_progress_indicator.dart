import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/features/onboarding/setup_wizard/models/wizard_step.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';

class WizardProgressIndicator extends StatelessWidget {
  final WizardStep currentStep;

  const WizardProgressIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final totalSteps = WizardStep.completion.value;
    final currentIndex = currentStep.value;

    return Semantics(
      label: l10n.wizardStepProgress(currentIndex + 1, totalSteps + 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSteps + 1, (index) {
          final isActive = index == currentIndex;
          final isCompleted = index < currentIndex;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isActive ? 24.0 : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: isCompleted || isActive
                    ? AppColors.primary
                    : AppColors.border,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}
