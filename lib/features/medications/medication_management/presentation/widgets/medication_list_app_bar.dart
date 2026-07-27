import 'package:flutter/material.dart';
import '../../../../../core/design_system/colors/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/navigation/c_navigator.dart';
import '../../../../profiles/models/profile_model.dart';
import '../screens/medication_form_screen.dart';

class MedicationListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final TabController? tabController;
  final List<ProfileModel> profiles;

  const MedicationListAppBar({
    super.key,
    required this.tabController,
    required this.profiles,
  });

  @override
  Size get preferredSize {
    final double bottomHeight = tabController != null ? kTextTabBarHeight : 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.medications),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => CNavigator.push(const MedicationFormScreen()),
        ),
      ],
      bottom: tabController != null
          ? TabBar(
              controller: tabController!,
              isScrollable: true,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              tabs: [
                const Tab(text: 'All'),
                for (final p in profiles) Tab(text: p.name),
              ],
            )
          : null,
    );
  }
}
