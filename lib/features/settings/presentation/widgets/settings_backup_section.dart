import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../models/settings_model.dart';
import '../../providers/providers.dart';

class SettingsBackupSection extends ConsumerWidget {
  final SettingsModel settings;

  const SettingsBackupSection({super.key, required this.settings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final notifier = ref.read(settingsProvider.notifier);

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
              l10n.settingsBackup,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),

          // Auto Backup
          SwitchListTile(
            secondary: const Icon(Icons.cloud_upload_outlined),
            title: Text(l10n.settingsAutoBackup),
            subtitle: Text(l10n.settingsAutoBackupDesc),
            value: settings.autoBackupEnabled,
            onChanged: (v) => notifier.updateAutoBackupEnabled(v),
          ),

          const Divider(height: 1),

          // Manual Backup (disabled placeholder)
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: Text(l10n.settingsManualBackup),
            subtitle: Text(l10n.settingsComingSoon),
            enabled: false,
            trailing: const Icon(Icons.chevron_right),
          ),

          const Divider(height: 1),

          // Restore Backup (disabled placeholder)
          ListTile(
            leading: const Icon(Icons.restore),
            title: Text(l10n.settingsRestoreBackup),
            subtitle: Text(l10n.settingsComingSoon),
            enabled: false,
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
