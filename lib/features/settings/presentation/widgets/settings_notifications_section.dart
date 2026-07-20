import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../models/settings_model.dart';
import '../../providers/providers.dart';

class SettingsNotificationsSection extends ConsumerWidget {
  final SettingsModel settings;

  const SettingsNotificationsSection({super.key, required this.settings});

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
              l10n.settingsNotifications,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),

          // Enable Notifications
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined),
            title: Text(l10n.settingsNotificationsEnabled),
            value: settings.notificationsEnabled,
            onChanged: (v) => notifier.updateNotificationsEnabled(v),
          ),

          const Divider(height: 1),

          // Sound
          Semantics(
            enabled: settings.notificationsEnabled,
            child: SwitchListTile(
              secondary: const Icon(Icons.volume_up_outlined),
              title: Text(l10n.settingsNotificationSound),
              value: settings.notificationSound,
              onChanged: settings.notificationsEnabled
                  ? (v) => notifier.updateNotificationSound(v)
                  : null,
            ),
          ),

          const Divider(height: 1),

          // Vibration
          Semantics(
            enabled: settings.notificationsEnabled,
            child: SwitchListTile(
              secondary: const Icon(Icons.vibration),
              title: Text(l10n.settingsVibrationEnabled),
              value: settings.vibrationEnabled,
              onChanged: settings.notificationsEnabled
                  ? (v) => notifier.updateVibrationEnabled(v)
                  : null,
            ),
          ),

          const Divider(height: 1),

          // Default Snooze
          ListTile(
            leading: const Icon(Icons.snooze),
            title: Text(l10n.settingsDefaultSnooze),
            subtitle: Text(
              '${settings.defaultSnoozeMinutes} ${l10n.dashboardMinutes}',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showSnoozePicker(context, ref, l10n),
          ),

          const Divider(height: 1),

          // Reminder Before Dose
          ListTile(
            leading: const Icon(Icons.timer_outlined),
            title: Text(l10n.settingsReminderBefore),
            subtitle: Text(
              settings.reminderBeforeMinutes == 0
                  ? l10n.settingsReminderAtTime
                  : '${settings.reminderBeforeMinutes} ${l10n.dashboardMinutes}',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showReminderPicker(context, ref, l10n),
          ),
        ],
      ),
    );
  }

  void _showSnoozePicker(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final notifier = ref.read(settingsProvider.notifier);
    final current = ref.read(settingsProvider).data?.defaultSnoozeMinutes ?? 10;

    final options = [5, 10, 15, 30, 45, 60];

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Text(
                l10n.settingsDefaultSnooze,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            for (final minutes in options)
              RadioListTile<int>(
                title: Text('$minutes ${l10n.dashboardMinutes}'),
                value: minutes,
                groupValue: current,
                onChanged: (v) {
                  Navigator.pop(context);
                  if (v != null) notifier.updateDefaultSnoozeMinutes(v);
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showReminderPicker(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final notifier = ref.read(settingsProvider.notifier);
    final current = ref.read(settingsProvider).data?.reminderBeforeMinutes ?? 0;

    final options = [
      (value: 0, label: l10n.settingsReminderAtTime),
      (value: 5, label: '5 ${l10n.dashboardMinutes}'),
      (value: 10, label: '10 ${l10n.dashboardMinutes}'),
      (value: 15, label: '15 ${l10n.dashboardMinutes}'),
      (value: 30, label: '30 ${l10n.dashboardMinutes}'),
    ];

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Text(
                l10n.settingsReminderBefore,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            for (final option in options)
              RadioListTile<int>(
                title: Text(option.label),
                value: option.value,
                groupValue: current,
                onChanged: (v) {
                  Navigator.pop(context);
                  if (v != null) notifier.updateReminderBeforeMinutes(v);
                },
              ),
          ],
        ),
      ),
    );
  }
}
