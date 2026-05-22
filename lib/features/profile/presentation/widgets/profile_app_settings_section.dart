import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/theme/theme_cubit.dart';

import 'package:k_rehab/features/profile/presentation/widgets/custom_menu_card_widget.dart';

import 'package:k_rehab/features/profile/presentation/widgets/profile_section_card.dart';

import 'package:k_rehab/features/profile/presentation/widgets/profile_section_title.dart';

import 'package:k_rehab/features/profile/presentation/widgets/profile_segmented_toggle.dart';

class ProfileAppSettingsSection extends StatelessWidget {
  const ProfileAppSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSectionTitle(title: 'APP SETTINGS'),
        ProfileSectionCard(
          children: [
            CustomMenuCardWidget(
              icon:
                  isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              title: 'Theme',
              trailing: ProfileSegmentedToggle(
                options: const ['Dark', 'Light'],
                initialIndex: isDark ? 0 : 1,
                onChanged: (index) =>
                    context.read<ThemeCubit>().toggleTheme(index == 0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
