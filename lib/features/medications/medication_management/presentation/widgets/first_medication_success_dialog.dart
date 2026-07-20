import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/providers/first_run_provider.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_button.dart';
import 'package:medication_reminder/shared/navigation/c_navigator.dart';

class FirstMedicationSuccessDialog extends ConsumerWidget {
  const FirstMedicationSuccessDialog({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    final firstRun = ref.read(firstRunProvider);
    if (firstRun.firstMedicationAdded) return;

    await ref.read(firstRunProvider.notifier).markFirstMedicationAdded();

    if (!context.mounted) return;

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const FirstMedicationSuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      icon: Semantics(
        label: l10n.firstRunSuccessTitle,
        child: Icon(
          Icons.check_circle,
          size: 64,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(
        l10n.firstRunSuccessTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      content: Text(
        l10n.firstRunSuccessDescription,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: CButton(
            text: l10n.firstRunSuccessContinue,
            onPressed: () {
              CNavigator.pop();
            },
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.fromLTRB(
        AppSpacing.l,
        AppSpacing.s,
        AppSpacing.l,
        AppSpacing.l,
      ),
    );
  }
}
