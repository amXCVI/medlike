import 'package:flutter/material.dart';
import 'package:medlike/themes/web_light_theme.dart';

import 'light_theme.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightAppTheme = lightTheme;
  static final ThemeData lightWebTheme = webLightTheme;
  static final ThemeData darkAppTheme = ThemeData();
}
