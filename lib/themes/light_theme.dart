import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

const lightBackgroundColor = Color(0xFFECECEC);

final lightTheme = ThemeData(
  // typography: Typography.material2021(),

  /// Typography
  textTheme: const TextTheme(
    displayLarge: TextStyle(),
    displayMedium: TextStyle(),
    displaySmall: TextStyle(),
    headlineLarge: TextStyle(
      fontFamily: 'Muller',
      fontSize: 18.0,
      height: 1.2,
      color: AppColors.mainText,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      /// Заголовок вверху экрана
      fontFamily: 'Muller',
      fontSize: 20.0,
      height: 1.1,
      color: AppColors.mainText,
    ),
    headlineSmall: TextStyle(
      /// Подзаголовок вверху экрана
      fontFamily: 'Muller',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.250795,
      color: AppColors.lightText,
      height: 1.125,
    ),
    titleLarge: TextStyle(
        fontFamily: 'Muller',
        fontSize: 17.0,
        height: 1.18,
        fontWeight: FontWeight.w500,
        color: AppColors.mainText),
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
      /// Текст в кнопках
      fontFamily: 'Muller',
      fontSize: 14.0,
      height: 1.18,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.24975,
      color: Colors.white,
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
    labelSmall: TextStyle(
      /// Текст в тостах // не используется
      fontFamily: 'Muller',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      height: 1.42,
      letterSpacing: 0.25,
    ),
  ),

  /// Colors
  backgroundColor: AppColors.mainAppBackground,
  scaffoldBackgroundColor: AppColors.mainAppBackground,
  primaryColor: AppColors.mainBrand[900],
  primaryColorLight: AppColors.mainBrandSecond,
  primaryColorDark: AppColors.darkGreenFirst,
  // focusColor: AppColors.
  hoverColor: AppColors.circleBgSecond,
  // shadowColor: AppColors.
  // canvasColor: AppColors.
  // bottomAppBarColor: AppColors.
  // cardColor: AppColors.
  dividerColor: AppColors.mainSeparatorAlpha,
  // highlightColor: AppColors.circleBgFirst,
  splashColor: AppColors.circleBgFirst,
  // selectedRowColor: AppColors.
  // unselectedWidgetColor: AppColors.
  // disabledColor: AppColors.
  // secondaryHeaderColor: AppColors.
  // dialogBackgroundColor: AppColors.
  // indicatorColor: AppColors.
  // hintColor: AppColors.
  errorColor: AppColors.mainError,
  // toggleableActiveColor: AppColors.

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.mainBrandColor,
    foregroundColor: Colors.white,
    hoverColor: AppColors.darkGreenFirst,
    splashColor: AppColors.darkGreenFirst,
  ),

  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.mainBrandColor),
    ),
  ),
);
