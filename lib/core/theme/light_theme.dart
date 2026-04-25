import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimary,
  scaffoldBackgroundColor: AppColors.lightBackground,
  cardColor: AppColors.lightSurface,
  colorScheme: const ColorScheme.light(
    primary: AppColors.lightPrimary,
    primaryContainer: AppColors.lightPrimaryVariant,
    secondary: AppColors.lightSecondary,
    secondaryContainer: AppColors.lightSecondaryVariant,
    surface: AppColors.lightSurface,
    error: AppColors.lightError,
    onPrimary: AppColors.lightOnPrimary,
    onSecondary: AppColors.lightOnSecondary,
    onSurface: AppColors.lightOnSurface,
    onError: AppColors.lightOnError,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightPrimary,
    foregroundColor: AppColors.lightOnPrimary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.lightPrimary,
    foregroundColor: AppColors.lightOnPrimary,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.lightSurface,
    selectedItemColor: AppColors.lightPrimary,
    unselectedItemColor: Color(0xFF4A5568),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),
  fontFamily: 'Inter',
  useMaterial3: true,
);
