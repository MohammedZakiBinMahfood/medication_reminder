import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();
    final dayName = _getDayName(now.weekday, l10n);
    final monthName = _getMonthName(now.month, l10n);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.s,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.todayDashboard,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '$dayName، ${now.day} $monthName',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.calendar_today,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  String _getDayName(int weekday, AppLocalizations l10n) {
    switch (weekday) {
      case 1:
        return l10n.dayMon;
      case 2:
        return l10n.dayTue;
      case 3:
        return l10n.dayWed;
      case 4:
        return l10n.dayThu;
      case 5:
        return l10n.dayFri;
      case 6:
        return l10n.daySat;
      case 7:
        return l10n.daySun;
      default:
        return '';
    }
  }

  String _getMonthName(int month, AppLocalizations l10n) {
    switch (month) {
      case 1:
        return l10n.monthJan;
      case 2:
        return l10n.monthFeb;
      case 3:
        return l10n.monthMar;
      case 4:
        return l10n.monthApr;
      case 5:
        return l10n.monthMay;
      case 6:
        return l10n.monthJun;
      case 7:
        return l10n.monthJul;
      case 8:
        return l10n.monthAug;
      case 9:
        return l10n.monthSep;
      case 10:
        return l10n.monthOct;
      case 11:
        return l10n.monthNov;
      case 12:
        return l10n.monthDec;
      default:
        return '';
    }
  }
}
