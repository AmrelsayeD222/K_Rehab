import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/constants/asset_paths.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/features/auth/presentation/views/login_view.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_header.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_social_section.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_toggle_row.dart';
import 'package:k_rehab/features/onboarding/presentation/widgets/onboarding_button.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
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
                      iconPath: AssetPaths.signupIcon,
                      title: 'Create Account',
                      subtitle: 'Start your personalized recovery today',
                      topSpacing: 50,
                      bottomSpacing: 40,
                    )
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.1, curve: Curves.easeOut),
                _SignupFormSection(
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      onSignupPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Signup logic placeholder
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
                      onActionTap: () => Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, _, _) => const LoginView(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      ),
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

class _SignupFormSection extends StatelessWidget {
  const _SignupFormSection({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSignupPressed,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSignupPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthTextField(
          controller: nameController,
          hintText: 'Full Name',
          validator: (value) =>
              (value == null || value.isEmpty) ? 'Name is required' : null,
        ),
        const SizedBox(height: 16),
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
        const SizedBox(height: 32),
        OnboardingButton(text: 'Sign Up', onPressed: onSignupPressed),
      ],
    );
  }
}
