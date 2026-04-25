import 'package:flutter/material.dart';

// Theme-aware color extension
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.background,
    required this.primary,
    required this.cardBackground,
    required this.featuredCardBackground,
    required this.textPrimary,
    required this.textLight,
    required this.textSecondary,
    required this.textMuted,
    required this.textDark,
  });

  final Color background;
  final Color primary;
  final Color cardBackground;
  final Color featuredCardBackground;
  final Color textPrimary;
  final Color textLight;
  final Color textSecondary;
  final Color textMuted;
  final Color textDark;

  static const AppColorsExtension dark = AppColorsExtension(
    background: Color(0xFF111111),
    primary: Color(0xFF00D2B4),
    cardBackground: Color(0xFF1C212B),
    featuredCardBackground: Color(0xFF2a5051),
    textPrimary: Color(0xFFFFFFFF),
    textLight: Color(0xFFF0F4FF),
    textSecondary: Color(0xFF8B9BB4),
    textMuted: Color(0xFF4A5568),
    textDark: Color(0xFF111318),
  );

  static const AppColorsExtension light = AppColorsExtension(
    background: Color(0xFFF5F7FA),
    primary: Color(0xFF00B89E),
    cardBackground: Color(0xFFFFFFFF),
    featuredCardBackground: Color(0xFF00B89E),
    textPrimary: Color(0xFF111318),
    textLight: Color(0xFF1A2233),
    textSecondary: Color(0xFF4A5568),
    textMuted: Color(0xFF8B9BB4),
    textDark: Color(0xFF111318),
  );

  @override
  AppColorsExtension copyWith({
    Color? background,
    Color? primary,
    Color? cardBackground,
    Color? featuredCardBackground,
    Color? textPrimary,
    Color? textLight,
    Color? textSecondary,
    Color? textMuted,
    Color? textDark,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      primary: primary ?? this.primary,
      cardBackground: cardBackground ?? this.cardBackground,
      featuredCardBackground:
          featuredCardBackground ?? this.featuredCardBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textLight: textLight ?? this.textLight,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      textDark: textDark ?? this.textDark,
    );
  }

  @override
  AppColorsExtension lerp(AppColorsExtension? other, double t) {
    if (other == null) return this;
    return AppColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      featuredCardBackground: Color.lerp(
        featuredCardBackground,
        other.featuredCardBackground,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textLight: Color.lerp(textLight, other.textLight, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textDark: Color.lerp(textDark, other.textDark, t)!,
    );
  }
}

extension AppColorsX on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
