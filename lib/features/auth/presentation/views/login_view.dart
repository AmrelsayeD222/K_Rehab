import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';

import 'package:k_rehab/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_header.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_social_section.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_toggle_row.dart';
import 'package:k_rehab/features/auth/presentation/widgets/login_auth_form.dart';
import 'package:k_rehab/core/widgets/k_snack_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          KSnackBar.show(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return Stack(
          children: [
            Scaffold(
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
                              subtitle:
                                  'Login to continue your recovery journey',
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
                              text: 'Login with Google',
                              googleIconPath: AssetPaths.googleLogo,
                              onGooglePressed: () async {
                                await loginCubit.signInWithGoogle();
                              },
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
            ),
            if (isLoading)
              Container(
                color: Colors.black.withValues(alpha: 0.5),
                child: Center(child: KLoadingWidget()),
              ),
          ],
        );
      },
    );
  }
}
