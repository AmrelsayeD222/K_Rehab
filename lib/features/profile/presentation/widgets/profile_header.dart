import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_image/profile_image_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/user_info/user_info_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/user_info/user_info_state.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (context.mounted) {
        context.read<ProfileImageCubit>().uploadProfileImage(File(image.path));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAvatar(context),
        const SizedBox(height: 16),
        BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state) {
            String displayedName = '';
            if (state is UserInfoLoading) {
              return const SizedBox();
            } else if (state is UserInfoLoaded) {
              displayedName = state.userName;
            } else if (state is UserInfoError) {
              displayedName = 'User';
            }
            return Text(displayedName, style: AppTextStyles.heading1);
          },
        ),
        const SizedBox(height: 8),
        _buildPremiumBadge(),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 2.5),
            gradient: const LinearGradient(
              colors: [Color(0xFF1C212B), Color(0xFF2A3142)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
            builder: (context, state) {
              if (state is ProfileImageLoading) {
                return const KLoadingWidget();
              }

              if (state is ProfileImageLoaded) {
                if (state.localImage != null) {
                  return CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: FileImage(state.localImage!),
                  );
                } else if (state.imageUrl != null) {
                  return CachedNetworkImage(
                    imageUrl: state.imageUrl!,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: imageProvider,
                    ),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.person_rounded,
                        size: 52,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  );
                }
              }

              return const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.person_rounded,
                  size: 52,
                  color: AppColors.textSecondary,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              _pickImage(context);
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.background, width: 2),
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

  Widget _buildPremiumBadge() {
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
          color: Color(0xFF5BA8FF),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
