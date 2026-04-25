import 'package:flutter/material.dart';
import 'package:k_rehab/core/theme/dark_theme.dart';
import 'package:k_rehab/core/theme/light_theme.dart';

abstract class AppThemes {
  static ThemeData getLightTheme() => lightTheme;
  static ThemeData getDarkTheme() => darkTheme;
}
