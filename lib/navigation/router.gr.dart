// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i29;
import 'package:medlike/data/models/clinic_models/clinic_models.dart' as _i31;
import 'package:medlike/modules/about_clinic/all_clinics_list/all_clinics_list_page.dart'
    as _i24;
import 'package:medlike/modules/about_clinic/detail_clinic/detail_clinic_page.dart'
    as _i25;
import 'package:medlike/modules/about_clinic/price/price_page.dart' as _i26;
import 'package:medlike/modules/about_clinic/sales/sales_page.dart' as _i27;
import 'package:medlike/modules/appointments/appointments_page.dart' as _i8;
import 'package:medlike/modules/login/check_pin_code_page/check_pin_code_page.dart'
    as _i4;
import 'package:medlike/modules/login/create_pin_code_page/pin_code_page.dart'
    as _i3;
import 'package:medlike/modules/login/password_page/password_page.dart' as _i2;
import 'package:medlike/modules/login/phone_number_page/phone_number_page.dart'
    as _i1;
import 'package:medlike/modules/login/recover_passvord/recover_password_new_page.dart'
    as _i6;
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_page.dart'
    as _i5;
import 'package:medlike/modules/main_page/main_page.dart' as _i7;
import 'package:medlike/modules/medcard/files/files_page.dart' as _i21;
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_page.dart'
    as _i20;
import 'package:medlike/modules/medcard/profiles_list/profiles_list_page.dart'
    as _i19;
import 'package:medlike/modules/settings/agreements/agreements_page.dart'
    as _i23;
import 'package:medlike/modules/settings/settings_page.dart' as _i22;
import 'package:medlike/modules/subscribe/clinics_list/clinics_list_page.dart'
    as _i10;
import 'package:medlike/modules/subscribe/confirmation_subscribe/confirmation_subscribe_page.dart'
    as _i18;
import 'package:medlike/modules/subscribe/doctors_list/doctors_list_page.dart'
    as _i14;
import 'package:medlike/modules/subscribe/favorite_doctors_list/favorite_doctors_list_page.dart'
    as _i16;
import 'package:medlike/modules/subscribe/profiles_list/profiles_list_page.dart'
    as _i9;
import 'package:medlike/modules/subscribe/research_cabinets_list/research_cabinets_list_page.dart'
    as _i15;
import 'package:medlike/modules/subscribe/researches_list/researches_list_page.dart'
    as _i12;
import 'package:medlike/modules/subscribe/schedule/schedule_page.dart' as _i17;
import 'package:medlike/modules/subscribe/services_list/services_list_page.dart'
    as _i11;
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list_page.dart'
    as _i13;
import 'package:medlike/navigation/guards.dart' as _i30;

class AppRouter extends _i28.RootStackRouter {
  AppRouter(
      {_i29.GlobalKey<_i29.NavigatorState>? navigatorKey,
      required this.checkIsSavedPinCode,
      required this.checkIsAuthUser})
      : super(navigatorKey);

  final _i30.CheckIsSavedPinCode checkIsSavedPinCode;

  final _i30.CheckIsAuthUser checkIsAuthUser;

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    PhoneNumberRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.PhoneNumberPage());
    },
    PasswordRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i2.PasswordPage(key: args.key, phoneNumber: args.phoneNumber));
    },
    CreatePinCodeRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.CreatePinCodePage());
    },
    CheckPinCodeRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.CheckPinCodePage());
    },
    RecoverPasswordSmsRoute.name: (routeData) {
      final args = routeData.argsAs<RecoverPasswordSmsRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.RecoverPasswordSmsPage(
              key: args.key, phoneNumber: args.phoneNumber));
    },
    RecoverPasswordNewRoute.name: (routeData) {
      final args = routeData.argsAs<RecoverPasswordNewRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.RecoverPasswordNewPage(
              key: args.key, smsToken: args.smsToken));
    },
    MainRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.MainPage());
    },
    AppointmentsRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentsRouteArgs>(
          orElse: () => const AppointmentsRouteArgs());
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i8.AppointmentsPage(key: args.key, isRefresh: args.isRefresh));
    },
    ProfilesListRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.ProfilesListPage());
    },
    ClinicsListRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicsListRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.ClinicsListPage(key: args.key, userId: args.userId));
    },
    ServicesListRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesListRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.ServicesListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId));
    },
    ResearchesListRoute.name: (routeData) {
      final args = routeData.argsAs<ResearchesListRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i12.ResearchesListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId));
    },
    SpecialisationsListRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialisationsListRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i13.SpecialisationsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId));
    },
    DoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorsListRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i14.DoctorsListPage(
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
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i15.ResearchCabinetsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId,
              researchIds: args.researchIds));
    },
    FavoriteDoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteDoctorsListRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i16.FavoriteDoctorsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId));
    },
    ScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i17.SchedulePage(
              key: args.key,
              pageTitle: args.pageTitle,
              pageSubtitle: args.pageSubtitle,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              doctorId: args.doctorId,
              specialisationId: args.specialisationId,
              researchIds: args.researchIds,
              categoryTypeId: args.categoryTypeId,
              cabinet: args.cabinet,
              isAny: args.isAny,
              isFavorite: args.isFavorite));
    },
    ConfirmationSubscribeRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmationSubscribeRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i18.ConfirmationSubscribePage(
              key: args.key, userId: args.userId));
    },
    MedcardProfilesListRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i19.MedcardProfilesListPage());
    },
    MedcardRoute.name: (routeData) {
      final args = routeData.argsAs<MedcardRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i20.MedcardPage(
              key: args.key,
              userId: args.userId,
              isChildrenPage: args.isChildrenPage));
    },
    FilesRoute.name: (routeData) {
      final args = routeData.argsAs<FilesRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i21.FilesPage(key: args.key, userId: args.userId));
    },
    SettingsRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i22.SettingsPage());
    },
    AgreementsRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i23.AgreementsPage());
    },
    AllClinicsListRoute.name: (routeData) {
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i24.AllClinicsListPage());
    },
    DetailClinicRoute.name: (routeData) {
      final args = routeData.argsAs<DetailClinicRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i25.DetailClinicPage(
              key: args.key, selectedClinic: args.selectedClinic));
    },
    PriceRoute.name: (routeData) {
      final args = routeData.argsAs<PriceRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i26.PricePage(key: args.key, clinicId: args.clinicId));
    },
    SalesRoute.name: (routeData) {
      final args = routeData.argsAs<SalesRouteArgs>();
      return _i28.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i27.SalesPage(key: args.key, clinicId: args.clinicId));
    }
  };

  @override
  List<_i28.RouteConfig> get routes => [
        _i28.RouteConfig('/#redirect',
            path: '/', redirectTo: '/main', fullMatch: true),
        _i28.RouteConfig(PhoneNumberRoute.name, path: '/login_phone'),
        _i28.RouteConfig(PasswordRoute.name, path: '/login_password'),
        _i28.RouteConfig(CreatePinCodeRoute.name, path: '/login_pin_code'),
        _i28.RouteConfig(CheckPinCodeRoute.name,
            path: '/login_pin_code_check', guards: [checkIsSavedPinCode]),
        _i28.RouteConfig(RecoverPasswordSmsRoute.name,
            path: '/login_recover_password_sms'),
        _i28.RouteConfig(RecoverPasswordNewRoute.name,
            path: '/login_recover_password_new'),
        _i28.RouteConfig(MainRoute.name,
            path: '/main', guards: [checkIsAuthUser]),
        _i28.RouteConfig(AppointmentsRoute.name,
            path: '/my_appointments', guards: [checkIsAuthUser]),
        _i28.RouteConfig(ProfilesListRoute.name,
            path: '/subscribe_profiles', guards: [checkIsAuthUser]),
        _i28.RouteConfig(ClinicsListRoute.name,
            path: '/subscribe_clinics', guards: [checkIsAuthUser]),
        _i28.RouteConfig(ServicesListRoute.name,
            path: '/subscribe_services', guards: [checkIsAuthUser]),
        _i28.RouteConfig(ResearchesListRoute.name,
            path: '/subscribe_researches', guards: [checkIsAuthUser]),
        _i28.RouteConfig(SpecialisationsListRoute.name,
            path: '/subscribe_specialisations', guards: [checkIsAuthUser]),
        _i28.RouteConfig(DoctorsListRoute.name,
            path: '/subscribe_doctors', guards: [checkIsAuthUser]),
        _i28.RouteConfig(ResearchCabinetsListRoute.name,
            path: '/subscribe_research_cabinets', guards: [checkIsAuthUser]),
        _i28.RouteConfig(FavoriteDoctorsListRoute.name,
            path: '/subscribe_favorite_doctors', guards: [checkIsAuthUser]),
        _i28.RouteConfig(ScheduleRoute.name,
            path: '/subscribe_schedule', guards: [checkIsAuthUser]),
        _i28.RouteConfig(ConfirmationSubscribeRoute.name,
            path: '/subscribe_confirm', guards: [checkIsAuthUser]),
        _i28.RouteConfig(MedcardProfilesListRoute.name,
            path: '/medcard', guards: [checkIsAuthUser]),
        _i28.RouteConfig(MedcardRoute.name,
            path: '/medcard_files_list', guards: [checkIsAuthUser]),
        _i28.RouteConfig(FilesRoute.name,
            path: '/medcard_user_files_list', guards: [checkIsAuthUser]),
        _i28.RouteConfig(SettingsRoute.name,
            path: '/settings', guards: [checkIsAuthUser]),
        _i28.RouteConfig(AgreementsRoute.name, path: '/settings_agreements'),
        _i28.RouteConfig(AllClinicsListRoute.name,
            path: '/clinic_info', guards: [checkIsAuthUser]),
        _i28.RouteConfig(DetailClinicRoute.name,
            path: '/clinic_info_details', guards: [checkIsAuthUser]),
        _i28.RouteConfig(PriceRoute.name,
            path: '/clinic_info_price', guards: [checkIsAuthUser]),
        _i28.RouteConfig(SalesRoute.name,
            path: '/clinic_info_sales', guards: [checkIsAuthUser])
      ];
}

/// generated route for
/// [_i1.PhoneNumberPage]
class PhoneNumberRoute extends _i28.PageRouteInfo<void> {
  const PhoneNumberRoute() : super(PhoneNumberRoute.name, path: '/login_phone');

  static const String name = 'PhoneNumberRoute';
}

/// generated route for
/// [_i2.PasswordPage]
class PasswordRoute extends _i28.PageRouteInfo<PasswordRouteArgs> {
  PasswordRoute({_i29.Key? key, required String phoneNumber})
      : super(PasswordRoute.name,
            path: '/login_password',
            args: PasswordRouteArgs(key: key, phoneNumber: phoneNumber));

  static const String name = 'PasswordRoute';
}

class PasswordRouteArgs {
  const PasswordRouteArgs({this.key, required this.phoneNumber});

  final _i29.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'PasswordRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i3.CreatePinCodePage]
class CreatePinCodeRoute extends _i28.PageRouteInfo<void> {
  const CreatePinCodeRoute()
      : super(CreatePinCodeRoute.name, path: '/login_pin_code');

  static const String name = 'CreatePinCodeRoute';
}

/// generated route for
/// [_i4.CheckPinCodePage]
class CheckPinCodeRoute extends _i28.PageRouteInfo<void> {
  const CheckPinCodeRoute()
      : super(CheckPinCodeRoute.name, path: '/login_pin_code_check');

  static const String name = 'CheckPinCodeRoute';
}

/// generated route for
/// [_i5.RecoverPasswordSmsPage]
class RecoverPasswordSmsRoute
    extends _i28.PageRouteInfo<RecoverPasswordSmsRouteArgs> {
  RecoverPasswordSmsRoute({_i29.Key? key, required String phoneNumber})
      : super(RecoverPasswordSmsRoute.name,
            path: '/login_recover_password_sms',
            args: RecoverPasswordSmsRouteArgs(
                key: key, phoneNumber: phoneNumber));

  static const String name = 'RecoverPasswordSmsRoute';
}

class RecoverPasswordSmsRouteArgs {
  const RecoverPasswordSmsRouteArgs({this.key, required this.phoneNumber});

  final _i29.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RecoverPasswordSmsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i6.RecoverPasswordNewPage]
class RecoverPasswordNewRoute
    extends _i28.PageRouteInfo<RecoverPasswordNewRouteArgs> {
  RecoverPasswordNewRoute({_i29.Key? key, required String smsToken})
      : super(RecoverPasswordNewRoute.name,
            path: '/login_recover_password_new',
            args: RecoverPasswordNewRouteArgs(key: key, smsToken: smsToken));

  static const String name = 'RecoverPasswordNewRoute';
}

class RecoverPasswordNewRouteArgs {
  const RecoverPasswordNewRouteArgs({this.key, required this.smsToken});

  final _i29.Key? key;

  final String smsToken;

  @override
  String toString() {
    return 'RecoverPasswordNewRouteArgs{key: $key, smsToken: $smsToken}';
  }
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i28.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i8.AppointmentsPage]
class AppointmentsRoute extends _i28.PageRouteInfo<AppointmentsRouteArgs> {
  AppointmentsRoute({_i29.Key? key, bool? isRefresh = false})
      : super(AppointmentsRoute.name,
            path: '/my_appointments',
            args: AppointmentsRouteArgs(key: key, isRefresh: isRefresh));

  static const String name = 'AppointmentsRoute';
}

class AppointmentsRouteArgs {
  const AppointmentsRouteArgs({this.key, this.isRefresh = false});

  final _i29.Key? key;

  final bool? isRefresh;

  @override
  String toString() {
    return 'AppointmentsRouteArgs{key: $key, isRefresh: $isRefresh}';
  }
}

/// generated route for
/// [_i9.ProfilesListPage]
class ProfilesListRoute extends _i28.PageRouteInfo<void> {
  const ProfilesListRoute()
      : super(ProfilesListRoute.name, path: '/subscribe_profiles');

  static const String name = 'ProfilesListRoute';
}

/// generated route for
/// [_i10.ClinicsListPage]
class ClinicsListRoute extends _i28.PageRouteInfo<ClinicsListRouteArgs> {
  ClinicsListRoute({_i29.Key? key, required String userId})
      : super(ClinicsListRoute.name,
            path: '/subscribe_clinics',
            args: ClinicsListRouteArgs(key: key, userId: userId));

  static const String name = 'ClinicsListRoute';
}

class ClinicsListRouteArgs {
  const ClinicsListRouteArgs({this.key, required this.userId});

  final _i29.Key? key;

  final String userId;

  @override
  String toString() {
    return 'ClinicsListRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i11.ServicesListPage]
class ServicesListRoute extends _i28.PageRouteInfo<ServicesListRouteArgs> {
  ServicesListRoute(
      {_i29.Key? key,
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

  final _i29.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  @override
  String toString() {
    return 'ServicesListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i12.ResearchesListPage]
class ResearchesListRoute extends _i28.PageRouteInfo<ResearchesListRouteArgs> {
  ResearchesListRoute(
      {_i29.Key? key,
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

  final _i29.Key? key;

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
/// [_i13.SpecialisationsListPage]
class SpecialisationsListRoute
    extends _i28.PageRouteInfo<SpecialisationsListRouteArgs> {
  SpecialisationsListRoute(
      {_i29.Key? key,
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

  final _i29.Key? key;

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
/// [_i14.DoctorsListPage]
class DoctorsListRoute extends _i28.PageRouteInfo<DoctorsListRouteArgs> {
  DoctorsListRoute(
      {_i29.Key? key,
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

  final _i29.Key? key;

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
/// [_i15.ResearchCabinetsListPage]
class ResearchCabinetsListRoute
    extends _i28.PageRouteInfo<ResearchCabinetsListRouteArgs> {
  ResearchCabinetsListRoute(
      {_i29.Key? key,
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

  final _i29.Key? key;

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
/// [_i16.FavoriteDoctorsListPage]
class FavoriteDoctorsListRoute
    extends _i28.PageRouteInfo<FavoriteDoctorsListRouteArgs> {
  FavoriteDoctorsListRoute(
      {_i29.Key? key,
      required String userId,
      required String buildingId,
      required String clinicId})
      : super(FavoriteDoctorsListRoute.name,
            path: '/subscribe_favorite_doctors',
            args: FavoriteDoctorsListRouteArgs(
                key: key,
                userId: userId,
                buildingId: buildingId,
                clinicId: clinicId));

  static const String name = 'FavoriteDoctorsListRoute';
}

class FavoriteDoctorsListRouteArgs {
  const FavoriteDoctorsListRouteArgs(
      {this.key,
      required this.userId,
      required this.buildingId,
      required this.clinicId});

  final _i29.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  @override
  String toString() {
    return 'FavoriteDoctorsListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i17.SchedulePage]
class ScheduleRoute extends _i28.PageRouteInfo<ScheduleRouteArgs> {
  ScheduleRoute(
      {_i29.Key? key,
      required String pageTitle,
      String pageSubtitle = '',
      required String userId,
      required String buildingId,
      required String clinicId,
      String? doctorId,
      String? specialisationId,
      List<String>? researchIds,
      required int categoryTypeId,
      String? cabinet,
      required bool isAny,
      bool isFavorite = false})
      : super(ScheduleRoute.name,
            path: '/subscribe_schedule',
            args: ScheduleRouteArgs(
                key: key,
                pageTitle: pageTitle,
                pageSubtitle: pageSubtitle,
                userId: userId,
                buildingId: buildingId,
                clinicId: clinicId,
                doctorId: doctorId,
                specialisationId: specialisationId,
                researchIds: researchIds,
                categoryTypeId: categoryTypeId,
                cabinet: cabinet,
                isAny: isAny,
                isFavorite: isFavorite));

  static const String name = 'ScheduleRoute';
}

class ScheduleRouteArgs {
  const ScheduleRouteArgs(
      {this.key,
      required this.pageTitle,
      this.pageSubtitle = '',
      required this.userId,
      required this.buildingId,
      required this.clinicId,
      this.doctorId,
      this.specialisationId,
      this.researchIds,
      required this.categoryTypeId,
      this.cabinet,
      required this.isAny,
      this.isFavorite = false});

  final _i29.Key? key;

  final String pageTitle;

  final String pageSubtitle;

  final String userId;

  final String buildingId;

  final String clinicId;

  final String? doctorId;

  final String? specialisationId;

  final List<String>? researchIds;

  final int categoryTypeId;

  final String? cabinet;

  final bool isAny;

  final bool isFavorite;

  @override
  String toString() {
    return 'ScheduleRouteArgs{key: $key, pageTitle: $pageTitle, pageSubtitle: $pageSubtitle, userId: $userId, buildingId: $buildingId, clinicId: $clinicId, doctorId: $doctorId, specialisationId: $specialisationId, researchIds: $researchIds, categoryTypeId: $categoryTypeId, cabinet: $cabinet, isAny: $isAny, isFavorite: $isFavorite}';
  }
}

/// generated route for
/// [_i18.ConfirmationSubscribePage]
class ConfirmationSubscribeRoute
    extends _i28.PageRouteInfo<ConfirmationSubscribeRouteArgs> {
  ConfirmationSubscribeRoute({_i29.Key? key, required String userId})
      : super(ConfirmationSubscribeRoute.name,
            path: '/subscribe_confirm',
            args: ConfirmationSubscribeRouteArgs(key: key, userId: userId));

  static const String name = 'ConfirmationSubscribeRoute';
}

class ConfirmationSubscribeRouteArgs {
  const ConfirmationSubscribeRouteArgs({this.key, required this.userId});

  final _i29.Key? key;

  final String userId;

  @override
  String toString() {
    return 'ConfirmationSubscribeRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i19.MedcardProfilesListPage]
class MedcardProfilesListRoute extends _i28.PageRouteInfo<void> {
  const MedcardProfilesListRoute()
      : super(MedcardProfilesListRoute.name, path: '/medcard');

  static const String name = 'MedcardProfilesListRoute';
}

/// generated route for
/// [_i20.MedcardPage]
class MedcardRoute extends _i28.PageRouteInfo<MedcardRouteArgs> {
  MedcardRoute(
      {_i29.Key? key, required String userId, required bool isChildrenPage})
      : super(MedcardRoute.name,
            path: '/medcard_files_list',
            args: MedcardRouteArgs(
                key: key, userId: userId, isChildrenPage: isChildrenPage));

  static const String name = 'MedcardRoute';
}

class MedcardRouteArgs {
  const MedcardRouteArgs(
      {this.key, required this.userId, required this.isChildrenPage});

  final _i29.Key? key;

  final String userId;

  final bool isChildrenPage;

  @override
  String toString() {
    return 'MedcardRouteArgs{key: $key, userId: $userId, isChildrenPage: $isChildrenPage}';
  }
}

/// generated route for
/// [_i21.FilesPage]
class FilesRoute extends _i28.PageRouteInfo<FilesRouteArgs> {
  FilesRoute({_i29.Key? key, required String userId})
      : super(FilesRoute.name,
            path: '/medcard_user_files_list',
            args: FilesRouteArgs(key: key, userId: userId));

  static const String name = 'FilesRoute';
}

class FilesRouteArgs {
  const FilesRouteArgs({this.key, required this.userId});

  final _i29.Key? key;

  final String userId;

  @override
  String toString() {
    return 'FilesRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i22.SettingsPage]
class SettingsRoute extends _i28.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i23.AgreementsPage]
class AgreementsRoute extends _i28.PageRouteInfo<void> {
  const AgreementsRoute()
      : super(AgreementsRoute.name, path: '/settings_agreements');

  static const String name = 'AgreementsRoute';
}

/// generated route for
/// [_i24.AllClinicsListPage]
class AllClinicsListRoute extends _i28.PageRouteInfo<void> {
  const AllClinicsListRoute()
      : super(AllClinicsListRoute.name, path: '/clinic_info');

  static const String name = 'AllClinicsListRoute';
}

/// generated route for
/// [_i25.DetailClinicPage]
class DetailClinicRoute extends _i28.PageRouteInfo<DetailClinicRouteArgs> {
  DetailClinicRoute({_i29.Key? key, required _i31.ClinicModel selectedClinic})
      : super(DetailClinicRoute.name,
            path: '/clinic_info_details',
            args: DetailClinicRouteArgs(
                key: key, selectedClinic: selectedClinic));

  static const String name = 'DetailClinicRoute';
}

class DetailClinicRouteArgs {
  const DetailClinicRouteArgs({this.key, required this.selectedClinic});

  final _i29.Key? key;

  final _i31.ClinicModel selectedClinic;

  @override
  String toString() {
    return 'DetailClinicRouteArgs{key: $key, selectedClinic: $selectedClinic}';
  }
}

/// generated route for
/// [_i26.PricePage]
class PriceRoute extends _i28.PageRouteInfo<PriceRouteArgs> {
  PriceRoute({_i29.Key? key, required String clinicId})
      : super(PriceRoute.name,
            path: '/clinic_info_price',
            args: PriceRouteArgs(key: key, clinicId: clinicId));

  static const String name = 'PriceRoute';
}

class PriceRouteArgs {
  const PriceRouteArgs({this.key, required this.clinicId});

  final _i29.Key? key;

  final String clinicId;

  @override
  String toString() {
    return 'PriceRouteArgs{key: $key, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i27.SalesPage]
class SalesRoute extends _i28.PageRouteInfo<SalesRouteArgs> {
  SalesRoute({_i29.Key? key, required String clinicId})
      : super(SalesRoute.name,
            path: '/clinic_info_sales',
            args: SalesRouteArgs(key: key, clinicId: clinicId));

  static const String name = 'SalesRoute';
}

class SalesRouteArgs {
  const SalesRouteArgs({this.key, required this.clinicId});

  final _i29.Key? key;

  final String clinicId;

  @override
  String toString() {
    return 'SalesRouteArgs{key: $key, clinicId: $clinicId}';
  }
}
