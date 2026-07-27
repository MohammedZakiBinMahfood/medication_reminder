import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../models/settings_model.dart';
import '../../models/settings_enums.dart';
import '../../providers/providers.dart';

class SettingsGeneralSection extends ConsumerWidget {
  final SettingsModel settings;

  const SettingsGeneralSection({super.key, required this.settings});

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
              l10n.settingsGeneral,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),

          // Language
          Semantics(
            label: l10n.settingsLanguage,
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(l10n.settingsLanguage),
              subtitle: Text(
                settings.language == 'ar'
                    ? l10n.settingsLanguageArabic
                    : l10n.settingsLanguageEnglish,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showLanguagePicker(context, ref, l10n),
            ),
          ),

          const Divider(height: 1),

          // Theme
          Semantics(
            label: l10n.settingsTheme,
            child: ListTile(
              leading: const Icon(Icons.palette_outlined),
              title: Text(l10n.settingsTheme),
              subtitle: Text(_themeModeLabel(settings.themeMode, l10n)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showThemePicker(context, ref, l10n),
            ),
          ),

          const Divider(height: 1),

          // Accent Color
          Semantics(
            label: l10n.accentThemeLabel,
            child: ListTile(
              leading: Icon(
                Icons.color_lens_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(l10n.accentThemeLabel),
              subtitle: Text(_accentColorLabel(settings.accentColor, l10n)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showAccentColorPicker(context, ref, l10n),
            ),
          ),

          const Divider(height: 1),

          // First Day of Week
          Semantics(
            label: l10n.settingsFirstDayOfWeek,
            child: ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(l10n.settingsFirstDayOfWeek),
              subtitle: Text(_dayOfWeekLabel(settings.firstDayOfWeek, l10n)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showFirstDayPicker(context, ref, l10n),
            ),
          ),

          const Divider(height: 1),

          // 24-hour format
          SwitchListTile(
            secondary: const Icon(Icons.access_time),
            title: Text(l10n.settingsTimeFormat24),
            value: settings.timeFormat24,
            onChanged: (v) => notifier.updateTimeFormat24(v),
          ),
        ],
      ),
    );
  }

  String _themeModeLabel(AppThemeMode mode, AppLocalizations l10n) {
    return switch (mode) {
      AppThemeMode.light => l10n.settingsThemeLight,
      AppThemeMode.dark => l10n.settingsThemeDark,
      AppThemeMode.system => l10n.settingsThemeSystem,
    };
  }

  String _dayOfWeekLabel(int day, AppLocalizations l10n) {
    return switch (day) {
      6 => l10n.daySat,
      7 => l10n.daySun,
      1 => l10n.dayMon,
      2 => l10n.dayTue,
      3 => l10n.dayWed,
      4 => l10n.dayThu,
      5 => l10n.dayFri,
      _ => l10n.daySat,
    };
  }

  void _showLanguagePicker(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final notifier = ref.read(settingsProvider.notifier);
    final current = ref.read(settingsProvider).data?.language ?? 'ar';

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Text(
                l10n.settingsLanguage,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            RadioListTile<String>(
              title: Text(l10n.settingsLanguageArabic),
              value: 'ar',
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateLanguage(v);
              },
            ),
            RadioListTile<String>(
              title: Text(l10n.settingsLanguageEnglish),
              value: 'en',
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateLanguage(v);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showThemePicker(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final notifier = ref.read(settingsProvider.notifier);
    final current =
        ref.read(settingsProvider).data?.themeMode ?? AppThemeMode.light;

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Text(
                l10n.settingsTheme,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            RadioListTile<AppThemeMode>(
              title: Text(l10n.settingsThemeLight),
              value: AppThemeMode.light,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateThemeMode(v);
              },
            ),
            RadioListTile<AppThemeMode>(
              title: Text(l10n.settingsThemeDark),
              value: AppThemeMode.dark,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateThemeMode(v);
              },
            ),
            RadioListTile<AppThemeMode>(
              title: Text(l10n.settingsThemeSystem),
              value: AppThemeMode.system,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateThemeMode(v);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showFirstDayPicker(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final notifier = ref.read(settingsProvider.notifier);
    final current = ref.read(settingsProvider).data?.firstDayOfWeek ?? 6;

    final days = [
      (value: 6, label: l10n.daySat),
      (value: 7, label: l10n.daySun),
      (value: 1, label: l10n.dayMon),
      (value: 2, label: l10n.dayTue),
      (value: 3, label: l10n.dayWed),
      (value: 4, label: l10n.dayThu),
      (value: 5, label: l10n.dayFri),
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
                l10n.settingsFirstDayOfWeek,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            for (final day in days)
              RadioListTile<int>(
                title: Text(day.label),
                value: day.value,
                groupValue: current,
                onChanged: (v) {
                  Navigator.pop(context);
                  if (v != null) notifier.updateFirstDayOfWeek(v);
                },
              ),
          ],
        ),
      ),
    );
  }

  String _accentColorLabel(AppAccentColor accent, AppLocalizations l10n) {
    return switch (accent) {
      AppAccentColor.indigo => l10n.accentIndigo,
      AppAccentColor.emerald => l10n.accentEmerald,
      AppAccentColor.ocean => l10n.accentOcean,
      AppAccentColor.sunset => l10n.accentSunset,
      AppAccentColor.violet => l10n.accentViolet,
    };
  }

  void _showAccentColorPicker(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final notifier = ref.read(settingsProvider.notifier);
    final current =
        ref.read(settingsProvider).data?.accentColor ?? AppAccentColor.indigo;

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Text(
                l10n.accentThemeLabel,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            for (final accent in AppAccentColor.values)
              RadioListTile<AppAccentColor>(
                title: Text(_accentColorLabel(accent, l10n)),
                value: accent,
                groupValue: current,
                onChanged: (v) {
                  Navigator.pop(context);
                  if (v != null) notifier.updateAccentColor(v);
                },
              ),
          ],
        ),
      ),
    );
  }
}
