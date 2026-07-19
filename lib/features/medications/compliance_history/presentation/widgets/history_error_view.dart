import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_error_view.dart';

class HistoryErrorView extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onRetry;

  const HistoryErrorView({super.key, this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CErrorView(
      errorMessage: errorMessage ?? l10n.historyErrorLoading,
      onRetry: onRetry,
    );
  }
}
