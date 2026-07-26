import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/shared/components/c_button.dart';
import '../../models/models.dart';

class QuickFixesCard extends StatelessWidget {
  final List<HealthCheckModel> failedChecks;
  final VoidCallback onEnableNotifications;
  final VoidCallback onOpenBatterySettings;
  final VoidCallback onGrantExactAlarm;
  final VoidCallback onRefreshScheduler;

  const QuickFixesCard({
    super.key,
    required this.failedChecks,
    required this.onEnableNotifications,
    required this.onOpenBatterySettings,
    required this.onGrantExactAlarm,
    required this.onRefreshScheduler,
  });

  @override
  Widget build(BuildContext context) {
    if (failedChecks.isEmpty) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);

    return CCard(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Semantics(
        container: true,
        header: true,
        label: l10n.healthQuickFixes,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.healthQuickFixes,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.m),
            ...failedChecks.map((check) {
              final (label, action) = _fixForCheck(
                check,
                l10n: l10n,
                onEnableNotifications: onEnableNotifications,
                onOpenBatterySettings: onOpenBatterySettings,
                onGrantExactAlarm: onGrantExactAlarm,
                onRefreshScheduler: onRefreshScheduler,
              );
              if (label == null) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.s),
                child: SizedBox(
                  width: double.infinity,
                  child: CButton.text(
                    text: label,
                    onPressed: action,
                    icon: const Icon(Icons.build, size: 16),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  (String?, VoidCallback?) _fixForCheck(
    HealthCheckModel check, {
    required AppLocalizations l10n,
    required VoidCallback onEnableNotifications,
    required VoidCallback onOpenBatterySettings,
    required VoidCallback onGrantExactAlarm,
    required VoidCallback onRefreshScheduler,
  }) {
    return switch (check.type) {
      HealthCheckType.notificationPermission => (
        l10n.healthActionEnableNotifications,
        onEnableNotifications,
      ),
      HealthCheckType.exactAlarmPermission => (
        l10n.healthActionGrantExactAlarm,
        onGrantExactAlarm,
      ),
      HealthCheckType.batteryOptimization => (
        l10n.healthActionOpenBatterySettings,
        onOpenBatterySettings,
      ),
      HealthCheckType.notificationService => (
        l10n.healthRefresh,
        onRefreshScheduler,
      ),
      _ => (null, null),
    };
  }
}
