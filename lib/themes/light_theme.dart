import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

const lightBackgroundColor = Color(0xFFECECEC);

final lightTheme = ThemeData(
  backgroundColor: Colors.red,
  scaffoldBackgroundColor: Colors.green,
  typography: Typography.material2021(),
  textTheme: const TextTheme(
    displayLarge: TextStyle(),
    displayMedium: TextStyle(),
    displaySmall: TextStyle(),
    headlineLarge: TextStyle(),
    headlineMedium: TextStyle(
      /// Заголовок вверху экрана
      fontFamily: 'Muller',
      fontSize: 20.0,
      height: 1.1,
      color: AppColors.mainText,
    ),
    headlineSmall: TextStyle(),
    titleLarge: TextStyle(),
    titleMedium: TextStyle(),
    titleSmall: TextStyle(),
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(),
    bodySmall: TextStyle(
      /// Мелкий текст на экранах
      fontFamily: 'Muller',
      fontSize: 14.0,
      height: 1.14,
      color: AppColors.mainText,
    ),
    labelLarge: TextStyle(
      /// Тексе в инпутах
      fontFamily: 'Muller',
      fontSize: 17.0,
      height: 1.18,
      letterSpacing: 0.14872,
      color: AppColors.mainText,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Muller',
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.139972,
      color: AppColors.mainText,
    ),
    labelSmall: TextStyle(),
  ),
);
