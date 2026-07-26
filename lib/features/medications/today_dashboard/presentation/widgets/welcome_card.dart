import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/providers/first_run_provider.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_button.dart';

class WelcomeCard extends ConsumerWidget {
  final VoidCallback onExploreApp;

  const WelcomeCard({super.key, required this.onExploreApp});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final firstRun = ref.watch(firstRunProvider);

    if (!firstRun.shouldShowWelcome) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Card(
        color: AppColors.primary.withValues(alpha: 0.08),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Row(
            children: [
              Icon(
                Icons.waving_hand,
                color: AppColors.primary,
                size: 32,
              ),
              const SizedBox(width: AppSpacing.m),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(
                        l10n.firstRunWelcomeTitle,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      l10n.firstRunWelcomeDescription,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s),
                    Row(
                      children: [
                        CButton.text(
                          text: l10n.firstRunExploreApp,
                          onPressed: () {
                            ref.read(firstRunProvider.notifier).dismissWelcome();
                            onExploreApp();
                          },
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        CButton.text(
                          text: l10n.firstRunDismiss,
                          onPressed: () {
                            ref.read(firstRunProvider.notifier).dismissWelcome();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
