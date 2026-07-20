import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/providers/first_run_provider.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_medication_model.dart';
import 'package:medication_reminder/features/medications/today_dashboard/models/dashboard_state_model.dart';
import 'package:medication_reminder/features/medications/today_dashboard/providers/dashboard_list_notifier.dart';
import 'package:medication_reminder/features/medications/today_dashboard/providers/dashboard_action_notifier.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_app_bar.dart';
import 'package:medication_reminder/shared/components/c_scaffold.dart';
import 'package:medication_reminder/shared/components/c_loading.dart';
import 'package:medication_reminder/shared/components/c_empty_view.dart';
import 'package:medication_reminder/shared/components/c_error_view.dart';
import 'package:medication_reminder/shared/components/c_snackbar.dart';
import 'package:medication_reminder/shared/navigation/c_navigator.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import '../../../../../core/notifications/notification_providers.dart';
import '../../../compliance_history/presentation/screens/history_screen.dart';
import '../../../medication_management/presentation/screens/medication_form_screen.dart';
import '../../../medication_management/presentation/widgets/first_medication_success_dialog.dart';
import '../../../../settings/presentation/screens/settings_screen.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_summary_card.dart';
import '../widgets/dashboard_section_header.dart';
import '../widgets/dashboard_medication_card.dart';
import '../widgets/dashboard_empty_view.dart';
import '../widgets/dashboard_filters.dart';
import '../widgets/dashboard_floating_actions.dart';
import '../widgets/welcome_card.dart';
import '../widgets/notification_hint_card.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with WidgetsBindingObserver {
  DateTime _lastResumedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardListProvider.notifier).refresh();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _handleAppResume();
    }
  }

  Future<void> _handleAppResume() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(
      _lastResumedDate.year,
      _lastResumedDate.month,
      _lastResumedDate.day,
    );

    // Detect date change — full refresh needed when day rolls over.
    if (!today.isAtSameMomentAs(lastDate)) {
      ref.read(dashboardListProvider.notifier).refresh();
    }

    _lastResumedDate = now;

    // Reschedule notifications to handle timezone changes while backgrounded.
    final manager = ref.read(notificationManagerProvider);
    await manager.onAppResumed();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardListProvider);
    final l10n = AppLocalizations.of(context);

    return CScaffold(
      appBar: CAppBar(
        title: l10n.todayDashboard,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: l10n.viewHistory,
            onPressed: () => CNavigator.push(const HistoryScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: l10n.settingsTitle,
            onPressed: () => CNavigator.push(const SettingsScreen()),
          ),
        ],
      ),
      floatingActionButton: DashboardFloatingActions(
        onAddMedication: () => CNavigator.push(const MedicationFormScreen()),
      ),
      body: _buildBody(dashboardState, l10n),
    );
  }

  Widget _buildBody(
    BaseState<DashboardStateModel> dashboardState,
    AppLocalizations l10n,
  ) {
    if (dashboardState.status == LoadStatus.loading) {
      return const CLoading();
    }

    if (dashboardState.status == LoadStatus.error) {
      return CErrorView(
        errorMessage:
            dashboardState.error?.errorMessage ?? l10n.errorLoadingDashboard,
        onRetry: () => ref.read(dashboardListProvider.notifier).refresh(),
      );
    }

    final data = dashboardState.data;
    if (data == null) {
      return DashboardEmptyView(
        onAddMedication: () => _addMedication(),
        onExploreApp: () => CNavigator.push(const SettingsScreen()),
      );
    }

    return Column(
      children: [
        WelcomeCard(onExploreApp: _onExploreApp),
        const NotificationHintCard(),
        const DashboardHeader(),
        DashboardSummaryCard(summary: data.summary),
        const DashboardFilters(),
        Expanded(
          child: data.isEmpty && data.isFiltered
              ? _buildNoFilterResults(l10n)
              : data.isEmpty
              ? DashboardEmptyView(
                  onAddMedication: () => _addMedication(),
                  onExploreApp: () => _onExploreApp(),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      ref.read(dashboardListProvider.notifier).refresh(),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xxxl),
                    itemCount: _buildListItemCount(data),
                    itemBuilder: (context, index) =>
                        _buildListItem(context, data, index, l10n),
                  ),
                ),
        ),
      ],
    );
  }

  void _onExploreApp() {
    CNavigator.push(const SettingsScreen());
  }

  Future<void> _addMedication() async {
    await CNavigator.push<bool>(const MedicationFormScreen());
    if (!mounted) return;
    final firstRun = ref.read(firstRunProvider);
    if (!firstRun.firstMedicationAdded) {
      FirstMedicationSuccessDialog.show(context, ref);
    }
  }

  Widget _buildNoFilterResults(AppLocalizations l10n) {
    return CEmptyView(
      icon: Icons.filter_list_off,
      title: l10n.firstRunEmptySearchTitle,
      description: l10n.firstRunEmptySearchDescription,
    );
  }

  int _buildListItemCount(DashboardStateModel data) {
    int count = 0;
    for (final section in data.sections) {
      count += 1;
      count += section.medications.length;
    }
    return count;
  }

  Widget _buildListItem(
    BuildContext context,
    DashboardStateModel data,
    int index,
    AppLocalizations l10n,
  ) {
    int currentIndex = 0;
    for (final section in data.sections) {
      if (currentIndex == index) {
        return DashboardSectionHeader(type: section.type, count: section.count);
      }
      currentIndex++;

      for (final medication in section.medications) {
        if (currentIndex == index) {
          return DashboardMedicationCard(
            medication: medication,
            onTaken: () => _markAsTaken(medication),
            onSkipped: () => _markAsSkipped(medication),
            onSnooze: (minutes) => _snooze(medication, minutes),
          );
        }
        currentIndex++;
      }
    }
    return const SizedBox.shrink();
  }

  void _markAsTaken(DashboardMedicationModel medication) {
    ref
        .read(dashboardActionProvider.notifier)
        .markAsTaken(
          medicationUuid: medication.medicationUuid,
          scheduleUuid: medication.scheduleUuid,
          scheduledAt: medication.scheduledTime,
        );
    CSnackbar.success(context, AppLocalizations.of(context).doseTaken);
  }

  void _markAsSkipped(DashboardMedicationModel medication) {
    ref
        .read(dashboardActionProvider.notifier)
        .markAsSkipped(
          medicationUuid: medication.medicationUuid,
          scheduleUuid: medication.scheduleUuid,
          scheduledAt: medication.scheduledTime,
        );
    CSnackbar.success(context, AppLocalizations.of(context).doseSkipped);
  }

  void _snooze(DashboardMedicationModel medication, int minutes) {
    ref
        .read(dashboardActionProvider.notifier)
        .snooze(
          medicationUuid: medication.medicationUuid,
          scheduleUuid: medication.scheduleUuid,
          scheduledAt: medication.scheduledTime,
          minutes: minutes,
        );
    CSnackbar.success(context, AppLocalizations.of(context).doseSnoozedShort);
  }
}
