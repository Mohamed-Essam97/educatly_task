import 'package:educatly/app_router.dart';
import 'package:educatly/ui/themes/ui_color.dart';
import 'package:flutter/material.dart';

class MyInputDecorationTheme {
  // A method that returns InputDecorationTheme to pass it to the inputDecorationTheme
  // property of the ThemeData Class  in main.dart

  final navigatorContext = navigatorKey.currentState?.context;

  InputDecorationTheme myInputDecorationTheme() => InputDecorationTheme(
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        disabledBorder: _underlineInputBorder(UIColor.kSecondry),
        enabledBorder: _underlineInputBorder(UIColor.kSecondry),
        focusedBorder: _underlineInputBorder(UIColor.kSecondry),
        errorBorder: _underlineInputBorder(Colors.red),
        focusedErrorBorder: _underlineInputBorder(Colors.orangeAccent),
        errorStyle: _buildTextStyle(Colors.red),
      );

  UnderlineInputBorder _underlineInputBorder(Color color) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );

  OutlineInputBorder outLineInputBorder(Color color) => OutlineInputBorder(
          borderSide: BorderSide(
        color: color,
        width: 1.0,
      ));

  TextStyle _buildTextStyle(Color color, {double fontSize = 16}) => TextStyle(
        color: color,
        fontSize: fontSize,
      );
}
