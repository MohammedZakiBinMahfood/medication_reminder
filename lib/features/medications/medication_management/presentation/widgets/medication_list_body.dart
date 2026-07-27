import 'package:app_platform_core/core.dart';
import 'package:app_platform_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_empty_view.dart';
import '../../../../../shared/components/c_error_view.dart';
import '../../../../../shared/navigation/c_navigator.dart';
import '../../models/medication_list_model.dart';
import '../../providers/providers.dart';
import '../screens/medication_form_screen.dart';
import 'medication_card.dart';
import 'medication_search_bar.dart';

class MedicationListBody extends ConsumerWidget {
  final ScrollController scrollController;

  const MedicationListBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(medicationListProvider);
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        const MedicationSearchBar(),
        Expanded(
          child: AsyncView<Paginated<MedicationListModel>>(
            status: listState.status,
            data: listState.data,
            error: listState.error,
            onLoading: (_) => const Center(child: CircularProgressIndicator()),
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
                  controller: scrollController,
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
    );
  }
}
