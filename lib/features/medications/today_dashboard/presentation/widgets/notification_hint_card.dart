import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/providers/first_run_provider.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';

class NotificationHintCard extends ConsumerWidget {
  const NotificationHintCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final firstRun = ref.watch(firstRunProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (!firstRun.shouldShowNotificationHint) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? Theme.of(context).colorScheme.surfaceContainerHigh
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isDark
                ? Theme.of(context).colorScheme.outlineVariant
                : const Color(0xFFE2E8F0),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.close,
                size: 20,
                color: isDark
                    ? Theme.of(context).colorScheme.onSurfaceVariant
                    : const Color(0xFF94A3B8),
              ),
              tooltip: l10n.firstRunDismiss,
              onPressed: () {
                ref.read(firstRunProvider.notifier).dismissNotificationHint();
              },
            ),
            const SizedBox(width: 8),
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
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: isDark
                            ? Theme.of(context).colorScheme.onSurface
                            : const Color(0xFF0F172A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.firstRunNotificationHintDescription,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : const Color(0xFF64748B),
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF4F46E5).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_active_rounded,
                color: Color(0xFF4F46E5),
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
