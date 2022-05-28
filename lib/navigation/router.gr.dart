// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:medlike/modules/appointments/appointments_page.dart' as _i2;
import 'package:medlike/modules/login_with_pass/login_page.dart' as _i3;
import 'package:medlike/modules/main_page/main_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    AppointmentsRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.AppointmentsPage());
    },
    LoginRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i4.RouteConfig(MainRoute.name, path: '/main'),
        _i4.RouteConfig(AppointmentsRoute.name, path: '/my_appointments'),
        _i4.RouteConfig(LoginRoute.name, path: '/login'),
        _i4.RouteConfig('*#redirect',
            path: '*', redirectTo: '/main', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.AppointmentsPage]
class AppointmentsRoute extends _i4.PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(AppointmentsRoute.name, path: '/my_appointments');

  static const String name = 'AppointmentsRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}
