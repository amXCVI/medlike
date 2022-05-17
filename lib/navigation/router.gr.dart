// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:medlike/modules/login_with_pass/login_page.dart' as _i2;
import 'package:medlike/modules/main_page/main_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    LoginRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i3.RouteConfig(MainRoute.name, path: '/main'),
        _i3.RouteConfig(LoginRoute.name, path: '/login'),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '/main', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}
