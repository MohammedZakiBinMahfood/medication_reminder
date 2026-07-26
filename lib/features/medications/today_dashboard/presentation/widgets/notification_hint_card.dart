import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/providers/first_run_provider.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_card.dart';

class NotificationHintCard extends ConsumerWidget {
  const NotificationHintCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final firstRun = ref.watch(firstRunProvider);

    if (!firstRun.shouldShowNotificationHint) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: CCard(
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            Icon(
              Icons.notifications_active_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 28,
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
                      l10n.firstRunNotificationHintTitle,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    l10n.firstRunNotificationHintDescription,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                          Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 20),
              tooltip: l10n.firstRunDismiss,
              onPressed: () {
                ref.read(firstRunProvider.notifier).dismissNotificationHint();
              },
            ),
          ],
        ),
      ),
    );
  }
}
