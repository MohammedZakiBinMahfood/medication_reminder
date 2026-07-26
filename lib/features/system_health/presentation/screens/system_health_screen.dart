import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_app_bar.dart';
import 'package:medication_reminder/shared/components/c_scaffold.dart';
import 'package:medication_reminder/shared/components/c_loading.dart';
import 'package:medication_reminder/shared/components/c_error_view.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import '../widgets/health_check_tile.dart';
import '../widgets/health_score_card.dart';
import '../widgets/quick_fixes_card.dart';

class SystemHealthScreen extends ConsumerStatefulWidget {
  const SystemHealthScreen({super.key});

  @override
  ConsumerState<SystemHealthScreen> createState() => _SystemHealthScreenState();
}

class _SystemHealthScreenState extends ConsumerState<SystemHealthScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(systemHealthProvider.notifier).loadAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(systemHealthProvider);

    return CScaffold(
      appBar: CAppBar(
        title: l10n.healthSystemHealthTitle,
        centerTitle: true,
      ),
      body: _buildBody(state, l10n),
    );
  }

  Widget _buildBody(BaseState<SystemHealthState> state, AppLocalizations l10n) {
    if (state.status == LoadStatus.loading) {
      return const CLoading();
    }

    if (state.status == LoadStatus.error) {
      return CErrorView(
        errorMessage: state.error?.errorMessage ?? l10n.healthApplicationError,
        onRetry: () => ref.read(systemHealthProvider.notifier).loadAll(),
      );
    }

    final data = state.data;
    if (data == null) {
      return CErrorView(
        errorMessage: l10n.healthApplicationError,
        onRetry: () => ref.read(systemHealthProvider.notifier).loadAll(),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(systemHealthProvider.notifier).refresh(),
      child: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.xxxl),
        children: [
          const SizedBox(height: AppSpacing.l),
          HealthScoreCard(
            healthState: data,
            onRefresh: () => ref.read(systemHealthProvider.notifier).refresh(),
          ),
          const SizedBox(height: AppSpacing.l),
          QuickFixesCard(
            failedChecks: data.failedChecks,
            onEnableNotifications: () {
              ref.read(systemHealthProvider.notifier).requestNotificationPermission();
            },
            onOpenBatterySettings: () {
              ref.read(systemHealthProvider.notifier).openBatterySettings();
            },
            onGrantExactAlarm: () {
              ref.read(systemHealthProvider.notifier).openExactAlarmSettings();
            },
            onRefreshScheduler: () {
              ref.read(systemHealthProvider.notifier).refreshScheduler();
            },
          ),
          const SizedBox(height: AppSpacing.m),
          _SectionHeader(title: l10n.systemHealthChecksSection),
          ...data.checks.map((check) => HealthCheckTile(
            check: check,
            title: _checkTitle(check.type, l10n),
            description: _checkDescription(check, l10n),
            actionLabel: check.actionLabel != null ? _actionLabel(check.actionLabel!, l10n) : null,
            onAction: check.onAction,
          )),
          const SizedBox(height: AppSpacing.m),
        ],
      ),
    );
  }

  String _checkTitle(HealthCheckType type, AppLocalizations l10n) {
    return switch (type) {
      HealthCheckType.notificationPermission => l10n.healthNotificationPermissionTitle,
      HealthCheckType.exactAlarmPermission => l10n.healthExactAlarmTitle,
      HealthCheckType.batteryOptimization => l10n.healthBatteryTitle,
      HealthCheckType.notificationService => l10n.healthNotificationServiceTitle,
      HealthCheckType.pendingNotifications => l10n.healthPendingNotificationsTitle,
      HealthCheckType.database => l10n.healthDatabaseTitle,
      HealthCheckType.timeZone => l10n.healthTimeZoneTitle,
      HealthCheckType.application => l10n.healthApplicationTitle,
    };
  }

  String _checkDescription(HealthCheckModel check, AppLocalizations l10n) {
    return switch (check.status) {
      HealthStatus.granted => _grantedDesc(check.type, l10n),
      HealthStatus.denied => _deniedDesc(check.type, l10n),
      HealthStatus.unknown => _unknownDesc(check.type, l10n),
      HealthStatus.healthy => _healthyDesc(check.type, l10n),
      HealthStatus.ready => l10n.healthServiceReady,
      HealthStatus.error => l10n.healthServiceError,
      HealthStatus.unavailable => l10n.healthExactAlarmUnavailable,
      HealthStatus.optimized => l10n.healthBatteryOptimized,
      HealthStatus.ignored => l10n.healthBatteryIgnored,
    };
  }

  String _grantedDesc(HealthCheckType type, AppLocalizations l10n) {
    return switch (type) {
      HealthCheckType.notificationPermission => l10n.healthNotificationGranted,
      HealthCheckType.exactAlarmPermission => l10n.healthExactAlarmGranted,
      _ => '',
    };
  }

  String _deniedDesc(HealthCheckType type, AppLocalizations l10n) {
    return switch (type) {
      HealthCheckType.notificationPermission => l10n.healthNotificationDenied,
      HealthCheckType.exactAlarmPermission => l10n.healthExactAlarmDenied,
      _ => '',
    };
  }

  String _unknownDesc(HealthCheckType type, AppLocalizations l10n) {
    return switch (type) {
      HealthCheckType.notificationPermission => l10n.healthNotificationUnknown,
      HealthCheckType.exactAlarmPermission => l10n.healthExactAlarmUnknown,
      HealthCheckType.batteryOptimization => l10n.healthBatteryUnknown,
      _ => '',
    };
  }

  String _healthyDesc(HealthCheckType type, AppLocalizations l10n) {
    return switch (type) {
      HealthCheckType.database => l10n.healthDatabaseHealthy,
      HealthCheckType.timeZone => l10n.healthTimeZoneInfo,
      HealthCheckType.pendingNotifications => l10n.healthPendingNotificationsInfo,
      HealthCheckType.application => l10n.healthApplicationInfo,
      _ => '',
    };
  }

  String _actionLabel(String actionKey, AppLocalizations l10n) {
    return switch (actionKey) {
      'notificationPermissionAction' => l10n.healthActionEnableNotifications,
      'exactAlarmAction' => l10n.healthActionGrantExactAlarm,
      'batteryAction' => l10n.healthActionOpenBatterySettings,
      _ => actionKey,
    };
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Semantics(
        header: true,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
