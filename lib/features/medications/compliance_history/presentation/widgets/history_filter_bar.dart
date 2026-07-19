import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/radius/app_radius.dart';
import '../../../medication_management/models/enums/medication_enums.dart';
import '../../models/history_enums.dart';
import '../../providers/history_filter_provider.dart';

class HistoryFilterBar extends ConsumerWidget {
  const HistoryFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(historyFilterProvider);

    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
        children: [
          _FilterChip(
            label: _dateRangeLabel(context, filter.dateRange),
            isSelected: filter.dateRange != HistoryDateRange.last7Days,
            onTap: () => _showDateRangePicker(context, ref),
            icon: Icons.date_range,
          ),
          if (filter.medicationUuid != null) ...[
            const SizedBox(width: AppSpacing.xs),
            _FilterChip(
              label: filter.medicationUuid!.substring(0, 8),
              isSelected: true,
              onTap: () => ref
                  .read(historyFilterProvider.notifier)
                  .setMedicationFilter(null),
              icon: Icons.medication,
            ),
          ],
          if (filter.status != null) ...[
            const SizedBox(width: AppSpacing.xs),
            _FilterChip(
              label: _statusLabel(context, filter.status!),
              isSelected: true,
              onTap: () => ref
                  .read(historyFilterProvider.notifier)
                  .setStatusFilter(null),
              icon: Icons.check_circle_outline,
            ),
          ],
          if (filter.priority != null) ...[
            const SizedBox(width: AppSpacing.xs),
            _FilterChip(
              label: _priorityLabel(context, filter.priority!),
              isSelected: true,
              onTap: () => ref
                  .read(historyFilterProvider.notifier)
                  .setPriorityFilter(null),
              icon: Icons.flag_outlined,
            ),
          ],
          const SizedBox(width: AppSpacing.xs),
          _FilterChip(
            label: _groupByLabel(context, filter.groupBy),
            isSelected: false,
            onTap: () => _showGroupByPicker(context, ref),
            icon: Icons.folder_outlined,
          ),
        ],
      ),
    );
  }

  String _dateRangeLabel(BuildContext context, HistoryDateRange range) {
    final l10n = AppLocalizations.of(context);
    return switch (range) {
      HistoryDateRange.last7Days => l10n.historyDateRange7Days,
      HistoryDateRange.last30Days => l10n.historyDateRange30Days,
      HistoryDateRange.custom => l10n.historyDateRangeCustom,
      HistoryDateRange.all => l10n.historyDateRangeAll,
    };
  }

  String _statusLabel(BuildContext context, DoseStatus status) {
    final l10n = AppLocalizations.of(context);
    return switch (status) {
      DoseStatus.taken => l10n.historyTaken,
      DoseStatus.missed => l10n.historyMissed,
      DoseStatus.skipped => l10n.historySkipped,
      DoseStatus.pending => l10n.historySnoozed,
    };
  }

  String _priorityLabel(BuildContext context, MedicationPriority priority) {
    final l10n = AppLocalizations.of(context);
    return switch (priority) {
      MedicationPriority.low => l10n.priorityLow,
      MedicationPriority.medium => l10n.priorityMed,
      MedicationPriority.high => l10n.priorityHigh,
    };
  }

  String _groupByLabel(BuildContext context, HistoryGroupBy groupBy) {
    final l10n = AppLocalizations.of(context);
    return switch (groupBy) {
      HistoryGroupBy.day => l10n.historyGroupByDay,
      HistoryGroupBy.week => l10n.historyGroupByWeek,
      HistoryGroupBy.month => l10n.historyGroupByMonth,
      HistoryGroupBy.medication => l10n.historyGroupByMedication,
    };
  }

  void _showDateRangePicker(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final notifier = ref.read(historyFilterProvider.notifier);

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.date_range),
              title: Text(l10n.historyDateRange7Days),
              onTap: () {
                notifier.setDateRange(HistoryDateRange.last7Days);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: Text(l10n.historyDateRange30Days),
              onTap: () {
                notifier.setDateRange(HistoryDateRange.last30Days);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: Text(l10n.historyDateRangeAll),
              onTap: () {
                notifier.setDateRange(HistoryDateRange.all);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_calendar),
              title: Text(l10n.historyDateRangeCustom),
              onTap: () async {
                Navigator.pop(context);
                final now = DateTime.now();
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: now.add(const Duration(days: 1)),
                  initialDateRange: DateTimeRange(
                    start: now.subtract(const Duration(days: 7)),
                    end: now,
                  ),
                );
                if (picked != null) {
                  notifier.setCustomDateRange(picked.start, picked.end);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showGroupByPicker(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final notifier = ref.read(historyFilterProvider.notifier);

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(l10n.historyGroupByDay),
              onTap: () {
                notifier.setGroupBy(HistoryGroupBy.day);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(l10n.historyGroupByWeek),
              onTap: () {
                notifier.setGroupBy(HistoryGroupBy.week);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(l10n.historyGroupByMonth),
              onTap: () {
                notifier.setGroupBy(HistoryGroupBy.month);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(l10n.historyGroupByMedication),
              onTap: () {
                notifier.setGroupBy(HistoryGroupBy.medication);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(
        icon,
        size: 16,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
        ),
      ),
      onPressed: onTap,
      backgroundColor: isSelected
          ? AppColors.primary.withValues(alpha: 0.08)
          : AppColors.surface,
      side: BorderSide(
        color: isSelected
            ? AppColors.primary.withValues(alpha: 0.3)
            : AppColors.border,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.borderL),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}
