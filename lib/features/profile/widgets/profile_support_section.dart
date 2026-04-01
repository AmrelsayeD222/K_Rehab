import 'package:flutter/material.dart';
import 'package:k_rehab/features/profile/widgets/custom_menu_card_widget.dart';
import 'package:k_rehab/features/profile/widgets/profile_section_card.dart';
import 'package:k_rehab/features/profile/widgets/profile_section_title.dart';

class ProfileSupportSection extends StatelessWidget {
  const ProfileSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSectionTitle(title: 'SUPPORT'),
        ProfileSectionCard(
          children: [
            CustomMenuCardWidget(
              icon: Icons.help_outline_rounded,
              title: 'Help & Support',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64, endIndent: 16),
            CustomMenuCardWidget(
              icon: Icons.star_border_rounded,
              title: 'Rate KRehab',
              iconColor: const Color(0xFFFFD700),
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64, endIndent: 16),
            CustomMenuCardWidget(
              icon: Icons.description_outlined,
              title: 'Terms of Service',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64, endIndent: 16),
            CustomMenuCardWidget(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
