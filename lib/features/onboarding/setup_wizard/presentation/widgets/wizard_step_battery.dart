import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_button.dart';

class WizardStepBattery extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onOpenSettings;

  const WizardStepBattery({
    super.key,
    required this.onNext,
    this.onOpenSettings,
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
            label: l10n.wizardBatteryIcon,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.battery_charging_full_outlined,
                size: 48,
                color: AppColors.warning,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Semantics(
            header: true,
            child: Text(
              l10n.wizardBatteryTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.l),
          Text(
            l10n.wizardBatteryDescription,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 3),
          if (onOpenSettings != null) ...[
            Semantics(
              button: true,
              label: l10n.wizardOpenSettings,
              child: CButton(
                text: l10n.wizardOpenSettings,
                onPressed: onOpenSettings,
              ),
            ),
            const SizedBox(height: AppSpacing.m),
          ],
          Semantics(
            button: true,
            label: l10n.wizardNext,
            child: CButton.text(
              text: l10n.wizardNext,
              onPressed: onNext,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}
