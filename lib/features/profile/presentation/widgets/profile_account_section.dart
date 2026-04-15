import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/profile/presentation/widgets/custom_menu_card_widget.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_section_card.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_section_title.dart';

class ProfileAccountSection extends StatelessWidget {
  const ProfileAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileSectionTitle(title: 'MY ACCOUNT'),
        ProfileSectionCard(
          children: [
            CustomMenuCardWidget(
              icon: Icons.person_outline_rounded,
              title: 'Personal Information',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64, endIndent: 16),
            CustomMenuCardWidget(
              icon: Icons.lock_outline_rounded,
              title: 'Change Password',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64, endIndent: 16),
            CustomMenuCardWidget(
              icon: Icons.workspace_premium_outlined,
              title: 'Subscription',
              trailing: const _PremiumActiveLabel(),
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64, endIndent: 16),
            CustomMenuCardWidget(
              icon: Icons.payment_outlined,
              title: 'Payment Methods',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _PremiumActiveLabel extends StatelessWidget {
  const _PremiumActiveLabel();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Active',
      style: AppTextStyles.tag.copyWith(
        color: AppColors.primary,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
