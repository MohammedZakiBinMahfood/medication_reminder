import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/design_system/spacing/app_spacing.dart';
import '../../../../profiles/models/profile_model.dart';
import '../../../../profiles/providers/profile_providers.dart';
import '../../../../profiles/repositories/profile_repository.dart';
import '../../providers/dashboard_list_notifier.dart';
import '../screens/profile_management_screen.dart';
import 'package:medication_reminder/shared/navigation/c_navigator.dart';

class ProfileSwitcher extends ConsumerWidget {
  const ProfileSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilesAsync = ref.watch(allProfilesProvider);
    final activeUuidAsync = ref.watch(activeProfileUuidProvider);

    return profilesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (profiles) {
        final activeUuid = activeUuidAsync.value ?? '';

        return SizedBox(
          height: 64,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
            itemCount: profiles.length + 1,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              if (index == profiles.length) {
                return _AddProfileButton(
                  onTap: () => CNavigator.push(
                    const ProfileManagementScreen(),
                  ),
                );
              }
              final profile = profiles[index];
              final isActive = profile.uuid == activeUuid;
              return _ProfileAvatar(
                profile: profile,
                isActive: isActive,
                onTap: () => _switchProfile(ref, profile.uuid),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _switchProfile(WidgetRef ref, String uuid) async {
    final repo = ref.read(profileRepositoryProvider);
    await repo.setActiveProfile(uuid);
    ref.invalidate(activeProfileUuidProvider);
    ref.invalidate(allProfilesProvider);
    ref.invalidate(dashboardListProvider);
  }
}

class _ProfileAvatar extends StatelessWidget {
  final ProfileModel profile;
  final bool isActive;
  final VoidCallback onTap;

  const _ProfileAvatar({
    required this.profile,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(
      int.parse(profile.color.replaceFirst('#', '0xFF')),
    );

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isActive ? color : color.withValues(alpha: 0.3),
              shape: BoxShape.circle,
              border: isActive
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.5,
                    )
                  : null,
            ),
            child: Icon(
              IconData(profile.avatarIconCodePoint, fontFamily: 'MaterialIcons'),
              color: isActive ? Colors.white : color,
              size: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            profile.name,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _AddProfileButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddProfileButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
            ),
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Add',
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
