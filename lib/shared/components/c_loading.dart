import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';

class CLoading extends StatelessWidget {
  final String? message;

  const CLoading({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            label: l10n.a11yLoading,
            child: const CircularProgressIndicator(),
          ),
          if (message != null) ...[const SizedBox(height: 16), Text(message!)],
        ],
      ),
    );
  }
}
