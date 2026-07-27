import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/providers/first_run_provider.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';

class WelcomeCard extends ConsumerWidget {
  final VoidCallback onExploreApp;

  const WelcomeCard({super.key, required this.onExploreApp});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final firstRun = ref.watch(firstRunProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (!firstRun.shouldShowWelcome) {
      return const SizedBox.shrink();
    }

    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? Theme.of(context).colorScheme.surfaceContainerHigh
              : const Color(0xFFF2F0FF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark
                ? Theme.of(context).colorScheme.outlineVariant
                : const Color(0xFFE8E5FF),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: isDark ? 0.1 : 0.05),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: isRtl ? 8 : null,
              right: isRtl ? null : 8,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: isDark
                      ? Theme.of(context).colorScheme.onSurfaceVariant
                      : const Color(0xFF64748B),
                ),
                tooltip: l10n.firstRunDismiss,
                onPressed: () {
                  ref.read(firstRunProvider.notifier).dismissWelcome();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                l10n.firstRunWelcomeTitle,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: isDark
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.onSurface
                                          : const Color(0xFF0F172A),
                                      fontSize: 19,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text('👋', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.firstRunWelcomeDescription,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: isDark
                                    ? Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant
                                    : const Color(0xFF64748B),
                                height: 1.45,
                                fontSize: 13,
                              ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            ref
                                .read(firstRunProvider.notifier)
                                .dismissWelcome();
                            onExploreApp();
                          },
                          child: Text(
                            l10n.firstRunExploreApp,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Image.asset(
                          'assets/images/welcome_pill_3d.png',
                          fit: BoxFit.contain,
                          height: 110,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
