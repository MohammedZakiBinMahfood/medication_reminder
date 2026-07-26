import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/c_app_bar.dart';
import '../../../../../shared/components/c_scaffold.dart';
import '../../../../../shared/components/c_snackbar.dart';
import '../../../../profiles/models/profile_model.dart';
import '../../../../profiles/providers/profile_providers.dart';
import '../../../../profiles/repositories/profile_repository.dart';
import '../../providers/dashboard_list_notifier.dart';

class ProfileManagementScreen extends ConsumerStatefulWidget {
  const ProfileManagementScreen({super.key});

  @override
  ConsumerState<ProfileManagementScreen> createState() =>
      _ProfileManagementScreenState();
}

class _ProfileManagementScreenState
    extends ConsumerState<ProfileManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final profilesAsync = ref.watch(allProfilesProvider);
    final activeUuidAsync = ref.watch(activeProfileUuidProvider);
    final l10n = AppLocalizations.of(context);

    return CScaffold(
      appBar: CAppBar(title: l10n.settingsProfiles),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditDialog(context),
        child: const Icon(Icons.add),
      ),
      body: profilesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (profiles) {
          final activeUuid = activeUuidAsync.value ?? '';
          if (profiles.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person_add,
                    size: 64,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.settingsProfiles,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap + to add a profile',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 88),
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final profile = profiles[index];
              final isActive = profile.uuid == activeUuid;
              final color = Color(
                int.parse(profile.color.replaceFirst('#', '0xFF')),
              );

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: isActive
                      ? color
                      : color.withValues(alpha: 0.3),
                  child: Icon(
                    IconData(
                      profile.avatarIconCodePoint,
                      fontFamily: 'MaterialIcons',
                    ),
                    color: isActive ? Colors.white : color,
                  ),
                ),
                title: Text(profile.name),
                subtitle: isActive
                    ? Text(
                        'Active',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : null,
                trailing: PopupMenuButton<String>(
                  onSelected: (value) => _handleAction(
                    context,
                    value,
                    profile,
                  ),
                  itemBuilder: (context) => [
                    if (!isActive)
                      PopupMenuItem(
                        value: 'switch',
                        child: Row(
                          children: [
                            const Icon(Icons.swap_horiz, size: 20),
                            const SizedBox(width: 8),
                            Text(l10n.settingsProfiles),
                          ],
                        ),
                      ),
                    if (!profile.isDefault)
                      PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            const Icon(Icons.edit, size: 20),
                            const SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                    if (!profile.isDefault)
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 20,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Delete',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                onTap: isActive
                    ? null
                    : () => _switchProfile(profile.uuid),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _switchProfile(String uuid) async {
    final repo = ref.read(profileRepositoryProvider);
    await repo.setActiveProfile(uuid);
    ref.invalidate(activeProfileUuidProvider);
    ref.invalidate(allProfilesProvider);
    ref.invalidate(dashboardListProvider);
    if (mounted) {
      CSnackbar.success(context, 'Profile switched');
    }
  }

  void _handleAction(BuildContext context, String action, ProfileModel profile) {
    switch (action) {
      case 'switch':
        _switchProfile(profile.uuid);
      case 'edit':
        _showAddEditDialog(context, profile: profile);
      case 'delete':
        _showDeleteConfirmation(context, profile);
    }
  }

  void _showAddEditDialog(BuildContext context, {ProfileModel? profile}) {
    final nameController = TextEditingController(text: profile?.name ?? '');
    String selectedColor = profile?.color ?? '#4F46E5';
    int selectedIconCodePoint =
        profile?.avatarIconCodePoint ?? Icons.person.codePoint;

    final colorOptions = [
      '#4F46E5',
      '#10B981',
      '#F59E0B',
      '#EF4444',
      '#8B5CF6',
      '#EC4899',
      '#06B6D4',
    ];

    final iconOptions = [
      Icons.person,
      Icons.person_2,
      Icons.child_care,
      Icons.elderly,
      Icons.pets,
      Icons.favorite,
      Icons.star,
    ];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(profile != null ? 'Edit Profile' : 'Add Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'e.g., Mom, Dad, Child',
                ),
                autofocus: true,
              ),
              const SizedBox(height: 16),
              const Text('Color'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: colorOptions.map((hex) {
                  final color = Color(
                    int.parse(hex.replaceFirst('#', '0xFF')),
                  );
                  final isSelected = selectedColor == hex;
                  return GestureDetector(
                    onTap: () => setDialogState(() => selectedColor = hex),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSurface,
                                width: 2.5,
                              )
                            : null,
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text('Icon'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: iconOptions.map((icon) {
                  final isSelected = selectedIconCodePoint == icon.codePoint;
                  return GestureDetector(
                    onTap: () => setDialogState(
                      () => selectedIconCodePoint = icon.codePoint,
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                        border: isSelected
                            ? Border.all(
                                color:
                                    Theme.of(context).colorScheme.primary,
                                width: 1.5,
                              )
                            : null,
                      ),
                      child: Icon(
                        icon,
                        size: 20,
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final name = nameController.text.trim();
                if (name.isEmpty) return;
                Navigator.pop(context);
                _saveProfile(
                  name: name,
                  color: selectedColor,
                  iconCodePoint: selectedIconCodePoint,
                  existing: profile,
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveProfile({
    required String name,
    required String color,
    required int iconCodePoint,
    ProfileModel? existing,
  }) async {
    final repo = ref.read(profileRepositoryProvider);

    if (existing != null) {
      final updated = ProfileModel(
        uuid: existing.uuid,
        name: name,
        color: color,
        avatarIconCodePoint: iconCodePoint,
        isDefault: existing.isDefault,
        sortOrder: existing.sortOrder,
        createdAt: existing.createdAt,
        updatedAt: DateTime.now(),
      );
      await repo.updateProfile(updated);
    } else {
      await repo.createProfile(
        name: name,
        color: color,
        avatarIconCodePoint: iconCodePoint,
      );
    }

    ref.invalidate(allProfilesProvider);
    ref.invalidate(activeProfileUuidProvider);
  }

  void _showDeleteConfirmation(BuildContext context, ProfileModel profile) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Profile'),
        content: Text(
          'Are you sure you want to delete "${profile.name}"? '
          'All medications in this profile will be permanently removed.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () async {
              Navigator.pop(context);
              final repo = ref.read(profileRepositoryProvider);
              await repo.deleteProfile(profile.uuid);
              ref.invalidate(allProfilesProvider);
              ref.invalidate(activeProfileUuidProvider);
              if (mounted) {
                CSnackbar.success(context, 'Profile deleted');
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
