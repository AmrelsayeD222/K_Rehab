import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/auth/presentation/widgets/social_auth_button.dart';

class AuthSocialSection extends StatelessWidget {
  const AuthSocialSection({
    super.key,
    required this.googleIconPath,
    required this.appleIconPath,
    required this.onGooglePressed,
    required this.onApplePressed,
  });

  final String googleIconPath;
  final String appleIconPath;
  final VoidCallback onGooglePressed;
  final VoidCallback onApplePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(color: AppColors.textMuted),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('OR', style: AppTextStyles.caption),
            ),
            const Expanded(
              child: Divider(color: AppColors.textMuted),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialAuthButton(
              iconPath: googleIconPath,
              onPressed: onGooglePressed,
            ),
            const SizedBox(width: 24),
            SocialAuthButton(
              iconPath: appleIconPath,
              color: AppColors.textPrimary,
              onPressed: onApplePressed,
            ),
          ],
        ),
      ],
    );
  }
}

