import 'package:flutter/material.dart';
import '../../core/design_system/spacing/app_spacing.dart';

class CCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? color;

  const CCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.l),
    this.margin,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      margin: margin,
      color: color,
      child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
    );

    if (onTap != null) {
      return Semantics(
        button: true,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: card,
        ),
      );
    }

    return card;
  }
}
