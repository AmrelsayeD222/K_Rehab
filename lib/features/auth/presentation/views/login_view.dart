import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_header.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_social_section.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_toggle_row.dart';
import 'package:k_rehab/features/auth/presentation/widgets/login_auth_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: loginCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthHeader(
                      iconPath: AssetPaths.loginIcon,
                      title: 'Welcome Back',
                      subtitle: 'Login to continue your recovery journey',
                      topSpacing: 50,
                      bottomSpacing: 48,
                    )
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.1, curve: Curves.easeOut),
                const LoginFormSection()
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
                const SizedBox(height: 48),
                AuthToggleRow(
                      label: "Don't have an account? ",
                      actionText: 'Sign Up',
                      onActionTap: () {
                        context.go(AppRouter.signup);
                      },
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
    );
  }
}
