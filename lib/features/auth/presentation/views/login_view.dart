import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_header.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_social_section.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_toggle_row.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:k_rehab/features/auth/presentation/views/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
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
                _LoginFormSection(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      onLoginPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Login logic placeholder
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
                const SizedBox(height: 48),
                AuthToggleRow(
                      label: "Don't have an account? ",
                      actionText: 'Sign Up',
                      onActionTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, _, _) => const SignupView(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
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

class _LoginFormSection extends StatelessWidget {
  const _LoginFormSection({
    required this.emailController,
    required this.passwordController,
    required this.onLoginPressed,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthTextField(
          controller: emailController,
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          validator: (value) =>
              (value == null || !value.contains('@')) ? 'Invalid email' : null,
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: passwordController,
          hintText: 'Password',
          isPassword: true,
          validator: (value) =>
              (value == null || value.length < 6) ? 'Password too short' : null,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.bodyText2.copyWith(color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(height: 32),
        OnboardingButton(text: 'Login', onPressed: onLoginPressed),
      ],
    );
  }
}
