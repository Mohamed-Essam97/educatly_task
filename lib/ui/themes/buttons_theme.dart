import 'package:educatly/ui/themes/ui_color.dart';
import 'package:flutter/material.dart';

class ButtonsTheme {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      shadowColor: UIColor.kWhite,
      minimumSize: const Size(double.infinity, 10.0),
      backgroundColor: UIColor.kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: UIColor.kWhite, width: 1.0),
      minimumSize: const Size(double.infinity, 10.0),
      disabledForegroundColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
    ),
  );
}
