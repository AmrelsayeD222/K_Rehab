import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/profile/presentation/widgets/custom_menu_card_widget.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_section_card.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_segmented_toggle.dart';

class ProfileAppSettingsSection extends StatelessWidget {
  const ProfileAppSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSectionTitle(title: 'APP SETTINGS'),
        ProfileSectionCard(
          children: [
            CustomMenuCardWidget(
              icon: Icons.language_rounded,
              title: 'Language',
              trailing: const ProfileSegmentedToggle(
                options: ['AR', 'EN'],
                initialIndex: 1,
              ),
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64, endIndent: 16),
            CustomMenuCardWidget(
              icon: Icons.dark_mode_outlined,
              title: 'Theme',
              trailing: const ProfileSegmentedToggle(
                options: ['Dark', 'Light'],
                initialIndex: 0,
              ),
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64, endIndent: 16),
            const CustomMenuCardWidget(
              icon: Icons.notifications_none_rounded,
              title: 'Notifications',
              trailing: _NotificationToggle(),
            ),
          ],
        ),
      ],
    );
  }
}

class _NotificationToggle extends StatefulWidget {
  const _NotificationToggle();

  @override
  State<_NotificationToggle> createState() => _NotificationToggleState();
}

class _NotificationToggleState extends State<_NotificationToggle> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _enabled,
      onChanged: (val) => setState(() => _enabled = val),
      activeThumbColor: AppColors.primary,
      activeTrackColor: AppColors.primary.withValues(alpha: 0.25),
      inactiveThumbColor: AppColors.textSecondary,
      inactiveTrackColor: AppColors.textSecondary.withValues(alpha: 0.15),
    );
  }
}
