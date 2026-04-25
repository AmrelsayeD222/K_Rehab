import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColorsExtension.dark.primary,
      scaffoldBackgroundColor: AppColorsExtension.dark.background,
      cardColor: AppColorsExtension.dark.cardBackground,
      colorScheme: ColorScheme.dark(
        primary: AppColorsExtension.dark.primary,
        secondary: AppColorsExtension.dark.primary,
        surface: AppColorsExtension.dark.cardBackground,
        onPrimary: Colors.black,
        onSurface: AppColorsExtension.dark.textPrimary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColorsExtension.dark.cardBackground,
        selectedItemColor: AppColorsExtension.dark.primary,
        unselectedItemColor: AppColorsExtension.dark.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      fontFamily: 'Inter',
      useMaterial3: true,
      extensions: const [AppColorsExtension.dark],
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColorsExtension.light.primary,
      scaffoldBackgroundColor: AppColorsExtension.light.background,
      cardColor: AppColorsExtension.light.cardBackground,
      colorScheme: ColorScheme.light(
        primary: AppColorsExtension.light.primary,
        secondary: AppColorsExtension.light.primary,
        surface: AppColorsExtension.light.cardBackground,
        onPrimary: Colors.white,
        onSurface: AppColorsExtension.light.textPrimary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColorsExtension.light.cardBackground,
        selectedItemColor: AppColorsExtension.light.primary,
        unselectedItemColor: AppColorsExtension.light.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      fontFamily: 'Inter',
      useMaterial3: true,
      extensions: const [AppColorsExtension.light],
    );
  }
}
