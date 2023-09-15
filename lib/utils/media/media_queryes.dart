import 'package:flutter/cupertino.dart';

enum AppMediaQueryEnum {
  xs, // 0
  sm, // 576
  md, // 768
  lg, // 992
  xl, // 1200
}

class AppMediaQuery {
  static AppMediaQueryEnum getScreenWidth(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1200) {
      return AppMediaQueryEnum.xl;
    }
    if (MediaQuery.of(context).size.width > 992) {
      return AppMediaQueryEnum.lg;
    }
    if (MediaQuery.of(context).size.width > 768) {
      return AppMediaQueryEnum.md;
    }
    if (MediaQuery.of(context).size.width > 576) {
      return AppMediaQueryEnum.sm;
    }
    return AppMediaQueryEnum.xs;
  }

  static bool isDesktop(BuildContext context) {
    if (MediaQuery.of(context).size.width > 768) {
      return true;
    }
    return false;
  }
}
