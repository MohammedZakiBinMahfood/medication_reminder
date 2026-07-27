import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profiles/providers/profile_providers.dart';
import '../../../medications/today_dashboard/presentation/screens/profile_management_screen.dart';
import 'package:medication_reminder/shared/navigation/c_navigator.dart';

class SettingsProfilesSection extends ConsumerWidget {
  const SettingsProfilesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final profilesAsync = ref.watch(allProfilesProvider);
    final activeUuidAsync = ref.watch(activeProfileUuidProvider);

    final profileCount = profilesAsync.value?.length ?? 0;
    final activeName = profilesAsync.value
        ?.where((p) => p.uuid == (activeUuidAsync.value ?? ''))
        .firstOrNull
        ?.name;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: const Icon(Icons.people),
        title: Text(l10n.settingsProfiles),
        subtitle: activeName != null
            ? Text(l10n.settingsProfileActive(activeName, profileCount))
            : Text(l10n.settingsProfileCount(profileCount)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => CNavigator.push(const ProfileManagementScreen()),
      ),
    );
  }
}
