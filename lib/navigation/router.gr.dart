// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../modules/appointments/appointments_page.dart' as _i2;
import '../modules/login_with_pass/login_page.dart' as _i9;
import '../modules/main_page/main_page.dart' as _i1;
import '../modules/subscribe/clinics_list/clinics_list_page.dart' as _i4;
import '../modules/subscribe/doctors_list/doctors_list_page.dart' as _i8;
import '../modules/subscribe/profiles_list/profiles_list_page.dart' as _i3;
import '../modules/subscribe/researches_list/researches_list_page.dart' as _i6;
import '../modules/subscribe/services_list/services_list_page.dart' as _i5;
import '../modules/subscribe/specialisations_list/specialisations_list_page.dart'
    as _i7;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    AppointmentsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AppointmentsPage());
    },
    ProfilesListRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ProfilesListPage());
    },
    ClinicsListRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicsListRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ClinicsListPage(key: args.key, userId: args.userId));
    },
    ServicesListRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesListRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ServicesListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId));
    },
    ResearchesListRoute.name: (routeData) {
      final args = routeData.argsAs<ResearchesListRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ResearchesListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId));
    },
    SpecialisationsListRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialisationsListRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.SpecialisationsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId));
    },
    DoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorsListRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.DoctorsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId,
              specialisationId: args.specialisationId,
              specialisationName: args.specialisationName));
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.LoginPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i10.RouteConfig(MainRoute.name, path: '/main'),
        _i10.RouteConfig(AppointmentsRoute.name, path: '/my_appointments'),
        _i10.RouteConfig(ProfilesListRoute.name, path: '/subscribe_profiles'),
        _i10.RouteConfig(ClinicsListRoute.name, path: '/subscribe_clinics'),
        _i10.RouteConfig(ServicesListRoute.name, path: '/subscribe_services'),
        _i10.RouteConfig(ResearchesListRoute.name,
            path: '/subscribe_researches'),
        _i10.RouteConfig(SpecialisationsListRoute.name,
            path: '/subscribe_specialisations'),
        _i10.RouteConfig(DoctorsListRoute.name, path: '/subscribe_doctors'),
        _i10.RouteConfig(LoginRoute.name, path: '/login'),
        _i10.RouteConfig('*#redirect',
            path: '*', redirectTo: '/main', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.AppointmentsPage]
class AppointmentsRoute extends _i10.PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(AppointmentsRoute.name, path: '/my_appointments');

  static const String name = 'AppointmentsRoute';
}

/// generated route for
/// [_i3.ProfilesListPage]
class ProfilesListRoute extends _i10.PageRouteInfo<void> {
  const ProfilesListRoute()
      : super(ProfilesListRoute.name, path: '/subscribe_profiles');

  static const String name = 'ProfilesListRoute';
}

/// generated route for
/// [_i4.ClinicsListPage]
class ClinicsListRoute extends _i10.PageRouteInfo<ClinicsListRouteArgs> {
  ClinicsListRoute({_i11.Key? key, required String userId})
      : super(ClinicsListRoute.name,
            path: '/subscribe_clinics',
            args: ClinicsListRouteArgs(key: key, userId: userId));

  static const String name = 'ClinicsListRoute';
}

class ClinicsListRouteArgs {
  const ClinicsListRouteArgs({this.key, required this.userId});

  final _i11.Key? key;

  final String userId;

  @override
  String toString() {
    return 'ClinicsListRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i5.ServicesListPage]
class ServicesListRoute extends _i10.PageRouteInfo<ServicesListRouteArgs> {
  ServicesListRoute(
      {_i11.Key? key,
      required String userId,
      required String buildingId,
      required String clinicId})
      : super(ServicesListRoute.name,
            path: '/subscribe_services',
            args: ServicesListRouteArgs(
                key: key,
                userId: userId,
                buildingId: buildingId,
                clinicId: clinicId));

  static const String name = 'ServicesListRoute';
}

class ServicesListRouteArgs {
  const ServicesListRouteArgs(
      {this.key,
      required this.userId,
      required this.buildingId,
      required this.clinicId});

  final _i11.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  @override
  String toString() {
    return 'ServicesListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i6.ResearchesListPage]
class ResearchesListRoute extends _i10.PageRouteInfo<ResearchesListRouteArgs> {
  ResearchesListRoute(
      {_i11.Key? key,
      required String userId,
      required String buildingId,
      required String clinicId,
      required int categoryTypeId})
      : super(ResearchesListRoute.name,
            path: '/subscribe_researches',
            args: ResearchesListRouteArgs(
                key: key,
                userId: userId,
                buildingId: buildingId,
                clinicId: clinicId,
                categoryTypeId: categoryTypeId));

  static const String name = 'ResearchesListRoute';
}

class ResearchesListRouteArgs {
  const ResearchesListRouteArgs(
      {this.key,
      required this.userId,
      required this.buildingId,
      required this.clinicId,
      required this.categoryTypeId});

  final _i11.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  final int categoryTypeId;

  @override
  String toString() {
    return 'ResearchesListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId, categoryTypeId: $categoryTypeId}';
  }
}

/// generated route for
/// [_i7.SpecialisationsListPage]
class SpecialisationsListRoute
    extends _i10.PageRouteInfo<SpecialisationsListRouteArgs> {
  SpecialisationsListRoute(
      {_i11.Key? key,
      required String userId,
      required String buildingId,
      required String clinicId,
      required int categoryTypeId})
      : super(SpecialisationsListRoute.name,
            path: '/subscribe_specialisations',
            args: SpecialisationsListRouteArgs(
                key: key,
                userId: userId,
                buildingId: buildingId,
                clinicId: clinicId,
                categoryTypeId: categoryTypeId));

  static const String name = 'SpecialisationsListRoute';
}

class SpecialisationsListRouteArgs {
  const SpecialisationsListRouteArgs(
      {this.key,
      required this.userId,
      required this.buildingId,
      required this.clinicId,
      required this.categoryTypeId});

  final _i11.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  final int categoryTypeId;

  @override
  String toString() {
    return 'SpecialisationsListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId, categoryTypeId: $categoryTypeId}';
  }
}

/// generated route for
/// [_i8.DoctorsListPage]
class DoctorsListRoute extends _i10.PageRouteInfo<DoctorsListRouteArgs> {
  DoctorsListRoute(
      {_i11.Key? key,
      required String userId,
      required String buildingId,
      required String clinicId,
      required int categoryTypeId,
      required String specialisationId,
      required String specialisationName})
      : super(DoctorsListRoute.name,
            path: '/subscribe_doctors',
            args: DoctorsListRouteArgs(
                key: key,
                userId: userId,
                buildingId: buildingId,
                clinicId: clinicId,
                categoryTypeId: categoryTypeId,
                specialisationId: specialisationId,
                specialisationName: specialisationName));

  static const String name = 'DoctorsListRoute';
}

class DoctorsListRouteArgs {
  const DoctorsListRouteArgs(
      {this.key,
      required this.userId,
      required this.buildingId,
      required this.clinicId,
      required this.categoryTypeId,
      required this.specialisationId,
      required this.specialisationName});

  final _i11.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  final int categoryTypeId;

  final String specialisationId;

  final String specialisationName;

  @override
  String toString() {
    return 'DoctorsListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId, categoryTypeId: $categoryTypeId, specialisationId: $specialisationId, specialisationName: $specialisationName}';
  }
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}
