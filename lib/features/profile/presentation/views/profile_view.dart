import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';

import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_state.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_account_section.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_app_settings_section.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_header.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_logout_button.dart';
import 'package:k_rehab/features/profile/presentation/widgets/profile_premium_card.dart';

import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/core/widgets/k_snack_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutSuccess) {
          context.go(AppRouter.login);
        } else if (state is ProfileFailure) {
          KSnackBar.show(context, message: state.error);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: KLoadingWidget());
              }

              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 28),
                          const ProfileHeader(),
                          const SizedBox(height: 32),
                          if (state is ProfileSuccess &&
                              !state.user.isSubscribed) ...[
                            const ProfilePremiumCard(),
                            const SizedBox(height: 32),
                          ],
                          const ProfileAccountSection(),
                          const SizedBox(height: 24),
                          const ProfileAppSettingsSection(),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          ProfileLogoutButton(),
                          SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
