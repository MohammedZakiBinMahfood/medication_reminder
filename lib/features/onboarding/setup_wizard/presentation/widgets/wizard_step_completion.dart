import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_button.dart';

class WizardStepCompletion extends StatelessWidget {
  final VoidCallback onAddMedication;
  final VoidCallback onGoHome;

  const WizardStepCompletion({
    super.key,
    required this.onAddMedication,
    required this.onGoHome,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        children: [
          const Spacer(flex: 2),
          Semantics(
            label: l10n.wizardCompletionIcon,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 48,
                color: AppColors.success,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Semantics(
            header: true,
            child: Text(
              l10n.wizardCompletionTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.l),
          Text(
            l10n.wizardCompletionDescription,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 3),
          CButton(
            text: l10n.wizardAddFirstMedication,
            onPressed: onAddMedication,
          ),
          const SizedBox(height: AppSpacing.m),
          CButton.text(
            text: l10n.wizardGoHome,
            onPressed: onGoHome,
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}
