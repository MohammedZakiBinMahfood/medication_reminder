import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/shared/components/c_button.dart';
import 'package:medication_reminder/shared/components/c_dialog.dart';
import 'package:medication_reminder/shared/components/c_snackbar.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../models/settings_model.dart';
import '../../providers/providers.dart';

class SettingsAboutSection extends ConsumerWidget {
  final SettingsModel settings;

  const SettingsAboutSection({super.key, required this.settings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return CCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.l,
              AppSpacing.l,
              AppSpacing.l,
              AppSpacing.xs,
            ),
            child: Text(
              l10n.settingsAbout,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),

          // Version
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.settingsVersion),
            subtitle: Text(settings.appVersion),
          ),

          const Divider(height: 1),

          // Build Number
          ListTile(
            leading: const Icon(Icons.build),
            title: Text(l10n.settingsBuildNumber),
            subtitle: Text(settings.buildNumber),
          ),

          const Divider(height: 1),

          // Licenses
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l10n.settingsLicenses),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => showLicensePage(
              context: context,
              applicationName: l10n.appTitle,
              applicationVersion: settings.appVersion,
            ),
          ),

          const Divider(height: 1),

          // Privacy Policy
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(l10n.settingsPrivacyPolicy),
            subtitle: Text(l10n.settingsPrivacyPolicyDesc),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              CSnackbar.info(context, l10n.settingsComingSoon);
            },
          ),

          const SizedBox(height: AppSpacing.m),

          // Reset to Defaults
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
            child: SizedBox(
              width: double.infinity,
              child: CButton.outlined(
                text: l10n.settingsResetDefaults,
                onPressed: () => _confirmReset(context, ref, l10n),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.l),
        ],
      ),
    );
  }

  void _confirmReset(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    CDialog.confirm(
      context: context,
      title: l10n.settingsResetDefaults,
      content: l10n.settingsResetConfirm,
      confirmText: l10n.settingsResetDefaults,
      cancelText: l10n.cancel,
      isDestructive: true,
    ).then((confirmed) {
      if (confirmed == true) {
        ref.read(settingsProvider.notifier).resetToDefaults();
        CSnackbar.success(context, l10n.settingsResetDone);
      }
    });
  }
}
