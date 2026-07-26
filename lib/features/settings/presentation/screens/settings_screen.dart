import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/features/settings/presentation/widgets/settings_about_section.dart';
import 'package:medication_reminder/features/settings/presentation/widgets/settings_backup_section.dart';
import 'package:medication_reminder/features/settings/presentation/widgets/settings_general_section.dart';
import 'package:medication_reminder/features/settings/presentation/widgets/settings_history_section.dart';
import 'package:medication_reminder/features/settings/presentation/widgets/settings_notifications_section.dart';
import 'package:medication_reminder/features/settings/presentation/widgets/settings_profiles_section.dart';
import 'package:medication_reminder/features/settings/providers/settings_notifier.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_scaffold.dart';
import 'package:medication_reminder/shared/components/c_app_bar.dart';
import 'package:medication_reminder/shared/components/c_loading.dart';
import 'package:medication_reminder/shared/components/c_error_view.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../models/settings_model.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(settingsProvider);

    return CScaffold(
      appBar: CAppBar(title: l10n.settingsTitle, centerTitle: true),
      body: _buildBody(state, l10n),
    );
  }

  Widget _buildBody(BaseState<SettingsModel> state, AppLocalizations l10n) {
    if (state.status == LoadStatus.loading) {
      return const CLoading();
    }

    if (state.status == LoadStatus.error) {
      return CErrorView(
        errorMessage: state.error?.errorMessage ?? l10n.settingsErrorLoading,
        onRetry: () => ref.read(settingsProvider.notifier).refresh(),
      );
    }

    final settings = state.data;
    if (settings == null) {
      return CErrorView(
        errorMessage: l10n.settingsErrorLoading,
        onRetry: () => ref.read(settingsProvider.notifier).refresh(),
      );
    }

    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.xxxl),
      children: [
        SettingsProfilesSection(),
        const SizedBox(height: AppSpacing.s),
        SettingsGeneralSection(settings: settings),
        const SizedBox(height: AppSpacing.s),
        SettingsNotificationsSection(settings: settings),
        const SizedBox(height: AppSpacing.s),
        SettingsHistorySection(settings: settings),
        const SizedBox(height: AppSpacing.s),
        SettingsBackupSection(settings: settings),
        const SizedBox(height: AppSpacing.s),
        SettingsAboutSection(settings: settings),
      ],
    );
  }
}
