import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

abstract class AppTextStyles {
  static const String fontFamily = 'Inter';

  // Headings
  static const TextStyle heading1 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 26,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading2 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle sectionHeader = TextStyle(
    color: AppColors.textLight,
    fontSize: 18,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mainHeading = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.6,
  );

  // Card Styles
  static const TextStyle cardTitle = TextStyle(
    color: AppColors.textLight,
    fontSize: 15,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 11,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );

  // Onboarding
  static const TextStyle onboardingTitle = TextStyle(
    color: AppColors.textLight,
    fontSize: 28,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const TextStyle onboardingSubtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );

  // Specific Elements
  static const TextStyle tag = TextStyle(
    fontSize: 10,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonText = TextStyle(
    color: AppColors.textDark,
    fontSize: 18,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle navLabel = TextStyle(
    fontSize: 12,
    fontFamily: fontFamily,
  );

  // Body Texts
  static const TextStyle bodyText1 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyText2 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontFamily: fontFamily,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(
    color: AppColors.textMuted,
    fontSize: 11,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    height: 1.50,
  );

  static const TextStyle error = TextStyle(
    color: Colors.red,
    fontSize: 14,
    fontFamily: fontFamily,
  );
}
