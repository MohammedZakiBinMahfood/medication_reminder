import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_button.dart';

class CompletionCelebrationDialog extends StatefulWidget {
  const CompletionCelebrationDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const CompletionCelebrationDialog(),
    );
  }

  @override
  State<CompletionCelebrationDialog> createState() =>
      _CompletionCelebrationDialogState();
}

class _CompletionCelebrationDialogState
    extends State<CompletionCelebrationDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _ConfettiPainter(progress: _controller.value),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.emoji_events_rounded,
                    size: 48,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.celebrationTitle,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.celebrationSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CButton(
                  text: l10n.confirm,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfettiParticle {
  final Color color;
  final double x;
  final double speedY;
  final double size;
  final double rotationSpeed;

  _ConfettiParticle({
    required this.color,
    required this.x,
    required this.speedY,
    required this.size,
    required this.rotationSpeed,
  });
}

class _ConfettiPainter extends CustomPainter {
  final double progress;
  final List<_ConfettiParticle> particles;

  _ConfettiPainter({required this.progress})
    : particles = List.generate(40, (index) {
        final random = Random(index);
        final colors = [
          const Color(0xFF4F46E5),
          const Color(0xFF10B981),
          const Color(0xFFF59E0B),
          const Color(0xFFEC4899),
          const Color(0xFF8B5CF6),
        ];
        return _ConfettiParticle(
          color: colors[random.nextInt(colors.length)],
          x: random.nextDouble(),
          speedY: 0.5 + random.nextDouble() * 0.8,
          size: 6 + random.nextDouble() * 6,
          rotationSpeed: (random.nextDouble() - 0.5) * 4,
        );
      });

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final y = ((progress * p.speedY) % 1.0) * size.height;
      final x = p.x * size.width;
      final paint = Paint()
        ..color = p.color.withValues(alpha: 1.0 - progress * 0.3);

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(progress * p.rotationSpeed * pi);
      canvas.drawRect(
        Rect.fromCenter(
          center: Offset.zero,
          width: p.size,
          height: p.size * 0.6,
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
