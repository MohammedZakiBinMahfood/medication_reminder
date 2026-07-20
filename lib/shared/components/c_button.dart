import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final bool isText;
  final Widget? icon;
  final String? semanticsLabel;

  const CButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.semanticsLabel,
  }) : isOutlined = false,
       isText = false;

  const CButton.outlined({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.semanticsLabel,
  }) : isOutlined = true,
       isText = false;

  const CButton.text({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.semanticsLabel,
  }) : isOutlined = false,
       isText = true;

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? Semantics(
            label: 'Loading',
            child: const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          )
        : icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [icon!, const SizedBox(width: 8), Text(text)],
          )
        : Text(text);

    final button = () {
      if (isText) {
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      }
      if (isOutlined) {
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      }
      return ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: child,
      );
    }();

    if (semanticsLabel != null) {
      return Semantics(label: semanticsLabel, child: button);
    }
    return button;
  }
}
