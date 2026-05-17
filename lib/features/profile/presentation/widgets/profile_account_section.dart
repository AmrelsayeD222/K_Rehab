import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_state.dart';
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
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final isSubscribed = state is ProfileSuccess && state.user.isSubscribed;
                return CustomMenuCardWidget(
                  icon: Icons.workspace_premium_outlined,
                  title: 'Subscription',
                  trailing: _PremiumActiveLabel(isSubscribed: isSubscribed),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _PremiumActiveLabel extends StatelessWidget {
  final bool isSubscribed;
  const _PremiumActiveLabel({required this.isSubscribed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text(
      isSubscribed ? 'Active' : 'Not Active',
      style: AppTextStyles.tag.copyWith(
        color: isSubscribed ? Colors.green : colors.primary,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
