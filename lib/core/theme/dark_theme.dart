import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkPrimary,
  scaffoldBackgroundColor: AppColors.darkBackground,
  cardColor: AppColors.darkSurface,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.darkPrimary,
    primaryContainer: AppColors.darkPrimaryVariant,
    secondary: AppColors.darkSecondary,
    secondaryContainer: AppColors.darkSecondaryVariant,
    surface: AppColors.darkSurface,
    error: AppColors.darkError,
    onPrimary: AppColors.darkOnPrimary,
    onSecondary: AppColors.darkOnSecondary,
    onSurface: AppColors.darkOnSurface,
    onError: AppColors.darkOnError,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: AppColors.darkOnPrimary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: AppColors.darkOnPrimary,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkSurface,
    selectedItemColor: AppColors.darkPrimary,
    unselectedItemColor: Color(0xFF8B9BB4),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),
  fontFamily: 'Inter',
  useMaterial3: true,
);
