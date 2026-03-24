import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/auth/logic/create_user/create_user_cubit.dart';
import 'package:k_rehab/features/auth/logic/register/register_cubit.dart';

import 'package:k_rehab/features/auth/presentation/widgets/auth_header.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_social_section.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_toggle_row.dart';
import 'package:k_rehab/features/auth/presentation/widgets/signup_auth_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return BlocListener<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        if (state is CreateUserSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account Created Successfully!')),
          );
          context.go(AppRouter.home);
        } else if (state is CreateUserFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: registerCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AuthHeader(
                        iconPath: AssetPaths.signupIcon,
                        title: 'Create Account',
                        subtitle: 'Start your personalized recovery today',
                        topSpacing: 50,
                        bottomSpacing: 40,
                      )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.1, curve: Curves.easeOut),
                  SignupFormSection(
                        onSignupPressed: () {
                          if (registerCubit.formKey.currentState!.validate()) {
                            registerCubit.signUp();
                          }
                        },
                      )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 100.ms)
                      .slideY(begin: 0.1, curve: Curves.easeOut),
                  const SizedBox(height: 32),
                  AuthSocialSection(
                        googleIconPath: AssetPaths.googleLogo,
                        appleIconPath: AssetPaths.appleLogo,
                        onGooglePressed: () {},
                        onApplePressed: () {},
                      )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 180.ms)
                      .slideY(begin: 0.1, curve: Curves.easeOut),
                  const SizedBox(height: 40),
                  AuthToggleRow(
                        label: 'Already have an account? ',
                        actionText: 'Login',
                        onActionTap: () => context.go(AppRouter.login),
                      )
                      .animate()
                      .fadeIn(duration: 350.ms, delay: 250.ms)
                      .slideY(begin: 0.1, curve: Curves.easeOut),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
