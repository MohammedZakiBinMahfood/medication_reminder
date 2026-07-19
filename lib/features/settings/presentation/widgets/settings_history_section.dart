import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../models/settings_model.dart';
import '../../models/settings_enums.dart';
import '../../providers/providers.dart';

class SettingsHistorySection extends ConsumerWidget {
  final SettingsModel settings;

  const SettingsHistorySection({super.key, required this.settings});

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
              l10n.settingsHistory,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),

          // Default Filter
          ListTile(
            leading: const Icon(Icons.filter_list),
            title: Text(l10n.settingsDefaultFilter),
            subtitle: Text(_filterLabel(settings.defaultHistoryFilter, l10n)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showFilterPicker(context, ref, l10n),
          ),

          const Divider(height: 1),

          // Default Grouping
          ListTile(
            leading: const Icon(Icons.group_work),
            title: Text(l10n.settingsDefaultGrouping),
            subtitle: Text(
              _groupingLabel(settings.defaultHistoryGrouping, l10n),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showGroupingPicker(context, ref, l10n),
          ),
        ],
      ),
    );
  }

  String _filterLabel(AppHistoryFilter filter, AppLocalizations l10n) {
    return switch (filter) {
      AppHistoryFilter.last7Days => l10n.historyDateRange7Days,
      AppHistoryFilter.last30Days => l10n.historyDateRange30Days,
      AppHistoryFilter.custom => l10n.historyDateRangeCustom,
      AppHistoryFilter.all => l10n.historyDateRangeAll,
    };
  }

  String _groupingLabel(AppHistoryGrouping grouping, AppLocalizations l10n) {
    return switch (grouping) {
      AppHistoryGrouping.day => l10n.historyGroupByDay,
      AppHistoryGrouping.week => l10n.historyGroupByWeek,
      AppHistoryGrouping.month => l10n.historyGroupByMonth,
      AppHistoryGrouping.medication => l10n.historyGroupByMedication,
    };
  }

  void _showFilterPicker(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final notifier = ref.read(settingsProvider.notifier);
    final current =
        ref.read(settingsProvider).data?.defaultHistoryFilter ??
        AppHistoryFilter.last7Days;

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Text(
                l10n.settingsDefaultFilter,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            RadioListTile<AppHistoryFilter>(
              title: Text(l10n.historyDateRange7Days),
              value: AppHistoryFilter.last7Days,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateDefaultHistoryFilter(v);
              },
            ),
            RadioListTile<AppHistoryFilter>(
              title: Text(l10n.historyDateRange30Days),
              value: AppHistoryFilter.last30Days,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateDefaultHistoryFilter(v);
              },
            ),
            RadioListTile<AppHistoryFilter>(
              title: Text(l10n.historyDateRangeAll),
              value: AppHistoryFilter.all,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateDefaultHistoryFilter(v);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showGroupingPicker(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    final notifier = ref.read(settingsProvider.notifier);
    final current =
        ref.read(settingsProvider).data?.defaultHistoryGrouping ??
        AppHistoryGrouping.day;

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Text(
                l10n.settingsDefaultGrouping,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            RadioListTile<AppHistoryGrouping>(
              title: Text(l10n.historyGroupByDay),
              value: AppHistoryGrouping.day,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateDefaultHistoryGrouping(v);
              },
            ),
            RadioListTile<AppHistoryGrouping>(
              title: Text(l10n.historyGroupByWeek),
              value: AppHistoryGrouping.week,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateDefaultHistoryGrouping(v);
              },
            ),
            RadioListTile<AppHistoryGrouping>(
              title: Text(l10n.historyGroupByMonth),
              value: AppHistoryGrouping.month,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateDefaultHistoryGrouping(v);
              },
            ),
            RadioListTile<AppHistoryGrouping>(
              title: Text(l10n.historyGroupByMedication),
              value: AppHistoryGrouping.medication,
              groupValue: current,
              onChanged: (v) {
                Navigator.pop(context);
                if (v != null) notifier.updateDefaultHistoryGrouping(v);
              },
            ),
          ],
        ),
      ),
    );
  }
}
