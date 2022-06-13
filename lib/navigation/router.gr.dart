// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../data/models/clinic_models/clinic_models.dart' as _i19;
import '../modules/about_clinic/all_clinics_list/all_clinics_list_page.dart'
    as _i12;
import '../modules/about_clinic/detail_clinic/detail_clinic_page.dart' as _i13;
import '../modules/about_clinic/price/price_page.dart' as _i14;
import '../modules/about_clinic/sales/sales_page.dart' as _i15;
import '../modules/appointments/appointments_page.dart' as _i2;
import '../modules/login_with_pass/login_page.dart' as _i16;
import '../modules/main_page/main_page.dart' as _i1;
import '../modules/settings/settings_page.dart' as _i11;
import '../modules/subscribe/clinics_list/clinics_list_page.dart' as _i4;
import '../modules/subscribe/doctors_list/doctors_list_page.dart' as _i8;
import '../modules/subscribe/favorite_doctors_list/favorite_doctors_list_page.dart'
    as _i10;
import '../modules/subscribe/profiles_list/profiles_list_page.dart' as _i3;
import '../modules/subscribe/research_cabinets_list/research_cabinets_list_page.dart'
    as _i9;
import '../modules/subscribe/researches_list/researches_list_page.dart' as _i6;
import '../modules/subscribe/services_list/services_list_page.dart' as _i5;
import '../modules/subscribe/specialisations_list/specialisations_list_page.dart'
    as _i7;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    AppointmentsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AppointmentsPage());
    },
    ProfilesListRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ProfilesListPage());
    },
    ClinicsListRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicsListRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ClinicsListPage(key: args.key, userId: args.userId));
    },
    ServicesListRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesListRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ServicesListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId));
    },
    ResearchesListRoute.name: (routeData) {
      final args = routeData.argsAs<ResearchesListRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
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
      return _i17.MaterialPageX<dynamic>(
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
      return _i17.MaterialPageX<dynamic>(
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
    ResearchCabinetsListRoute.name: (routeData) {
      final args = routeData.argsAs<ResearchCabinetsListRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.ResearchCabinetsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId,
              researchIds: args.researchIds));
    },
    FavoriteDoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteDoctorsListRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.FavoriteDoctorsListPage(
              key: args.key, userId: args.userId, buildingId: args.buildingId));
    },
    SettingsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SettingsPage());
    },
    AllClinicsListRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.AllClinicsListPage());
    },
    DetailClinicRoute.name: (routeData) {
      final args = routeData.argsAs<DetailClinicRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.DetailClinicPage(
              key: args.key, selectedClinic: args.selectedClinic));
    },
    PriceRoute.name: (routeData) {
      final args = routeData.argsAs<PriceRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.PricePage(key: args.key, clinicId: args.clinicId));
    },
    SalesRoute.name: (routeData) {
      final args = routeData.argsAs<SalesRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.SalesPage(key: args.key, clinicId: args.clinicId));
    },
    LoginRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.LoginPage());
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i17.RouteConfig(MainRoute.name, path: '/main'),
        _i17.RouteConfig(AppointmentsRoute.name, path: '/my_appointments'),
        _i17.RouteConfig(ProfilesListRoute.name, path: '/subscribe_profiles'),
        _i17.RouteConfig(ClinicsListRoute.name, path: '/subscribe_clinics'),
        _i17.RouteConfig(ServicesListRoute.name, path: '/subscribe_services'),
        _i17.RouteConfig(ResearchesListRoute.name,
            path: '/subscribe_researches'),
        _i17.RouteConfig(SpecialisationsListRoute.name,
            path: '/subscribe_specialisations'),
        _i17.RouteConfig(DoctorsListRoute.name, path: '/subscribe_doctors'),
        _i17.RouteConfig(ResearchCabinetsListRoute.name,
            path: '/subscribe_research_cabinets'),
        _i17.RouteConfig(FavoriteDoctorsListRoute.name,
            path: '/subscribe_favorite_doctors'),
        _i17.RouteConfig(SettingsRoute.name, path: '/settings'),
        _i17.RouteConfig(AllClinicsListRoute.name, path: '/clinic_info'),
        _i17.RouteConfig(DetailClinicRoute.name, path: '/clinic_info_details'),
        _i17.RouteConfig(PriceRoute.name, path: '/clinic_info_price'),
        _i17.RouteConfig(SalesRoute.name, path: '/clinic_info_sales'),
        _i17.RouteConfig(LoginRoute.name, path: '/login'),
        _i17.RouteConfig('*#redirect',
            path: '*', redirectTo: '/main', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i17.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.AppointmentsPage]
class AppointmentsRoute extends _i17.PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(AppointmentsRoute.name, path: '/my_appointments');

  static const String name = 'AppointmentsRoute';
}

/// generated route for
/// [_i3.ProfilesListPage]
class ProfilesListRoute extends _i17.PageRouteInfo<void> {
  const ProfilesListRoute()
      : super(ProfilesListRoute.name, path: '/subscribe_profiles');

  static const String name = 'ProfilesListRoute';
}

/// generated route for
/// [_i4.ClinicsListPage]
class ClinicsListRoute extends _i17.PageRouteInfo<ClinicsListRouteArgs> {
  ClinicsListRoute({_i18.Key? key, required String userId})
      : super(ClinicsListRoute.name,
            path: '/subscribe_clinics',
            args: ClinicsListRouteArgs(key: key, userId: userId));

  static const String name = 'ClinicsListRoute';
}

class ClinicsListRouteArgs {
  const ClinicsListRouteArgs({this.key, required this.userId});

  final _i18.Key? key;

  final String userId;

  @override
  String toString() {
    return 'ClinicsListRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i5.ServicesListPage]
class ServicesListRoute extends _i17.PageRouteInfo<ServicesListRouteArgs> {
  ServicesListRoute(
      {_i18.Key? key,
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

  final _i18.Key? key;

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
class ResearchesListRoute extends _i17.PageRouteInfo<ResearchesListRouteArgs> {
  ResearchesListRoute(
      {_i18.Key? key,
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

  final _i18.Key? key;

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
    extends _i17.PageRouteInfo<SpecialisationsListRouteArgs> {
  SpecialisationsListRoute(
      {_i18.Key? key,
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

  final _i18.Key? key;

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
class DoctorsListRoute extends _i17.PageRouteInfo<DoctorsListRouteArgs> {
  DoctorsListRoute(
      {_i18.Key? key,
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

  final _i18.Key? key;

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
/// [_i9.ResearchCabinetsListPage]
class ResearchCabinetsListRoute
    extends _i17.PageRouteInfo<ResearchCabinetsListRouteArgs> {
  ResearchCabinetsListRoute(
      {_i18.Key? key,
      required String userId,
      required String buildingId,
      required String clinicId,
      required int categoryTypeId,
      required List<String> researchIds})
      : super(ResearchCabinetsListRoute.name,
            path: '/subscribe_research_cabinets',
            args: ResearchCabinetsListRouteArgs(
                key: key,
                userId: userId,
                buildingId: buildingId,
                clinicId: clinicId,
                categoryTypeId: categoryTypeId,
                researchIds: researchIds));

  static const String name = 'ResearchCabinetsListRoute';
}

class ResearchCabinetsListRouteArgs {
  const ResearchCabinetsListRouteArgs(
      {this.key,
      required this.userId,
      required this.buildingId,
      required this.clinicId,
      required this.categoryTypeId,
      required this.researchIds});

  final _i18.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  final int categoryTypeId;

  final List<String> researchIds;

  @override
  String toString() {
    return 'ResearchCabinetsListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId, categoryTypeId: $categoryTypeId, researchIds: $researchIds}';
  }
}

/// generated route for
/// [_i10.FavoriteDoctorsListPage]
class FavoriteDoctorsListRoute
    extends _i17.PageRouteInfo<FavoriteDoctorsListRouteArgs> {
  FavoriteDoctorsListRoute(
      {_i18.Key? key, required String userId, required String buildingId})
      : super(FavoriteDoctorsListRoute.name,
            path: '/subscribe_favorite_doctors',
            args: FavoriteDoctorsListRouteArgs(
                key: key, userId: userId, buildingId: buildingId));

  static const String name = 'FavoriteDoctorsListRoute';
}

class FavoriteDoctorsListRouteArgs {
  const FavoriteDoctorsListRouteArgs(
      {this.key, required this.userId, required this.buildingId});

  final _i18.Key? key;

  final String userId;

  final String buildingId;

  @override
  String toString() {
    return 'FavoriteDoctorsListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId}';
  }
}

/// generated route for
/// [_i11.SettingsPage]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i12.AllClinicsListPage]
class AllClinicsListRoute extends _i17.PageRouteInfo<void> {
  const AllClinicsListRoute()
      : super(AllClinicsListRoute.name, path: '/clinic_info');

  static const String name = 'AllClinicsListRoute';
}

/// generated route for
/// [_i13.DetailClinicPage]
class DetailClinicRoute extends _i17.PageRouteInfo<DetailClinicRouteArgs> {
  DetailClinicRoute({_i18.Key? key, required _i19.ClinicModel selectedClinic})
      : super(DetailClinicRoute.name,
            path: '/clinic_info_details',
            args: DetailClinicRouteArgs(
                key: key, selectedClinic: selectedClinic));

  static const String name = 'DetailClinicRoute';
}

class DetailClinicRouteArgs {
  const DetailClinicRouteArgs({this.key, required this.selectedClinic});

  final _i18.Key? key;

  final _i19.ClinicModel selectedClinic;

  @override
  String toString() {
    return 'DetailClinicRouteArgs{key: $key, selectedClinic: $selectedClinic}';
  }
}

/// generated route for
/// [_i14.PricePage]
class PriceRoute extends _i17.PageRouteInfo<PriceRouteArgs> {
  PriceRoute({_i18.Key? key, required String clinicId})
      : super(PriceRoute.name,
            path: '/clinic_info_price',
            args: PriceRouteArgs(key: key, clinicId: clinicId));

  static const String name = 'PriceRoute';
}

class PriceRouteArgs {
  const PriceRouteArgs({this.key, required this.clinicId});

  final _i18.Key? key;

  final String clinicId;

  @override
  String toString() {
    return 'PriceRouteArgs{key: $key, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i15.SalesPage]
class SalesRoute extends _i17.PageRouteInfo<SalesRouteArgs> {
  SalesRoute({_i18.Key? key, required String clinicId})
      : super(SalesRoute.name,
            path: '/clinic_info_sales',
            args: SalesRouteArgs(key: key, clinicId: clinicId));

  static const String name = 'SalesRoute';
}

class SalesRouteArgs {
  const SalesRouteArgs({this.key, required this.clinicId});

  final _i18.Key? key;

  final String clinicId;

  @override
  String toString() {
    return 'SalesRouteArgs{key: $key, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i16.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}
