import 'package:educatly/ui/themes/buttons_theme.dart';
import 'package:educatly/ui/themes/input_decoration_theme.dart';
import 'package:educatly/ui/themes/text_theme.dart';
import 'package:educatly/ui/themes/ui_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final Color _lightFocusColor = Colors.white.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(
    lightColorScheme,
    _lightFocusColor,
  );

  static ThemeData darkThemeData = themeData(
    darkColorScheme,
    _darkFocusColor,
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.black,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: UIColor.kPrimary,
    secondary: UIColor.kSecondry,
    surface: UIColor.kBackground,
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      inputDecorationTheme: MyInputDecorationTheme().myInputDecorationTheme(),
      appBarTheme: const AppBarTheme(color: UIColor.kBackground),
      textTheme: primaryTextTheme,
      primaryTextTheme: primaryTextTheme,
      elevatedButtonTheme: ButtonsTheme.elevatedButtonTheme,
      outlinedButtonTheme: ButtonsTheme.outlinedButtonTheme,
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      datePickerTheme: DatePickerThemeData(
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: UIColor.kWhite, // Cancel button text color
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: UIColor.kSecondry, // Confirm button text color
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: UIColor.kWhite, // Cancel button text color
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: UIColor.kSecondry, // Confirm button text color
        ),
      ),
    );
  }
}
