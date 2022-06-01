// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:medlike/modules/appointments/appointments_page.dart' as _i2;
import 'package:medlike/modules/login_with_pass/login_page.dart' as _i4;
import 'package:medlike/modules/main_page/main_page.dart' as _i1;
import 'package:medlike/modules/subscribe/profiles_list/profiles_list_page.dart'
    as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    AppointmentsRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.AppointmentsPage());
    },
    ProfilesListRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.ProfilesListPage());
    },
    LoginRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i5.RouteConfig(MainRoute.name, path: '/main'),
        _i5.RouteConfig(AppointmentsRoute.name, path: '/my_appointments'),
        _i5.RouteConfig(ProfilesListRoute.name, path: '/subscribe'),
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig('*#redirect',
            path: '*', redirectTo: '/main', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.AppointmentsPage]
class AppointmentsRoute extends _i5.PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(AppointmentsRoute.name, path: '/my_appointments');

  static const String name = 'AppointmentsRoute';
}

/// generated route for
/// [_i3.ProfilesListPage]
class ProfilesListRoute extends _i5.PageRouteInfo<void> {
  const ProfilesListRoute() : super(ProfilesListRoute.name, path: '/subscribe');

  static const String name = 'ProfilesListRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}
