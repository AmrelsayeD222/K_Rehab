import 'package:flutter/material.dart';
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
              icon: Icons.workspace_premium_outlined,
              title: 'Subscription',
              trailing: const _PremiumActiveLabel(),
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
      'Not Active',
      style: AppTextStyles.tag.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
