import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../models/dashboard_enums.dart';
import '../../providers/providers.dart';

class DashboardFilters extends ConsumerWidget {
  const DashboardFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentFilter = ref.watch(dashboardFilterProvider);

    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
        children: DashboardFilterType.values.map((type) {
          final isSelected = currentFilter.filterType == type;
          final filterLabel = _filterLabel(type, l10n);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
            child: Semantics(
              label: filterLabel,
              selected: isSelected,
              child: FilterChip(
                label: Text(filterLabel),
                selected: isSelected,
                onSelected: (_) {
                  ref
                      .read(dashboardFilterProvider.notifier)
                      .setFilterType(type);
                },
                selectedColor: Theme.of(context).colorScheme.primaryContainer,
                checkmarkColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _filterLabel(DashboardFilterType type, AppLocalizations l10n) {
    return switch (type) {
      DashboardFilterType.all => l10n.dashboardFilterAll,
      DashboardFilterType.upcoming => l10n.dashboardFilterUpcoming,
      DashboardFilterType.completed => l10n.dashboardFilterCompleted,
      DashboardFilterType.missed => l10n.dashboardFilterMissed,
      DashboardFilterType.critical => l10n.dashboardFilterCritical,
      DashboardFilterType.normal => l10n.dashboardFilterNormal,
      DashboardFilterType.low => l10n.dashboardFilterLow,
    };
  }
}
