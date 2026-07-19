import 'dart:async';

import 'package:app_platform_core/core.dart';
import 'package:app_platform_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_app_bar.dart';
import '../../../../../shared/components/c_empty_view.dart';
import '../../../../../shared/components/c_error_view.dart';
import '../../../../../shared/components/c_scaffold.dart';
import '../../../../../shared/components/c_text_field.dart';
import '../../../../../shared/navigation/c_navigator.dart';
import '../../models/medication_list_model.dart';
import '../../providers/providers.dart';
import '../widgets/medication_card.dart';
import 'medication_form_screen.dart';

class MedicationListScreen extends ConsumerStatefulWidget {
  const MedicationListScreen({super.key});

  @override
  ConsumerState<MedicationListScreen> createState() =>
      _MedicationListScreenState();
}

class _MedicationListScreenState extends ConsumerState<MedicationListScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(medicationListProvider.notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final listState = ref.watch(medicationListProvider);
    final l10n = AppLocalizations.of(context);

    return CScaffold(
      appBar: CAppBar(
        title: l10n.medications,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => CNavigator.push(const MedicationFormScreen()),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: CTextField(
              controller: _searchController,
              hintText: l10n.searchMedications,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        ref
                            .read(medicationFiltersProvider.notifier)
                            .setSearchQuery(null);
                      },
                    )
                  : null,
              onChanged: (value) {
                _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 300), () {
                  ref
                      .read(medicationFiltersProvider.notifier)
                      .setSearchQuery(value.isEmpty ? null : value);
                  setState(() {});
                });
              },
            ),
          ),
          Expanded(
            child: AsyncView<Paginated<MedicationListModel>>(
              status: listState.status,
              data: listState.data,
              error: listState.error,
              onLoading: (_) =>
                  const Center(child: CircularProgressIndicator()),
              onError: (context, error) => CErrorView(
                errorMessage: error.errorMessage,
                onRetry: () =>
                    ref.read(medicationListProvider.notifier).loadFirstPage(),
              ),
              onEmpty: (_) => CEmptyView(
                icon: Icons.medication_outlined,
                title: l10n.medications,
                description: l10n.noMedicationsFound,
                actionLabel: l10n.addMedication,
                onAction: () => CNavigator.push(const MedicationFormScreen()),
              ),
              onSuccess: (context, paginated) {
                if (paginated.items.isEmpty) {
                  return CEmptyView(
                    icon: Icons.search_off,
                    title: l10n.noResultsFound,
                    description: l10n.dashboardNoFilterResults,
                  );
                }
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(medicationListProvider.notifier).refresh(),
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount:
                        paginated.items.length +
                        (paginated.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == paginated.items.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final medication = paginated.items[index];
                      return MedicationCard(
                        medication: medication,
                        onTap: () => CNavigator.push(
                          MedicationFormScreen(medicationId: medication.id),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
