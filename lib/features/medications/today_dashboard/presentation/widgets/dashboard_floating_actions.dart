import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';

class DashboardFloatingActions extends StatelessWidget {
  final VoidCallback onAddMedication;

  const DashboardFloatingActions({super.key, required this.onAddMedication});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Semantics(
      label: l10n.a11yAddMedication,
      child: FloatingActionButton(
        onPressed: onAddMedication,
        child: const Icon(Icons.add),
      ),
    );
  }
}
