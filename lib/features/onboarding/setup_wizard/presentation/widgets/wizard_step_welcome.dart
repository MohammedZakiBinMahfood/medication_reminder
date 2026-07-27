import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/typography/app_typography.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_button.dart';

class WizardStepWelcome extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onSkip;

  const WizardStepWelcome({
    super.key,
    required this.onStart,
    required this.onSkip,
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
            label: l10n.wizardAppLogo,
            child: Image.asset(
              'assets/icons/logo-removebg.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => Icon(
                Icons.medication_outlined,
                size: 120,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Semantics(
            header: true,
            child: Text(
              'مداوي',
              style: AppTypography.headlineLarge.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.l),
          Text(
            l10n.wizardWelcomeDescription,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 3),
          CButton(text: l10n.wizardStart, onPressed: onStart),
          const SizedBox(height: AppSpacing.m),
          CButton.text(text: l10n.wizardSkip, onPressed: onSkip),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}
