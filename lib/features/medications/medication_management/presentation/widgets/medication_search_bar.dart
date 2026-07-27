import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_text_field.dart';
import '../../providers/providers.dart';

class MedicationSearchBar extends ConsumerStatefulWidget {
  const MedicationSearchBar({super.key});

  @override
  ConsumerState<MedicationSearchBar> createState() =>
      _MedicationSearchBarState();
}

class _MedicationSearchBarState extends ConsumerState<MedicationSearchBar> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
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
                  setState(() {});
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
    );
  }
}
