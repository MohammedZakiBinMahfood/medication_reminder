import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'version_check_result.dart';
import 'version_providers.dart';

class UpdateDialog extends ConsumerWidget {
  final VersionCheckResult result;

  const UpdateDialog({super.key, required this.result});

  static void show(BuildContext context, WidgetRef ref, VersionCheckResult result) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) => UpdateDialog(result: result),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return AlertDialog(
      icon: Icon(
        Icons.system_update,
        size: 48,
        color: theme.colorScheme.primary,
      ),
      title: Text(
        l10n.settingsUpdateAvailable,
        textAlign: TextAlign.center,
        style: theme.textTheme.titleLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${l10n.settingsVersion}: ${result.latestVersion}',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${l10n.settingsUpdateCurrentVersion}: ${result.currentVersion}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.settingsUpdateLater),
        ),
        FilledButton(
          onPressed: () async {
            Navigator.pop(context);
            final url = Uri.parse(
              'https://play.google.com/store/apps/details?id=com.example.medication_reminder',
            );
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          },
          child: Text(l10n.settingsUpdateNow),
        ),
      ],
    );
  }
}

class UpdateCheckLoadingDialog {
  static void show(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const _UpdateCheckLoading(),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class _UpdateCheckLoading extends StatelessWidget {
  const _UpdateCheckLoading();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      icon: const CircularProgressIndicator(),
      title: Text(l10n.settingsUpdateChecking),
    );
  }
}

void checkForUpdateAndNotify(BuildContext context, WidgetRef ref) async {
  final l10n = AppLocalizations.of(context);

  UpdateCheckLoadingDialog.show(context);

  final result = await ref.read(updateCheckProvider.future);

  if (context.mounted) {
    UpdateCheckLoadingDialog.hide(context);
  }

  if (!context.mounted) return;

  if (result.errorMessage == 'not_published') {
    CSnackbar.info(context, l10n.settingsUpdateNotPublished);
    return;
  }

  if (result.errorMessage != null) {
    CSnackbar.error(context, l10n.settingsUpdateError);
    return;
  }

  if (result.hasUpdate) {
    UpdateDialog.show(context, ref, result);
  } else {
    CSnackbar.info(context, l10n.settingsUpdateUpToDate);
  }
}
