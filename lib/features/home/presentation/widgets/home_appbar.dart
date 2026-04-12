import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_image/profile_image_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/user_info/user_info_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/user_info/user_info_state.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              final name = state is UserInfoLoaded ? state.userName : '';
              return Text(
                name.isNotEmpty ? 'Hey, $name 👋' : 'Welcome 👋',
                style: AppTextStyles.heading2.copyWith(fontSize: 22),
              ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1);
            },
          ),
          BlocBuilder<ProfileImageCubit, ProfileImageState>(
            builder: (context, state) {
              ImageProvider? imageProvider;
              if (state is ProfileImageLoaded) {
                if (state.localImage != null) {
                  imageProvider = FileImage(state.localImage!);
                } else if (state.imageUrl != null) {
                  imageProvider = CachedNetworkImageProvider(state.imageUrl!);
                }
              }

              return CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary.withValues(alpha: .3),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.cardBackground,
                  backgroundImage: imageProvider,
                  child: imageProvider == null
                      ? const Icon(
                              Icons.person_2_rounded,
                              color: AppColors.textPrimary,
                              size: 26,
                            )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .scale(begin: const Offset(0.8, 0.8))
                      : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
