import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_reminder/l10n/app_localizations.dart';
import 'package:medication_reminder/shared/components/c_scaffold.dart';
import 'package:medication_reminder/shared/components/c_card.dart';
import 'package:medication_reminder/shared/components/c_snackbar.dart';
import 'package:medication_reminder/shared/components/c_dialog.dart';
import 'package:medication_reminder/core/design_system/spacing/app_spacing.dart';
import 'package:medication_reminder/core/design_system/colors/app_colors.dart';
import '../../models/backup_enums.dart';
import '../../providers/providers.dart';

class BackupScreen extends ConsumerWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(backupProvider);
    final notifier = ref.read(backupProvider.notifier);

    return CScaffold(
      appBar: AppBar(title: Text(l10n.settingsBackup)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.l),
        children: [
          _buildExportSection(context, ref, state, notifier, l10n),
          const SizedBox(height: AppSpacing.l),
          _buildImportSection(context, ref, state, notifier, l10n),
          const SizedBox(height: AppSpacing.l),
          _buildModeSection(context, state, notifier, l10n),
          const SizedBox(height: AppSpacing.l),
          _buildInfoSection(context, state, l10n),
        ],
      ),
    );
  }

  Widget _buildExportSection(
    BuildContext context,
    WidgetRef ref,
    state,
    notifier,
    AppLocalizations l10n,
  ) {
    return CCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.backupExportTitle,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            l10n.backupExportDesc,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.m),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: state.isExporting
                      ? null
                      : () => notifier.exportBackup(),
                  icon: const Icon(Icons.save_alt),
                  label: Text(l10n.backupSaveToDevice),
                ),
              ),
              const SizedBox(width: AppSpacing.s),
              IconButton.filled(
                onPressed: state.isExporting
                    ? null
                    : () => notifier.shareBackup(),
                icon: state.isExporting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImportSection(
    BuildContext context,
    WidgetRef ref,
    state,
    notifier,
    AppLocalizations l10n,
  ) {
    return CCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.backupImportTitle,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            l10n.backupImportDesc,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.m),

          // Pick file button
          OutlinedButton.icon(
            onPressed: state.isImporting
                ? null
                : () => notifier.pickAndValidateFile(),
            icon: const Icon(Icons.file_open),
            label: Text(l10n.backupChooseFile),
          ),

          // Validation result
          if (state.validationResult != null) ...[
            const SizedBox(height: AppSpacing.m),
            _buildValidationInfo(context, state.validationResult!, l10n),

            if (state.validationResult!.isValid) ...[
              const SizedBox(height: AppSpacing.m),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: state.isImporting
                      ? null
                      : () => _confirmRestore(context, notifier, l10n),
                  icon: state.isImporting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.restore),
                  label: Text(l10n.backupRestoreNow),
                ),
              ),
              if (state.validationResult!.error != null) ...[
                const SizedBox(height: AppSpacing.s),
                Text(
                  state.validationResult!.error!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.error),
                ),
              ],
            ],
          ],

          if (state.error != null) ...[
            const SizedBox(height: AppSpacing.s),
            Text(
              state.error!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.error),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildValidationInfo(
    BuildContext context,
    validationResult,
    AppLocalizations l10n,
  ) {
    final meta = validationResult.metadata;
    if (!validationResult.isValid) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.s),
        decoration: BoxDecoration(
          color: AppColors.error.withAlpha(25),
          borderRadius: BorderRadius.circular(AppSpacing.s),
        ),
        child: Row(
          children: [
            const Icon(Icons.error, color: AppColors.error, size: 20),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: Text(
                validationResult.error ?? l10n.backupInvalidFile,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.error),
              ),
            ),
          ],
        ),
      );
    }

    if (meta == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.s),
      decoration: BoxDecoration(
        color: AppColors.success.withAlpha(25),
        borderRadius: BorderRadius.circular(AppSpacing.s),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.s),
              Text(
                l10n.backupValidFile,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          _metaRow(context, l10n.backupVersion, meta.appVersion),
          _metaRow(context, l10n.backupDevice, meta.deviceModel),
          _metaRow(context, l10n.backupExported, meta.exportedAt),
          _metaRow(
            context,
            l10n.backupMedicationsCount,
            '${meta.medicationCount}',
          ),
          _metaRow(context, l10n.backupDoseLogsCount, '${meta.doseLogCount}'),
          if (meta.hasSettings)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xxs),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 14,
                    color: AppColors.success,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      l10n.backupIncludesSettings,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: AppColors.success),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _metaRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xxs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$label: ',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildModeSection(
    BuildContext context,
    state,
    notifier,
    AppLocalizations l10n,
  ) {
    return CCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.backupRestoreMode,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            l10n.backupRestoreModeDesc,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.s),
          _buildModeOption(
            context,
            l10n.backupModeMerge,
            l10n.backupModeMergeDesc,
            BackupRestoreMode.merge,
            state.restoreMode,
            () => notifier.setRestoreMode(BackupRestoreMode.merge),
          ),
          const SizedBox(height: AppSpacing.xs),
          _buildModeOption(
            context,
            l10n.backupModeReplace,
            l10n.backupModeReplaceDesc,
            BackupRestoreMode.replace,
            state.restoreMode,
            () => notifier.setRestoreMode(BackupRestoreMode.replace),
          ),
        ],
      ),
    );
  }

  Widget _buildModeOption(
    BuildContext context,
    String title,
    String description,
    BackupRestoreMode mode,
    BackupRestoreMode currentMode,
    VoidCallback onTap,
  ) {
    final isSelected = mode == currentMode;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.s),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.s),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.s),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Radio<BackupRestoreMode>(
              value: mode,
              groupValue: currentMode,
              onChanged: (_) => onTap(),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, state, AppLocalizations l10n) {
    final lastBackup = state.lastBackup;
    if (lastBackup == null) return const SizedBox.shrink();

    return CCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.backupLastExport,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.s),
          _metaRow(
            context,
            l10n.backupMedicationsCount,
            '${state.medicationCount}',
          ),
          _metaRow(
            context,
            l10n.backupSchedulesCount,
            '${state.scheduleCount}',
          ),
          _metaRow(context, l10n.backupDoseLogsCount, '${state.doseLogCount}'),
        ],
      ),
    );
  }

  void _confirmRestore(
    BuildContext context,
    notifier,
    AppLocalizations l10n,
  ) async {
    final confirmed = await CDialog.confirm(
      context: context,
      title: l10n.backupRestoreConfirmTitle,
      content: l10n.backupRestoreConfirmDesc,
      confirmText: l10n.backupRestoreNow,
      cancelText: l10n.cancel,
      isDestructive: true,
    );

    if (confirmed == true) {
      await notifier.restoreFromSelectedFile();
      if (context.mounted) {
        CSnackbar.success(context, l10n.backupRestoreSuccess);
      }
    }
  }
}
