import 'package:educatly/ui/themes/ui_color.dart';
import 'package:flutter/material.dart';

TextTheme primaryTextTheme = const TextTheme(
  displayLarge: TextStyle(
    fontSize: 72.0,
    fontFamily: 'Inter',
    inherit: true,
  ),
  displayMedium: TextStyle(
    fontSize: 60.0,
    fontFamily: 'Inter',
    inherit: true,
  ),
  displaySmall: TextStyle(
    fontSize: 48.0,
    fontFamily: 'Inter',
    inherit: true,
  ),
  headlineLarge: TextStyle(
    fontSize: 36.0,
    fontFamily: 'Inter',
    inherit: true,
  ),
  headlineMedium: TextStyle(
    fontSize: 24.0,
    fontFamily: 'Inter',
    inherit: true,
  ),
  headlineSmall: TextStyle(
    fontSize: 20.0,
    fontFamily: 'Inter',
    inherit: true,
  ),
  titleLarge: TextStyle(
    fontSize: 16.0,
    fontFamily: 'Inter',
    inherit: true,
  ),
  titleMedium: TextStyle(
    fontSize: 12.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    inherit: true,
  ),
  bodyLarge: TextStyle(
    fontSize: 12.0,
    letterSpacing: 2,
    color: UIColor.kGray,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    inherit: true,
  ),
  bodyMedium: TextStyle(
    fontSize: 14.0,
    letterSpacing: 1,
    color: UIColor.kWhite,
    fontFamily: 'Inter',
    inherit: true,
  ),
  bodySmall: TextStyle(
    fontSize: 10.0,
    letterSpacing: 1,
    color: UIColor.kGray,
    fontFamily: 'Inter',
    inherit: true,
  ),
  labelLarge: TextStyle(
    fontSize: 14.0,
    fontFamily: 'Inter',
    letterSpacing: 2,
    color: UIColor.kPrimary,
    fontWeight: FontWeight.w900,
    inherit: true,
  ),
  labelSmall: TextStyle(
    fontSize: 10.0,
    fontFamily: 'Inter',
    inherit: true,
  ),
);

extension TextThemeExtension on BuildContext {
  // * (default) TextTheme
  TextStyle? get h1 => Theme.of(this).textTheme.displayLarge;
  TextStyle? get h2 => Theme.of(this).textTheme.displayMedium;
  TextStyle? get h3 => Theme.of(this).textTheme.displaySmall;
  TextStyle? get h4 => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get h5 => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get h6 => Theme.of(this).textTheme.titleLarge;

  TextStyle? get sub1 => Theme.of(this).textTheme.titleMedium;
  TextStyle? get sub2 => Theme.of(this).textTheme.titleSmall;

  TextStyle? get body1 => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get body2 => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get button => Theme.of(this).textTheme.labelLarge;

  TextStyle? get errorText => Theme.of(this)
      .textTheme
      .labelLarge!
      .copyWith(color: Colors.red, fontSize: 10);
}
