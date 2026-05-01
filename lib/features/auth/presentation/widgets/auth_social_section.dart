import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

import 'package:k_rehab/features/auth/presentation/widgets/social_auth_button.dart';

class AuthSocialSection extends StatelessWidget {
  const AuthSocialSection({
    super.key,
    required this.googleIconPath,
    required this.onGooglePressed,
    required this.text,
  });

  final String googleIconPath;

  final VoidCallback onGooglePressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: colors.onSurfaceVariant)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'OR',
                style: AppTextStyles.caption.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
            Expanded(child: Divider(color: colors.onSurfaceVariant)),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialAuthButton(
              text: text,
              iconPath: googleIconPath,
              onPressed: onGooglePressed,
            ),
            const SizedBox(width: 24),
          ],
        ),
      ],
    );
  }
}
