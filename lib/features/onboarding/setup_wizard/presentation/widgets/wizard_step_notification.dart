import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_button.dart';
import 'package:medication_reminder/shared/components/c_loading.dart';

class WizardStepNotification extends StatelessWidget {
  final bool isGranted;
  final bool isLoading;
  final VoidCallback onRequestPermission;
  final VoidCallback onNext;

  const WizardStepNotification({
    super.key,
    required this.isGranted,
    required this.isLoading,
    required this.onRequestPermission,
    required this.onNext,
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
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_outlined,
                size: 48,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Semantics(
            header: true,
            child: Text(
              l10n.wizardNotificationTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.l),
          Text(
            l10n.wizardNotificationDescription,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 3),
          if (isLoading)
            const CLoading()
          else if (isGranted) ...[
            Semantics(
              label: l10n.wizardNotificationGranted,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.l,
                  vertical: AppSpacing.m,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.m),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 20,
                    ),
                    const SizedBox(width: AppSpacing.s),
                    Text(
                      l10n.wizardNotificationGranted,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.l),
            CButton(text: l10n.wizardNext, onPressed: onNext),
          ] else ...[
            CButton(
              text: l10n.wizardGrantPermission,
              onPressed: onRequestPermission,
            ),
            const SizedBox(height: AppSpacing.m),
            CButton.text(text: l10n.wizardNext, onPressed: onNext),
          ],
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}
