import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_state.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

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

        return Column(
          children: [
            _ProfileAvatar(state: state, user: user),
            const SizedBox(height: 16),
            Text(
              user?.name ?? '...',
              style: AppTextStyles.heading1.copyWith(color: colors.onSurface),
            ),
            const SizedBox(height: 8),
            const _PremiumBadge(),
          ],
        );
      },
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  final ProfileState state;
  final UserModel? user;

  const _ProfileAvatar({required this.state, this.user});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (context.mounted) {
        context.read<ProfileCubit>().uploadProfileImage(File(image.path));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colors.primary, width: 2.5),
            color: Theme.of(context).cardColor,
          ),
          child: state is ProfileImageUploading
              ? const KLoadingWidget()
              : _AvatarContent(user: user),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => _pickImage(context),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: colors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
              ),
              child: const Icon(
                Icons.camera_alt_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AvatarContent extends StatelessWidget {
  final UserModel? user;

  const _AvatarContent({this.user});

  @override
  Widget build(BuildContext context) {
    final avatarUrl = user?.profileImageUrl;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: avatarUrl,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.person_rounded,
            size: 52,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Icon(
        Icons.person_rounded,
        size: 52,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _PremiumBadge extends StatelessWidget {
  const _PremiumBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF0A4FBF).withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF007AFF).withValues(alpha: 0.6),
        ),
      ),
      child: Text(
        'PREMIUM MEMBER',
        style: AppTextStyles.tag.copyWith(
          color: const Color(0xFF5BA8FF),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
