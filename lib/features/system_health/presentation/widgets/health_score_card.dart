import 'package:flutter/material.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/shared/components/c_button.dart';
import '../../providers/providers.dart';

class HealthScoreCard extends StatelessWidget {
  final SystemHealthState healthState;
  final VoidCallback onRefresh;

  const HealthScoreCard({
    super.key,
    required this.healthState,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final score = healthState.score;
    final label = healthState.overallHealthLabel;
    final failedCount = healthState.failedCount;
    final passedCount = healthState.passedCount;

    final (scoreColor, scoreIcon) = switch (label) {
      'excellent' => (AppColors.success, Icons.check_circle),
      'good' => (AppColors.info, Icons.info),
      'needsAttention' => (AppColors.warning, Icons.warning),
      'critical' => (AppColors.error, Icons.error),
      _ => (Colors.grey, Icons.help_outline),
    };

    final scoreLabel = switch (label) {
      'excellent' => 'Excellent',
      'good' => 'Good',
      'needsAttention' => 'Needs Attention',
      'critical' => 'Critical',
      _ => 'Unknown',
    };

    return CCard(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Semantics(
        container: true,
        header: true,
        label: 'Overall health: $scoreLabel',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(scoreIcon, color: scoreColor, size: 32),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        scoreLabel,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: scoreColor,
                            ),
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        '$passedCount passed, $failedCount failed',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Semantics(
                  label: 'Score: ${(score * 100).round()} percent',
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: score,
                          strokeWidth: 5,
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceContainerHighest,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(scoreColor),
                        ),
                        Center(
                          child: Text(
                            '${(score * 100).round()}%',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.m),
            SizedBox(
              width: double.infinity,
              child: CButton.outlined(
                text: 'Refresh',
                onPressed: onRefresh,
                icon: const Icon(Icons.refresh, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
