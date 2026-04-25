import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/services/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeKey = 'is_dark_mode';

  ThemeCubit() : super(_loadSavedTheme());

  static ThemeMode _loadSavedTheme() {
    final isDark = CacheHelper.getData(key: _themeKey) as bool?;
    return (isDark ?? true) ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final isDark = state == ThemeMode.dark;
    CacheHelper.saveData(key: _themeKey, value: !isDark);
    emit(isDark ? ThemeMode.light : ThemeMode.dark);
  }

  bool get isDark => state == ThemeMode.dark;
}
