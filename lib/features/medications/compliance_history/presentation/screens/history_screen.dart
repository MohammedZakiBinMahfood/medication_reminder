import 'package:app_platform_core/core.dart';
import 'package:app_platform_state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/notifications/notification_providers.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/shared/components/c_scaffold.dart';
import 'package:medication_reminder/shared/components/c_loading.dart';
import 'package:medication_reminder/shared/components/c_error_view.dart';
import '../../../../profiles/providers/profile_providers.dart';
import '../../providers/providers.dart';
import '../../models/history_state_model.dart';
import '../widgets/history_statistics_card.dart';
import '../widgets/history_filter_bar.dart';
import '../widgets/history_group_header.dart';
import '../widgets/history_list_item.dart';
import 'package:medication_reminder/shared/components/c_empty_view.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final _scrollController = ScrollController();
  TabController? _tabController;
  int _previousProfileCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(historyListProvider.notifier).refresh();

      final manager = ref.read(notificationManagerProvider);
      manager.onAppResumed();
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(historyListProvider.notifier).loadNextPage();
    }
  }

  void _onTabChanged() {
    if (_tabController == null || !_tabController!.indexIsChanging) return;
    final profiles = ref.read(allProfilesProvider).value ?? [];
    final currentFilter = ref.read(historyFilterProvider);

    if (_tabController!.index == 0) {
      if (currentFilter.profileUuid != null) {
        ref.read(historyFilterProvider.notifier).setProfileFilter(null);
        ref.read(historyListProvider.notifier).refresh();
      }
    } else {
      final profile = profiles[_tabController!.index - 1];
      if (currentFilter.profileUuid != profile.uuid) {
        ref.read(historyFilterProvider.notifier).setProfileFilter(profile.uuid);
        ref.read(historyListProvider.notifier).refresh();
      }
    }
  }

  void _syncTabController(List profiles) {
    final tabCount = profiles.length + 1;
    if (_previousProfileCount != tabCount) {
      _previousProfileCount = tabCount;
      final oldIndex = _tabController != null
          ? _tabController!.index.clamp(0, _tabController!.length - 1)
          : 0;
      _tabController?.dispose();
      _tabController = TabController(length: tabCount, vsync: this);
      _tabController!.addListener(_onTabChanged);
      _tabController!.index = oldIndex.clamp(0, tabCount - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(historyListProvider);
    final profilesAsync = ref.watch(allProfilesProvider);
    final profiles = profilesAsync.value ?? [];

    _syncTabController(profiles);

    return CScaffold(
      appBar: AppBar(
        title: Text(l10n.historyTitle),
        actions: [
          Semantics(
            label: l10n.retry,
            child: IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.read(historyListProvider.notifier).refresh();
              },
            ),
          ),
        ],
        bottom: _tabController != null
            ? TabBar(
                controller: _tabController!,
                isScrollable: true,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.primary,
                tabs: [
                  const Tab(text: 'All'),
                  for (final p in profiles) Tab(text: p.name),
                ],
              )
            : null,
      ),
      body: _buildBody(state, l10n),
    );
  }

  Widget _buildBody(BaseState<HistoryStateModel> state, AppLocalizations l10n) {
    if (state.status == LoadStatus.loading) {
      return const CLoading();
    }

    if (state.status == LoadStatus.error) {
      return CErrorView(
        errorMessage: state.error?.errorMessage ?? l10n.historyErrorLoading,
        onRetry: () {
          ref.read(historyListProvider.notifier).refresh();
        },
      );
    }

    final data = state.data;
    if (data == null || data.isEmpty) {
      return CEmptyView(
        icon: Icons.history,
        title: l10n.firstRunEmptyHistoryTitle,
        description: l10n.firstRunEmptyHistoryDescription,
      );
    }

    return Column(
      children: [
        const SizedBox(height: AppSpacing.m),
        HistoryStatisticsCard(statistics: data.statistics),
        const SizedBox(height: AppSpacing.m),
        const HistoryFilterBar(),
        const SizedBox(height: AppSpacing.s),
        Expanded(child: _buildGroupedList(data)),
      ],
    );
  }

  Widget _buildGroupedList(HistoryStateModel data) {
    final itemCount = data.groups.fold<int>(
      0,
      (sum, g) => sum + g.items.length + 1,
    );
    final hasMore = data.isLoadingMore || data.hasNext;

    return ListView.builder(
      controller: _scrollController,
      itemCount: itemCount + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= itemCount) {
          return const Padding(
            padding: EdgeInsets.all(AppSpacing.l),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        var runningIndex = index;
        for (final group in data.groups) {
          if (runningIndex == 0) {
            return HistoryGroupHeader(group: group);
          }
          runningIndex--;

          if (runningIndex < group.items.length) {
            return HistoryListItem(item: group.items[runningIndex]);
          }
          runningIndex -= group.items.length;
        }

        return const SizedBox.shrink();
      },
    );
  }
}
