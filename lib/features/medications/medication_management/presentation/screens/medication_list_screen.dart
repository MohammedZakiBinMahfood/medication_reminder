import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/components/c_scaffold.dart';
import '../../../../profiles/providers/profile_providers.dart';
import '../../providers/providers.dart';
import '../widgets/medication_list_app_bar.dart';
import '../widgets/medication_list_body.dart';

class MedicationListScreen extends ConsumerStatefulWidget {
  const MedicationListScreen({super.key});

  @override
  ConsumerState<MedicationListScreen> createState() =>
      _MedicationListScreenState();
}

class _MedicationListScreenState extends ConsumerState<MedicationListScreen>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  TabController? _tabController;
  int _previousProfileCount = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(medicationListProvider.notifier).loadNextPage();
    }
  }

  void _onTabChanged() {
    if (_tabController == null || !_tabController!.indexIsChanging) return;
    final profiles = ref.read(allProfilesProvider).value ?? [];
    final notifier = ref.read(medicationListProvider.notifier);

    if (_tabController!.index == 0) {
      // "All" — show medications from all profiles
      notifier.setShowAllProfiles(true);
    } else {
      // Specific profile — switch active profile and filter
      final profile = profiles[_tabController!.index - 1];
      ref.read(profileRepositoryProvider).setActiveProfile(profile.uuid);
      notifier.setShowAllProfiles(false);
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
    final profilesAsync = ref.watch(allProfilesProvider);
    final profiles = profilesAsync.value ?? [];

    _syncTabController(profiles);

    return CScaffold(
      appBar: MedicationListAppBar(
        tabController: _tabController,
        profiles: profiles,
      ),
      body: MedicationListBody(scrollController: _scrollController),
    );
  }
}
