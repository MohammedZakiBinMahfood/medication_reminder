import 'package:flutter/material.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_loading.dart';

class HistoryLoadingView extends StatelessWidget {
  const HistoryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CLoading(message: l10n.historyLoading);
  }
}
