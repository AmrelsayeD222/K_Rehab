import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_state.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _HomeWelcomeText(),
          _HomeProfileAvatar(),
        ],
      ),
    );
  }
}

class _HomeWelcomeText extends StatelessWidget {
  const _HomeWelcomeText();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        String name = '';
        if (state is ProfileSuccess) {
          name = state.user.name;
        } else if (state is ProfileImageUploading) {
          name = state.user.name;
        }

        return Text(
          name.isNotEmpty ? 'Hey, $name 👋' : 'Welcome 👋',
          style: AppTextStyles.heading2.copyWith(
            fontSize: 22,
            color: colors.onSurface,
          ),
        ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1);
      },
    );
  }
}

class _HomeProfileAvatar extends StatelessWidget {
  const _HomeProfileAvatar();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        UserModel? user;
        if (state is ProfileSuccess) {
          user = state.user;
        } else if (state is ProfileImageUploading) {
          user = state.user;
        }

        final imageUrl = user?.profileImageUrl;
        final hasImage = imageUrl != null && imageUrl.isNotEmpty;

        return CircleAvatar(
          radius: 24,
          backgroundColor: colors.primary.withValues(alpha: .3),
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Theme.of(context).cardColor,
            child: hasImage
                ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Icon(
                        Icons.person_2_rounded,
                        color: colors.onSurface,
                        size: 26,
                      ),
                      errorWidget: (_, __, ___) => Icon(
                        Icons.person_2_rounded,
                        color: colors.onSurface,
                        size: 26,
                      ),
                    ),
                  )
                : Icon(
                    Icons.person_2_rounded,
                    color: colors.onSurface,
                    size: 26,
                  )
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .scale(begin: const Offset(0.8, 0.8)),
          ),
        );
      },
    );
  }
}
