import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const String fontFamily = 'Inter';

  // Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 26,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle sectionHeader = TextStyle(
    fontSize: 18,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mainHeading = TextStyle(
    fontSize: 24,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.6,
  );

  // Card Styles
  static const TextStyle cardTitle = TextStyle(
    fontSize: 15,
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 11,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );

  // Onboarding
  static const TextStyle onboardingTitle = TextStyle(
    fontSize: 28,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const TextStyle onboardingSubtitle = TextStyle(
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
    fontSize: 16,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontFamily: fontFamily,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(
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
