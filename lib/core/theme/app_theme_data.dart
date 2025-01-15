import 'package:flutter/material.dart';
import 'package:st_task/core/theme/app_text_theme.dart';

class AppThemData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(
    lightColorScheme,
    _lightFocusColor,
  );

  static ThemeData darkThemeData = themeData(
    darkColorScheme,
    _darkFocusColor,
  );

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      textTheme: AppTextThemeData.textThemeData,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFE94057),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFD4C4FC),
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF22172A),
    onSurfaceVariant: Color(0xFF838383),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFFFAFBFB),
    surfaceContainer: Color(0xFF27272d),
    surfaceContainerHigh: Color(0xFF009b61),
    surfaceDim: Color.fromARGB(255, 207, 248, 221),
    surfaceTint: Color.fromARGB(255, 249, 239, 153),
    surfaceBright: Color.fromARGB(255, 121, 122, 123),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFE94057),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFD4C4FC),
    onSecondary: Colors.white,
    surface: Color(0xFF101114),
    onSurface: Color(0xFF22172A),
    onSurfaceVariant: Color(0xFF838383),
    surfaceContainer: Color(0xFF27272d),
    error: Colors.redAccent,
    onError: Colors.white,
    surfaceContainerHigh: Color(0xFF009b61),
    surfaceDim: Color.fromARGB(255, 207, 248, 221),
    surfaceTint: Color.fromARGB(255, 249, 239, 153),
    surfaceBright: Color.fromARGB(255, 121, 122, 123),
    brightness: Brightness.dark,
  );
}
