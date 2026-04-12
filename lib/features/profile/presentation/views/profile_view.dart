import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

import 'package:k_rehab/features/profile/presentation/manager/logout/log_out_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_image/profile_image_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/user_info/user_info_cubit.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_account_section.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_app_settings_section.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_header.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_logout_button.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_support_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LogOutCubit>()),
        BlocProvider(
          create: (context) => getIt<ProfileImageCubit>()..getProfileImage(),
        ),
        BlocProvider(
          create: (context) => getIt<UserInfoCubit>()..getUserInfo(),
        ),
      ],
      child: BlocListener<LogOutCubit, LogOutState>(
        listener: (context, state) {
          if (state is LogOutSuccess) {
            context.go(AppRouter.login);
          } else if (state is LogOutFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 28),
                  Center(child: ProfileHeader()),
                  SizedBox(height: 32),
                  ProfileAccountSection(),
                  SizedBox(height: 24),
                  ProfileAppSettingsSection(),
                  SizedBox(height: 24),
                  ProfileSupportSection(),
                  SizedBox(height: 32),
                  ProfileLogoutButton(),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
