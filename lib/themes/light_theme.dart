import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

const lightBackgroundColor = Color(0xFFECECEC);

final lightTheme = ThemeData(
  backgroundColor: AppColors.mainAppBackground,
  scaffoldBackgroundColor: AppColors.mainAppBackground,
  typography: Typography.material2021(),
  /// Typography
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
    titleMedium: TextStyle(
      /// Пункты меню
      fontFamily: 'Muller',
      fontSize: 16.0,
      height: 1.25,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.3,
      color: AppColors.mainText,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Muller',
      fontSize: 17.0,
      height: 1.18,
      fontWeight: FontWeight.w500,
      color: AppColors.mainText
    ),
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
  /// Colors
  primaryColor: AppColors.mainBrandColor,
  primaryColorLight: AppColors.mainBrandSecond,
  primaryColorDark: AppColors.darkGreenFirst,
  // focusColor: AppColors.
  hoverColor: AppColors.circleBgSecond,
  // shadowColor: AppColors.
  // canvasColor: AppColors.
  // scaffoldBackgroundColor: AppColors.
  // bottomAppBarColor: AppColors.
  // cardColor: AppColors.
  dividerColor: AppColors.mainSeparatorAlpha,
  highlightColor: AppColors.lightText, /// !
  // splashColor: AppColors.
  // selectedRowColor: AppColors.
  // unselectedWidgetColor: AppColors.
  // disabledColor: AppColors.
  // secondaryHeaderColor: AppColors.
  // backgroundColor: AppColors.
  // dialogBackgroundColor: AppColors.
  // indicatorColor: AppColors.
  // hintColor: AppColors.
  // errorColor: AppColors.
  // toggleableActiveColor: AppColors.
);
