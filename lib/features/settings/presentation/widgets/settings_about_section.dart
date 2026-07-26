import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/shared/components/c_button.dart';
import 'package:medication_reminder/shared/components/c_dialog.dart';
import 'package:medication_reminder/shared/components/c_snackbar.dart';
import 'package:medication_reminder/shared/navigation/c_navigator.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/version/update_dialog.dart';
import 'package:medication_reminder/core/database/database_provider.dart';
import 'package:medication_reminder/core/database/database_initializer.dart';
import 'package:medication_reminder/core/notifications/notifications.dart';
import 'package:medication_reminder/features/medications/today_dashboard/providers/dashboard_list_notifier.dart';
import 'package:medication_reminder/features/medications/medication_management/providers/medication_list_notifier.dart';
import 'package:medication_reminder/features/medications/compliance_history/providers/providers.dart';
import 'package:medication_reminder/features/profiles/providers/profile_providers.dart';
import '../../models/settings_model.dart';
import '../../providers/providers.dart';
import '../screens/privacy_policy_screen.dart';
import '../../../system_health/presentation/screens/system_health_screen.dart';

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
          Semantics(
            label: '${l10n.settingsVersion}: ${settings.appVersion}',
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(l10n.settingsVersion),
              subtitle: Text(settings.appVersion),
            ),
          ),

          const Divider(height: 1),

          // Build Number
          Semantics(
            label: '${l10n.settingsBuildNumber}: ${settings.buildNumber}',
            child: ListTile(
              leading: const Icon(Icons.build),
              title: Text(l10n.settingsBuildNumber),
              subtitle: Text(settings.buildNumber),
            ),
          ),

          const Divider(height: 1),

          // Check for Updates
          Semantics(
            label: l10n.settingsUpdate,
            child: ListTile(
              leading: const Icon(Icons.system_update),
              title: Text(l10n.settingsUpdate),
              subtitle: Text(l10n.settingsUpdateDesc),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => checkForUpdateAndNotify(context, ref),
            ),
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
            onTap: () => CNavigator.push(const PrivacyPolicyScreen()),
          ),

          const Divider(height: 1),

          // System Health
          Semantics(
            label: l10n.healthSystemHealthTitle,
            child: ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: Text(l10n.healthSystemHealthTitle),
              subtitle: Text(l10n.settingsSystemHealthSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => CNavigator.push(const SystemHealthScreen()),
            ),
          ),

          const Divider(height: 1),

          // Contact Developer
          Semantics(
            label: l10n.settingsContactDeveloper,
            child: ListTile(
              leading: const Icon(Icons.support_agent),
              title: Text(l10n.settingsContactDeveloper),
              subtitle: const Text('00967770603656'),
              trailing: const Icon(Icons.copy, size: 20),
              onTap: () {
                _copyToClipboard(context, '00967770603656');
              },
            ),
          ),

          const SizedBox(height: AppSpacing.m),

          // Reset to Defaults
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
            child: Semantics(
              label: l10n.settingsResetDefaults,
              child: SizedBox(
                width: double.infinity,
                child: CButton.outlined(
                  text: l10n.settingsResetDefaults,
                  onPressed: () => _confirmReset(context, ref, l10n),
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.s),

          // Clear All App Data Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
            child: Semantics(
              label: l10n.settingsClearAllData,
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.error,
                    side: BorderSide(color: theme.colorScheme.error),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.delete_forever_outlined),
                  label: Text(
                    l10n.settingsClearAllData,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => _confirmClearAllData(context, ref, l10n),
                ),
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

  void _confirmClearAllData(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    CDialog.confirm(
      context: context,
      title: l10n.settingsClearAllData,
      content: l10n.settingsClearAllDataConfirm,
      confirmText: l10n.settingsClearAllData,
      cancelText: l10n.cancel,
      isDestructive: true,
    ).then((confirmed) async {
      if (confirmed == true) {
        try {
          final manager = ref.read(notificationManagerProvider);
          await manager.cancelAll();

          final isar = ref.read(isarProvider);
          await isar.writeTxn(() async {
            await isar.clear();
          });

          final prefs = await SharedPreferences.getInstance();
          await prefs.clear();

          final dbService = ref.read(databaseServiceProvider);
          await DatabaseInitializer.initialize(dbService);

          ref.read(settingsProvider.notifier).resetToDefaults();
          ref.invalidate(dashboardListProvider);
          ref.invalidate(medicationListProvider);
          ref.invalidate(historyListProvider);
          ref.invalidate(activeProfileUuidProvider);
          ref.invalidate(activeProfileProvider);

          if (context.mounted) {
            CSnackbar.success(context, l10n.settingsClearAllDataDone);
          }
        } catch (e) {
          if (context.mounted) {
            CSnackbar.error(context, e.toString());
          }
        }
      }
    });
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    CSnackbar.success(
      context,
      AppLocalizations.of(context).settingsCopiedToClipboard,
    );
  }
}
