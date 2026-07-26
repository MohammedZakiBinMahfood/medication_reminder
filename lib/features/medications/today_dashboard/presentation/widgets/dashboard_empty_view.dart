import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_button.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';

class DashboardEmptyView extends StatelessWidget {
  final VoidCallback onAddMedication;
  final VoidCallback? onExploreApp;

  const DashboardEmptyView({
    super.key,
    required this.onAddMedication,
    this.onExploreApp,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Semantics(
          container: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.medication_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: AppSpacing.xl),
              Semantics(
                header: true,
                child: Text(
                  l10n.dashboardEmptyTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpacing.s),
              Text(
                l10n.dashboardEmptySubtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              CButton(
                text: l10n.addMedication,
                onPressed: onAddMedication,
                icon: const Icon(Icons.add),
              ),
              if (onExploreApp != null) ...[
                const SizedBox(height: AppSpacing.m),
                CButton.text(
                  text: l10n.firstRunExploreApp,
                  onPressed: onExploreApp,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
