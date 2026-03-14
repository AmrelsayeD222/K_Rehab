import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

abstract class AppTextStyles {
  // Disclaimer & General Headings
  static const TextStyle heading1 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading2 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // Onboarding Main Texts
  static const TextStyle onboardingTitle = TextStyle(
    color: AppColors.textLight,
    fontSize: 28,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const TextStyle onboardingSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  // Features List Texts
  static const TextStyle featureItemTitle = TextStyle(
    color: AppColors.textLight,
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 1.43,
  );

  // Action Buttons
  static const TextStyle buttonText = TextStyle(
    color: AppColors.textDark,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Body Texts
  static const TextStyle bodyText1 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
  );

  static const TextStyle bodyText2 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(
    color: AppColors.textMuted,
    fontSize: 11,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 1.50,
  );
}
