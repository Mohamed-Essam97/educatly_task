import 'package:educatly/logic/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';

class SettingsState {
  String locale = 'en';
  ThemeCubit? theme;
  String appVersion = '';
  String buildNumber = '';

  TextDirection get textDirection =>
      locale == 'ar' ? TextDirection.rtl : TextDirection.ltr;

  SettingsState copyWith({
    String? locale,
    String? theme,
    String? appVersion,
    String? buildNumber,
  }) {
    return SettingsState()
      ..locale = locale ?? this.locale
      ..appVersion = appVersion ?? this.appVersion
      ..buildNumber = buildNumber ?? this.buildNumber;
  }
}
