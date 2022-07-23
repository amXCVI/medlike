import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
// Primary первичный цвет
  static const Color mainBrandColor = Color(0xff3C94A8);

// PrimaryVariant
  static const Color brandSecond = Color(0xffD2EFF4);

// Secondary вторичный цвет
  static const Color mainBrandSecond = Color(0xff358294);

// SecondaryVariant
  static const Color brandSecondHover = Color(0xffCAE6EB);

// Tertiary третий цвет для айдентики бренда наряду с Primary и Secondary
  static const Color darkGreenFirst = Color(0xff4E767E);

// TertiaryVariant
  static const Color darkGreenSecond = Color(0xff455A5F);

// Background цвет фона приложения
  static const Color mainAppBackground = Color(0xffffffff);

// Surface цвет поверхностей компонентов в приложении
  static const Color lightBrandBackground = Color(0xffF9FCFC);

// SurfaceVariant второй вариант для цветов поверхностей
  static const Color mainBgAlpha = Color(0xff3C94A8);

// Error
  static const Color mainError = Color(0xffFF5752);

// ErrorVariant
  static const Color lightRed = Color(0xffF7DEDE);

// Outline цвет для обводки различных компонентов
  static const Color mainOutlined = Color(0xff151616);

// PrimaryContainer
  static const Color lightBrand = Color(0xffDFEAEC);

// SecondaryContainer
  static const Color lightBrandSecond = Color(0xffD9E5E8);

// HoverColor
  static const Color circleBgSecond = Color.fromRGBO(237, 245, 247, 1);

//
  static const Color lightBrandThird = Color(0xff8DB2B9);

//
  static const Color gradientSecond = Color(0xff2B7A92);

//
  static const Color mainText = Color(0xff151616);

//
  static const Color mainDone = Color(0xff51E09F);

//
  static const Color brandSecondActive = Color(0xffAED6DD);

//
  static const Color red = Color(0xffCE8D96);

  static const Color mainSeparatorAlpha = Color.fromRGBO(158, 157, 157, 0.4);

  static const Color lightText = Color.fromRGBO(158, 157, 157, 1);

  static const Color circleBgFirst = Color(0xffEEEEEE);

  static const Color mainOther = Color.fromRGBO(59, 117, 184, 1);

  static const Color notDone = Color.fromRGBO(157, 157, 207, 1);

  static const Color mainWaiting = Color.fromRGBO(255, 204, 0, 1);

  static const Color secondBackground = Color.fromRGBO(250, 250, 250, 1);

  static const Color lightBgAlpha = Color.fromRGBO(255, 255, 255, 0.5);

  static const Map<int, Color> mainBrand = {
    50: Color.fromRGBO(60, 148, 168, .1), // mainBgAlpha
    100: Color.fromRGBO(60, 148, 168, .2),
    200: Color.fromRGBO(60, 148, 168, .3),
    300: Color.fromRGBO(60, 148, 168, .4),
    400: Color.fromRGBO(60, 148, 168, .5),
    500: Color.fromRGBO(60, 148, 168, .6),
    600: Color.fromRGBO(60, 148, 168, .7),
    700: Color.fromRGBO(60, 148, 168, .8),
    800: Color.fromRGBO(60, 148, 168, .9),
    900: Color.fromRGBO(60, 148, 168, 1),
  };

  // Цвета для градиента карточек на главной
  static const Color homeCategoriesGradientColor1 =
      Color.fromRGBO(225, 228, 236, 0.2);
  static const Color homeCategoriesGradientColor2 =
      Color.fromRGBO(223, 235, 241, 1);
  static const Color homeCategoriesGradientColor3 =
      Color.fromRGBO(255, 255, 255, 1);
  // Цвета для градиента под слайдером
  static const Color homeSliderGradientColor1 =
  Color.fromRGBO(21, 22, 22, 0.2);
  static const Color homeSliderGradientColor2 =
  Color.fromRGBO(21, 22, 22, 0.9);
}
