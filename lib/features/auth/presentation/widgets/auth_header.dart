import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.topSpacing = 40,
    this.bottomSpacing = 40,
  });

  final String iconPath;
  final String title;
  final String subtitle;
  final double topSpacing;
  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: topSpacing),
        SvgPicture.asset(iconPath, height: 80),
        const SizedBox(height: 32),
        Text(
          title,
          style: AppTextStyles.onboardingTitle.copyWith(color: colors.textPrimary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: AppTextStyles.onboardingSubtitle.copyWith(color: colors.textMuted),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: bottomSpacing),
      ],
    );
  }
}
