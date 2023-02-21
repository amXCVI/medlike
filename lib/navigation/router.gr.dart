// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i39;
import 'package:flutter/material.dart' as _i40;
import 'package:medlike/data/models/clinic_models/clinic_models.dart' as _i42;
import 'package:medlike/data/models/diary_models/diary_models.dart' as _i43;
import 'package:medlike/modules/about_clinic/all_clinics_list/all_clinics_list_page.dart'
    as _i29;
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/clinic_detail_with_bottom_sheets_page.dart'
    as _i30;
import 'package:medlike/modules/about_clinic/price/price_page.dart' as _i31;
import 'package:medlike/modules/about_clinic/sales/sales_page.dart' as _i32;
import 'package:medlike/modules/appointments/appointments_page.dart' as _i11;
import 'package:medlike/modules/health/diary_add_page/diary_add_page.dart'
    as _i36;
import 'package:medlike/modules/health/diary_page/diary_page.dart' as _i35;
import 'package:medlike/modules/health/health_page/cards_page.dart' as _i34;
import 'package:medlike/modules/health/health_page/health_page.dart' as _i33;
import 'package:medlike/modules/login/auth_user_agreements/auth_user_agreements_page.dart'
    as _i8;
import 'package:medlike/modules/login/check_pin_code_page/check_pin_code_page.dart'
    as _i5;
import 'package:medlike/modules/login/create_pin_code_page/pin_code_page.dart'
    as _i4;
import 'package:medlike/modules/login/password_page/password_page.dart' as _i3;
import 'package:medlike/modules/login/recover_passvord/recover_password_new_page.dart'
    as _i7;
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_page.dart'
    as _i6;
import 'package:medlike/modules/login/smartapp_login/smartapp_login_page.dart'
    as _i1;
import 'package:medlike/modules/login/start_phone_number_page/start_phone_number_page.dart'
    as _i2;
import 'package:medlike/modules/login/unauth_support/unauth_support_page.dart'
    as _i9;
import 'package:medlike/modules/main_page/main_page.dart' as _i10;
import 'package:medlike/modules/medcard/files/files_page.dart' as _i25;
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_page.dart'
    as _i24;
import 'package:medlike/modules/medcard/profiles_list/profiles_list_page.dart'
    as _i23;
import 'package:medlike/modules/require_update_app/require_update_app_page.dart'
    as _i37;
import 'package:medlike/modules/settings/agreements/agreements_page.dart'
    as _i27;
import 'package:medlike/modules/settings/settings_page.dart' as _i26;
import 'package:medlike/modules/settings/support/support_page.dart' as _i28;
import 'package:medlike/modules/subscribe/clinics_list/clinics_list_page.dart'
    as _i13;
import 'package:medlike/modules/subscribe/confirmation_subscribe/confirmation_subscribe_page.dart'
    as _i21;
import 'package:medlike/modules/subscribe/confirmation_subscribe/payment_page.dart'
    as _i22;
import 'package:medlike/modules/subscribe/doctors_list/doctors_list_page.dart'
    as _i17;
import 'package:medlike/modules/subscribe/favorite_doctors_list/favorite_doctors_list_page.dart'
    as _i19;
import 'package:medlike/modules/subscribe/profiles_list/profiles_list_page.dart'
    as _i12;
import 'package:medlike/modules/subscribe/research_cabinets_list/research_cabinets_list_page.dart'
    as _i18;
import 'package:medlike/modules/subscribe/researches_list/researches_list_page.dart'
    as _i15;
import 'package:medlike/modules/subscribe/schedule/schedule_page.dart' as _i20;
import 'package:medlike/modules/subscribe/services_list/services_list_page.dart'
    as _i14;
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list_page.dart'
    as _i16;
import 'package:medlike/modules/wrong_login/wrong_login.dart' as _i38;
import 'package:medlike/navigation/guards.dart' as _i41;

class AppRouter extends _i39.RootStackRouter {
  AppRouter(
      {_i40.GlobalKey<_i40.NavigatorState>? navigatorKey,
      required this.checkIsSavedPinCode,
      required this.checkIsAuthSmartappUser,
      required this.checkIsAuthUser})
      : super(navigatorKey);

  final _i41.CheckIsSavedPinCode checkIsSavedPinCode;

  final _i41.CheckIsAuthSmartappUser checkIsAuthSmartappUser;

  final _i41.CheckIsAuthUser checkIsAuthUser;

  @override
  final Map<String, _i39.PageFactory> pagesMap = {
    SmartappLoginRoute.name: (routeData) {
      final args = routeData.argsAs<SmartappLoginRouteArgs>(
          orElse: () => const SmartappLoginRouteArgs());
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i1.SmartappLoginPage(key: args.key, resolver: args.resolver));
    },
    StartPhoneNumberRoute.name: (routeData) {
      final args = routeData.argsAs<StartPhoneNumberRouteArgs>(
          orElse: () => const StartPhoneNumberRouteArgs());
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.StartPhoneNumberPage(
              key: args.key, isDeletingProfile: args.isDeletingProfile));
    },
    PasswordRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i3.PasswordPage(key: args.key, phoneNumber: args.phoneNumber));
    },
    CreatePinCodeRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePinCodeRouteArgs>(
          orElse: () => const CreatePinCodeRouteArgs());
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.CreatePinCodePage(
              key: args.key, noUsedBiometric: args.noUsedBiometric));
    },
    CheckPinCodeRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.CheckPinCodePage());
    },
    RecoverPasswordSmsRoute.name: (routeData) {
      final args = routeData.argsAs<RecoverPasswordSmsRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.RecoverPasswordSmsPage(
              key: args.key, phoneNumber: args.phoneNumber));
    },
    RecoverPasswordNewRoute.name: (routeData) {
      final args = routeData.argsAs<RecoverPasswordNewRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.RecoverPasswordNewPage(
              key: args.key, smsToken: args.smsToken));
    },
    AuthUserAgreementsRoute.name: (routeData) {
      final args = routeData.argsAs<AuthUserAgreementsRouteArgs>(
          orElse: () => const AuthUserAgreementsRouteArgs());
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i8.AuthUserAgreementsPage(
              key: args.key, isFullScreen: args.isFullScreen));
    },
    UnauthSupportRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.UnauthSupportPage());
    },
    MainRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.MainPage());
    },
    AppointmentsRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentsRouteArgs>(
          orElse: () => const AppointmentsRouteArgs());
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i11.AppointmentsPage(key: args.key, isRefresh: args.isRefresh));
    },
    SubscribeProfilesListRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.SubscribeProfilesListPage());
    },
    ClinicsListRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicsListRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i13.ClinicsListPage(
              key: args.key,
              userId: args.userId,
              isChildrenPage: args.isChildrenPage));
    },
    ServicesListRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesListRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i14.ServicesListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId));
    },
    ResearchesListRoute.name: (routeData) {
      final args = routeData.argsAs<ResearchesListRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i15.ResearchesListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId));
    },
    SpecialisationsListRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialisationsListRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i16.SpecialisationsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId));
    },
    DoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorsListRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i17.DoctorsListPage(
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
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i18.ResearchCabinetsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId,
              categoryTypeId: args.categoryTypeId,
              researchIds: args.researchIds));
    },
    FavoriteDoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteDoctorsListRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i19.FavoriteDoctorsListPage(
              key: args.key,
              userId: args.userId,
              buildingId: args.buildingId,
              clinicId: args.clinicId));
    },
    ScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i20.SchedulePage(
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
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i21.ConfirmationSubscribePage(
              key: args.key,
              userId: args.userId,
              timeZoneHours: args.timeZoneHours));
    },
    PaymentRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i22.PaymentPage(key: args.key, userId: args.userId));
    },
    MedcardProfilesListRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i23.MedcardProfilesListPage());
    },
    MedcardRoute.name: (routeData) {
      final args = routeData.argsAs<MedcardRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i24.MedcardPage(
              key: args.key,
              userId: args.userId,
              isChildrenPage: args.isChildrenPage));
    },
    FilesRoute.name: (routeData) {
      final args = routeData.argsAs<FilesRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i25.FilesPage(key: args.key, userId: args.userId));
    },
    SettingsRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i26.SettingsPage());
    },
    AgreementsRoute.name: (routeData) {
      final args = routeData.argsAs<AgreementsRouteArgs>(
          orElse: () => const AgreementsRouteArgs());
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i27.AgreementsPage(
              key: args.key,
              isAppointmentAgreements: args.isAppointmentAgreements));
    },
    SupportRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i28.SupportPage());
    },
    AllClinicsListRoute.name: (routeData) {
      final args = routeData.argsAs<AllClinicsListRouteArgs>(
          orElse: () => const AllClinicsListRouteArgs());
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i29.AllClinicsListPage(
              key: args.key, isFromMainPage: args.isFromMainPage));
    },
    ClinicDetailWithBottomSheetsRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicDetailWithBottomSheetsRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i30.ClinicDetailWithBottomSheetsPage(
              key: args.key, selectedClinic: args.selectedClinic));
    },
    PriceRoute.name: (routeData) {
      final args = routeData.argsAs<PriceRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i31.PricePage(key: args.key, clinicId: args.clinicId));
    },
    SalesRoute.name: (routeData) {
      final args = routeData.argsAs<SalesRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i32.SalesPage(key: args.key, clinicId: args.clinicId));
    },
    HealthRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i33.HealthPage());
    },
    CardsRoute.name: (routeData) {
      final args = routeData.argsAs<CardsRouteArgs>(
          orElse: () => const CardsRouteArgs());
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i34.CardsPage(
              key: args.key, isChildrenPage: args.isChildrenPage));
    },
    DiaryRoute.name: (routeData) {
      final args = routeData.argsAs<DiaryRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i35.DiaryPage(
              key: args.key,
              title: args.title,
              categoryModel: args.categoryModel,
              syn: args.syn));
    },
    DiaryAddRoute.name: (routeData) {
      final args = routeData.argsAs<DiaryAddRouteArgs>();
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i36.DiaryAddPage(
              key: args.key,
              title: args.title,
              measureItem: args.measureItem,
              decimalDigits: args.decimalDigits,
              paramName: args.paramName,
              grouping: args.grouping,
              onSubmit: args.onSubmit,
              minValue: args.minValue,
              maxValue: args.maxValue,
              initialValues: args.initialValues,
              initialDate: args.initialDate));
    },
    RequireUpdateAppRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i37.RequireUpdateAppPage());
    },
    WrongLoginRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i38.WrongLoginPage());
    }
  };

  @override
  List<_i39.RouteConfig> get routes => [
        _i39.RouteConfig('/#redirect',
            path: '/', redirectTo: '/smartapp_login_page', fullMatch: true),
        _i39.RouteConfig(SmartappLoginRoute.name, path: '/smartapp_login_page'),
        _i39.RouteConfig(StartPhoneNumberRoute.name, path: '/login_phone'),
        _i39.RouteConfig(PasswordRoute.name, path: '/login_password'),
        _i39.RouteConfig(CreatePinCodeRoute.name, path: '/login_pin_code'),
        _i39.RouteConfig(CheckPinCodeRoute.name,
            path: '/login_pin_code_check', guards: [checkIsSavedPinCode]),
        _i39.RouteConfig(RecoverPasswordSmsRoute.name,
            path: '/login_recover_password_sms'),
        _i39.RouteConfig(RecoverPasswordNewRoute.name,
            path: '/login_recover_password_new'),
        _i39.RouteConfig(AuthUserAgreementsRoute.name,
            path: '/login_auth_user_agreements'),
        _i39.RouteConfig(UnauthSupportRoute.name,
            path: '/login_unauth_support'),
        _i39.RouteConfig(MainRoute.name,
            path: '/main', guards: [checkIsAuthSmartappUser]),
        _i39.RouteConfig(AppointmentsRoute.name,
            path: '/my_appointments', guards: [checkIsAuthSmartappUser]),
        _i39.RouteConfig(SubscribeProfilesListRoute.name,
            path: '/subscribe_profiles', guards: [checkIsAuthSmartappUser]),
        _i39.RouteConfig(ClinicsListRoute.name,
            path: '/subscribe_clinics', guards: [checkIsAuthUser]),
        _i39.RouteConfig(ServicesListRoute.name,
            path: '/subscribe_services', guards: [checkIsAuthUser]),
        _i39.RouteConfig(ResearchesListRoute.name,
            path: '/subscribe_researches', guards: [checkIsAuthUser]),
        _i39.RouteConfig(SpecialisationsListRoute.name,
            path: '/subscribe_specialisations', guards: [checkIsAuthUser]),
        _i39.RouteConfig(DoctorsListRoute.name,
            path: '/subscribe_doctors', guards: [checkIsAuthUser]),
        _i39.RouteConfig(ResearchCabinetsListRoute.name,
            path: '/subscribe_research_cabinets', guards: [checkIsAuthUser]),
        _i39.RouteConfig(FavoriteDoctorsListRoute.name,
            path: '/subscribe_favorite_doctors', guards: [checkIsAuthUser]),
        _i39.RouteConfig(ScheduleRoute.name,
            path: '/subscribe_schedule', guards: [checkIsAuthUser]),
        _i39.RouteConfig(ConfirmationSubscribeRoute.name,
            path: '/subscribe_confirm', guards: [checkIsAuthUser]),
        _i39.RouteConfig(PaymentRoute.name,
            path: '/subscribe_payment_page', guards: [checkIsAuthUser]),
        _i39.RouteConfig(MedcardProfilesListRoute.name,
            path: '/medcard', guards: [checkIsAuthSmartappUser]),
        _i39.RouteConfig(MedcardRoute.name,
            path: '/medcard_files_list', guards: [checkIsAuthUser]),
        _i39.RouteConfig(FilesRoute.name,
            path: '/medcard_user_files_list', guards: [checkIsAuthUser]),
        _i39.RouteConfig(SettingsRoute.name,
            path: '/settings', guards: [checkIsAuthUser]),
        _i39.RouteConfig(AgreementsRoute.name, path: '/settings_agreements'),
        _i39.RouteConfig(SupportRoute.name,
            path: '/settings_support', guards: [checkIsAuthUser]),
        _i39.RouteConfig(AllClinicsListRoute.name,
            path: '/clinic_info', guards: [checkIsAuthUser]),
        _i39.RouteConfig(ClinicDetailWithBottomSheetsRoute.name,
            path: '/clinic_info_details', guards: [checkIsAuthUser]),
        _i39.RouteConfig(PriceRoute.name,
            path: '/clinic_info_price', guards: [checkIsAuthUser]),
        _i39.RouteConfig(SalesRoute.name,
            path: '/clinic_info_sales', guards: [checkIsAuthUser]),
        _i39.RouteConfig(HealthRoute.name,
            path: '/health_profiles', guards: [checkIsAuthSmartappUser]),
        _i39.RouteConfig(CardsRoute.name,
            path: '/health', guards: [checkIsAuthUser]),
        _i39.RouteConfig(DiaryRoute.name,
            path: '/diary', guards: [checkIsAuthUser]),
        _i39.RouteConfig(DiaryAddRoute.name,
            path: '/diary_add', guards: [checkIsAuthUser]),
        _i39.RouteConfig(RequireUpdateAppRoute.name,
            path: '/require_updater_page'),
        _i39.RouteConfig(WrongLoginRoute.name, path: '/wrong_login')
      ];
}

/// generated route for
/// [_i1.SmartappLoginPage]
class SmartappLoginRoute extends _i39.PageRouteInfo<SmartappLoginRouteArgs> {
  SmartappLoginRoute({_i40.Key? key, _i39.NavigationResolver? resolver})
      : super(SmartappLoginRoute.name,
            path: '/smartapp_login_page',
            args: SmartappLoginRouteArgs(key: key, resolver: resolver));

  static const String name = 'SmartappLoginRoute';
}

class SmartappLoginRouteArgs {
  const SmartappLoginRouteArgs({this.key, this.resolver});

  final _i40.Key? key;

  final _i39.NavigationResolver? resolver;

  @override
  String toString() {
    return 'SmartappLoginRouteArgs{key: $key, resolver: $resolver}';
  }
}

/// generated route for
/// [_i2.StartPhoneNumberPage]
class StartPhoneNumberRoute
    extends _i39.PageRouteInfo<StartPhoneNumberRouteArgs> {
  StartPhoneNumberRoute({_i40.Key? key, bool isDeletingProfile = false})
      : super(StartPhoneNumberRoute.name,
            path: '/login_phone',
            args: StartPhoneNumberRouteArgs(
                key: key, isDeletingProfile: isDeletingProfile));

  static const String name = 'StartPhoneNumberRoute';
}

class StartPhoneNumberRouteArgs {
  const StartPhoneNumberRouteArgs({this.key, this.isDeletingProfile = false});

  final _i40.Key? key;

  final bool isDeletingProfile;

  @override
  String toString() {
    return 'StartPhoneNumberRouteArgs{key: $key, isDeletingProfile: $isDeletingProfile}';
  }
}

/// generated route for
/// [_i3.PasswordPage]
class PasswordRoute extends _i39.PageRouteInfo<PasswordRouteArgs> {
  PasswordRoute({_i40.Key? key, required String phoneNumber})
      : super(PasswordRoute.name,
            path: '/login_password',
            args: PasswordRouteArgs(key: key, phoneNumber: phoneNumber));

  static const String name = 'PasswordRoute';
}

class PasswordRouteArgs {
  const PasswordRouteArgs({this.key, required this.phoneNumber});

  final _i40.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'PasswordRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i4.CreatePinCodePage]
class CreatePinCodeRoute extends _i39.PageRouteInfo<CreatePinCodeRouteArgs> {
  CreatePinCodeRoute({_i40.Key? key, bool noUsedBiometric = false})
      : super(CreatePinCodeRoute.name,
            path: '/login_pin_code',
            args: CreatePinCodeRouteArgs(
                key: key, noUsedBiometric: noUsedBiometric));

  static const String name = 'CreatePinCodeRoute';
}

class CreatePinCodeRouteArgs {
  const CreatePinCodeRouteArgs({this.key, this.noUsedBiometric = false});

  final _i40.Key? key;

  final bool noUsedBiometric;

  @override
  String toString() {
    return 'CreatePinCodeRouteArgs{key: $key, noUsedBiometric: $noUsedBiometric}';
  }
}

/// generated route for
/// [_i5.CheckPinCodePage]
class CheckPinCodeRoute extends _i39.PageRouteInfo<void> {
  const CheckPinCodeRoute()
      : super(CheckPinCodeRoute.name, path: '/login_pin_code_check');

  static const String name = 'CheckPinCodeRoute';
}

/// generated route for
/// [_i6.RecoverPasswordSmsPage]
class RecoverPasswordSmsRoute
    extends _i39.PageRouteInfo<RecoverPasswordSmsRouteArgs> {
  RecoverPasswordSmsRoute({_i40.Key? key, required String phoneNumber})
      : super(RecoverPasswordSmsRoute.name,
            path: '/login_recover_password_sms',
            args: RecoverPasswordSmsRouteArgs(
                key: key, phoneNumber: phoneNumber));

  static const String name = 'RecoverPasswordSmsRoute';
}

class RecoverPasswordSmsRouteArgs {
  const RecoverPasswordSmsRouteArgs({this.key, required this.phoneNumber});

  final _i40.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RecoverPasswordSmsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i7.RecoverPasswordNewPage]
class RecoverPasswordNewRoute
    extends _i39.PageRouteInfo<RecoverPasswordNewRouteArgs> {
  RecoverPasswordNewRoute({_i40.Key? key, required String smsToken})
      : super(RecoverPasswordNewRoute.name,
            path: '/login_recover_password_new',
            args: RecoverPasswordNewRouteArgs(key: key, smsToken: smsToken));

  static const String name = 'RecoverPasswordNewRoute';
}

class RecoverPasswordNewRouteArgs {
  const RecoverPasswordNewRouteArgs({this.key, required this.smsToken});

  final _i40.Key? key;

  final String smsToken;

  @override
  String toString() {
    return 'RecoverPasswordNewRouteArgs{key: $key, smsToken: $smsToken}';
  }
}

/// generated route for
/// [_i8.AuthUserAgreementsPage]
class AuthUserAgreementsRoute
    extends _i39.PageRouteInfo<AuthUserAgreementsRouteArgs> {
  AuthUserAgreementsRoute({_i40.Key? key, bool isFullScreen = false})
      : super(AuthUserAgreementsRoute.name,
            path: '/login_auth_user_agreements',
            args: AuthUserAgreementsRouteArgs(
                key: key, isFullScreen: isFullScreen));

  static const String name = 'AuthUserAgreementsRoute';
}

class AuthUserAgreementsRouteArgs {
  const AuthUserAgreementsRouteArgs({this.key, this.isFullScreen = false});

  final _i40.Key? key;

  final bool isFullScreen;

  @override
  String toString() {
    return 'AuthUserAgreementsRouteArgs{key: $key, isFullScreen: $isFullScreen}';
  }
}

/// generated route for
/// [_i9.UnauthSupportPage]
class UnauthSupportRoute extends _i39.PageRouteInfo<void> {
  const UnauthSupportRoute()
      : super(UnauthSupportRoute.name, path: '/login_unauth_support');

  static const String name = 'UnauthSupportRoute';
}

/// generated route for
/// [_i10.MainPage]
class MainRoute extends _i39.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i11.AppointmentsPage]
class AppointmentsRoute extends _i39.PageRouteInfo<AppointmentsRouteArgs> {
  AppointmentsRoute({_i40.Key? key, bool? isRefresh = false})
      : super(AppointmentsRoute.name,
            path: '/my_appointments',
            args: AppointmentsRouteArgs(key: key, isRefresh: isRefresh));

  static const String name = 'AppointmentsRoute';
}

class AppointmentsRouteArgs {
  const AppointmentsRouteArgs({this.key, this.isRefresh = false});

  final _i40.Key? key;

  final bool? isRefresh;

  @override
  String toString() {
    return 'AppointmentsRouteArgs{key: $key, isRefresh: $isRefresh}';
  }
}

/// generated route for
/// [_i12.SubscribeProfilesListPage]
class SubscribeProfilesListRoute extends _i39.PageRouteInfo<void> {
  const SubscribeProfilesListRoute()
      : super(SubscribeProfilesListRoute.name, path: '/subscribe_profiles');

  static const String name = 'SubscribeProfilesListRoute';
}

/// generated route for
/// [_i13.ClinicsListPage]
class ClinicsListRoute extends _i39.PageRouteInfo<ClinicsListRouteArgs> {
  ClinicsListRoute(
      {_i40.Key? key, required String userId, required bool isChildrenPage})
      : super(ClinicsListRoute.name,
            path: '/subscribe_clinics',
            args: ClinicsListRouteArgs(
                key: key, userId: userId, isChildrenPage: isChildrenPage));

  static const String name = 'ClinicsListRoute';
}

class ClinicsListRouteArgs {
  const ClinicsListRouteArgs(
      {this.key, required this.userId, required this.isChildrenPage});

  final _i40.Key? key;

  final String userId;

  final bool isChildrenPage;

  @override
  String toString() {
    return 'ClinicsListRouteArgs{key: $key, userId: $userId, isChildrenPage: $isChildrenPage}';
  }
}

/// generated route for
/// [_i14.ServicesListPage]
class ServicesListRoute extends _i39.PageRouteInfo<ServicesListRouteArgs> {
  ServicesListRoute(
      {_i40.Key? key,
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

  final _i40.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  @override
  String toString() {
    return 'ServicesListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i15.ResearchesListPage]
class ResearchesListRoute extends _i39.PageRouteInfo<ResearchesListRouteArgs> {
  ResearchesListRoute(
      {_i40.Key? key,
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

  final _i40.Key? key;

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
/// [_i16.SpecialisationsListPage]
class SpecialisationsListRoute
    extends _i39.PageRouteInfo<SpecialisationsListRouteArgs> {
  SpecialisationsListRoute(
      {_i40.Key? key,
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

  final _i40.Key? key;

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
/// [_i17.DoctorsListPage]
class DoctorsListRoute extends _i39.PageRouteInfo<DoctorsListRouteArgs> {
  DoctorsListRoute(
      {_i40.Key? key,
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

  final _i40.Key? key;

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
/// [_i18.ResearchCabinetsListPage]
class ResearchCabinetsListRoute
    extends _i39.PageRouteInfo<ResearchCabinetsListRouteArgs> {
  ResearchCabinetsListRoute(
      {_i40.Key? key,
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

  final _i40.Key? key;

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
/// [_i19.FavoriteDoctorsListPage]
class FavoriteDoctorsListRoute
    extends _i39.PageRouteInfo<FavoriteDoctorsListRouteArgs> {
  FavoriteDoctorsListRoute(
      {_i40.Key? key,
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

  final _i40.Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  @override
  String toString() {
    return 'FavoriteDoctorsListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i20.SchedulePage]
class ScheduleRoute extends _i39.PageRouteInfo<ScheduleRouteArgs> {
  ScheduleRoute(
      {_i40.Key? key,
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

  final _i40.Key? key;

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
/// [_i21.ConfirmationSubscribePage]
class ConfirmationSubscribeRoute
    extends _i39.PageRouteInfo<ConfirmationSubscribeRouteArgs> {
  ConfirmationSubscribeRoute(
      {_i40.Key? key, required String userId, required int timeZoneHours})
      : super(ConfirmationSubscribeRoute.name,
            path: '/subscribe_confirm',
            args: ConfirmationSubscribeRouteArgs(
                key: key, userId: userId, timeZoneHours: timeZoneHours));

  static const String name = 'ConfirmationSubscribeRoute';
}

class ConfirmationSubscribeRouteArgs {
  const ConfirmationSubscribeRouteArgs(
      {this.key, required this.userId, required this.timeZoneHours});

  final _i40.Key? key;

  final String userId;

  final int timeZoneHours;

  @override
  String toString() {
    return 'ConfirmationSubscribeRouteArgs{key: $key, userId: $userId, timeZoneHours: $timeZoneHours}';
  }
}

/// generated route for
/// [_i22.PaymentPage]
class PaymentRoute extends _i39.PageRouteInfo<PaymentRouteArgs> {
  PaymentRoute({_i40.Key? key, required String userId})
      : super(PaymentRoute.name,
            path: '/subscribe_payment_page',
            args: PaymentRouteArgs(key: key, userId: userId));

  static const String name = 'PaymentRoute';
}

class PaymentRouteArgs {
  const PaymentRouteArgs({this.key, required this.userId});

  final _i40.Key? key;

  final String userId;

  @override
  String toString() {
    return 'PaymentRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i23.MedcardProfilesListPage]
class MedcardProfilesListRoute extends _i39.PageRouteInfo<void> {
  const MedcardProfilesListRoute()
      : super(MedcardProfilesListRoute.name, path: '/medcard');

  static const String name = 'MedcardProfilesListRoute';
}

/// generated route for
/// [_i24.MedcardPage]
class MedcardRoute extends _i39.PageRouteInfo<MedcardRouteArgs> {
  MedcardRoute(
      {_i40.Key? key, required String userId, required bool isChildrenPage})
      : super(MedcardRoute.name,
            path: '/medcard_files_list',
            args: MedcardRouteArgs(
                key: key, userId: userId, isChildrenPage: isChildrenPage));

  static const String name = 'MedcardRoute';
}

class MedcardRouteArgs {
  const MedcardRouteArgs(
      {this.key, required this.userId, required this.isChildrenPage});

  final _i40.Key? key;

  final String userId;

  final bool isChildrenPage;

  @override
  String toString() {
    return 'MedcardRouteArgs{key: $key, userId: $userId, isChildrenPage: $isChildrenPage}';
  }
}

/// generated route for
/// [_i25.FilesPage]
class FilesRoute extends _i39.PageRouteInfo<FilesRouteArgs> {
  FilesRoute({_i40.Key? key, required String userId})
      : super(FilesRoute.name,
            path: '/medcard_user_files_list',
            args: FilesRouteArgs(key: key, userId: userId));

  static const String name = 'FilesRoute';
}

class FilesRouteArgs {
  const FilesRouteArgs({this.key, required this.userId});

  final _i40.Key? key;

  final String userId;

  @override
  String toString() {
    return 'FilesRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i26.SettingsPage]
class SettingsRoute extends _i39.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i27.AgreementsPage]
class AgreementsRoute extends _i39.PageRouteInfo<AgreementsRouteArgs> {
  AgreementsRoute({_i40.Key? key, bool isAppointmentAgreements = false})
      : super(AgreementsRoute.name,
            path: '/settings_agreements',
            args: AgreementsRouteArgs(
                key: key, isAppointmentAgreements: isAppointmentAgreements));

  static const String name = 'AgreementsRoute';
}

class AgreementsRouteArgs {
  const AgreementsRouteArgs({this.key, this.isAppointmentAgreements = false});

  final _i40.Key? key;

  final bool isAppointmentAgreements;

  @override
  String toString() {
    return 'AgreementsRouteArgs{key: $key, isAppointmentAgreements: $isAppointmentAgreements}';
  }
}

/// generated route for
/// [_i28.SupportPage]
class SupportRoute extends _i39.PageRouteInfo<void> {
  const SupportRoute() : super(SupportRoute.name, path: '/settings_support');

  static const String name = 'SupportRoute';
}

/// generated route for
/// [_i29.AllClinicsListPage]
class AllClinicsListRoute extends _i39.PageRouteInfo<AllClinicsListRouteArgs> {
  AllClinicsListRoute({_i40.Key? key, bool isFromMainPage = false})
      : super(AllClinicsListRoute.name,
            path: '/clinic_info',
            args: AllClinicsListRouteArgs(
                key: key, isFromMainPage: isFromMainPage));

  static const String name = 'AllClinicsListRoute';
}

class AllClinicsListRouteArgs {
  const AllClinicsListRouteArgs({this.key, this.isFromMainPage = false});

  final _i40.Key? key;

  final bool isFromMainPage;

  @override
  String toString() {
    return 'AllClinicsListRouteArgs{key: $key, isFromMainPage: $isFromMainPage}';
  }
}

/// generated route for
/// [_i30.ClinicDetailWithBottomSheetsPage]
class ClinicDetailWithBottomSheetsRoute
    extends _i39.PageRouteInfo<ClinicDetailWithBottomSheetsRouteArgs> {
  ClinicDetailWithBottomSheetsRoute(
      {_i40.Key? key, required _i42.ClinicModel selectedClinic})
      : super(ClinicDetailWithBottomSheetsRoute.name,
            path: '/clinic_info_details',
            args: ClinicDetailWithBottomSheetsRouteArgs(
                key: key, selectedClinic: selectedClinic));

  static const String name = 'ClinicDetailWithBottomSheetsRoute';
}

class ClinicDetailWithBottomSheetsRouteArgs {
  const ClinicDetailWithBottomSheetsRouteArgs(
      {this.key, required this.selectedClinic});

  final _i40.Key? key;

  final _i42.ClinicModel selectedClinic;

  @override
  String toString() {
    return 'ClinicDetailWithBottomSheetsRouteArgs{key: $key, selectedClinic: $selectedClinic}';
  }
}

/// generated route for
/// [_i31.PricePage]
class PriceRoute extends _i39.PageRouteInfo<PriceRouteArgs> {
  PriceRoute({_i40.Key? key, required String clinicId})
      : super(PriceRoute.name,
            path: '/clinic_info_price',
            args: PriceRouteArgs(key: key, clinicId: clinicId));

  static const String name = 'PriceRoute';
}

class PriceRouteArgs {
  const PriceRouteArgs({this.key, required this.clinicId});

  final _i40.Key? key;

  final String clinicId;

  @override
  String toString() {
    return 'PriceRouteArgs{key: $key, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i32.SalesPage]
class SalesRoute extends _i39.PageRouteInfo<SalesRouteArgs> {
  SalesRoute({_i40.Key? key, required String clinicId})
      : super(SalesRoute.name,
            path: '/clinic_info_sales',
            args: SalesRouteArgs(key: key, clinicId: clinicId));

  static const String name = 'SalesRoute';
}

class SalesRouteArgs {
  const SalesRouteArgs({this.key, required this.clinicId});

  final _i40.Key? key;

  final String clinicId;

  @override
  String toString() {
    return 'SalesRouteArgs{key: $key, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i33.HealthPage]
class HealthRoute extends _i39.PageRouteInfo<void> {
  const HealthRoute() : super(HealthRoute.name, path: '/health_profiles');

  static const String name = 'HealthRoute';
}

/// generated route for
/// [_i34.CardsPage]
class CardsRoute extends _i39.PageRouteInfo<CardsRouteArgs> {
  CardsRoute({_i40.Key? key, bool isChildrenPage = false})
      : super(CardsRoute.name,
            path: '/health',
            args: CardsRouteArgs(key: key, isChildrenPage: isChildrenPage));

  static const String name = 'CardsRoute';
}

class CardsRouteArgs {
  const CardsRouteArgs({this.key, this.isChildrenPage = false});

  final _i40.Key? key;

  final bool isChildrenPage;

  @override
  String toString() {
    return 'CardsRouteArgs{key: $key, isChildrenPage: $isChildrenPage}';
  }
}

/// generated route for
/// [_i35.DiaryPage]
class DiaryRoute extends _i39.PageRouteInfo<DiaryRouteArgs> {
  DiaryRoute(
      {_i40.Key? key,
      required String title,
      required _i43.DiaryCategoryModel categoryModel,
      required String syn})
      : super(DiaryRoute.name,
            path: '/diary',
            args: DiaryRouteArgs(
                key: key,
                title: title,
                categoryModel: categoryModel,
                syn: syn));

  static const String name = 'DiaryRoute';
}

class DiaryRouteArgs {
  const DiaryRouteArgs(
      {this.key,
      required this.title,
      required this.categoryModel,
      required this.syn});

  final _i40.Key? key;

  final String title;

  final _i43.DiaryCategoryModel categoryModel;

  final String syn;

  @override
  String toString() {
    return 'DiaryRouteArgs{key: $key, title: $title, categoryModel: $categoryModel, syn: $syn}';
  }
}

/// generated route for
/// [_i36.DiaryAddPage]
class DiaryAddRoute extends _i39.PageRouteInfo<DiaryAddRouteArgs> {
  DiaryAddRoute(
      {_i40.Key? key,
      required String title,
      required String measureItem,
      required int decimalDigits,
      required List<String> paramName,
      required String grouping,
      required dynamic Function(String, DateTime, DateTime) onSubmit,
      required List<double> minValue,
      required List<double> maxValue,
      List<double>? initialValues,
      DateTime? initialDate})
      : super(DiaryAddRoute.name,
            path: '/diary_add',
            args: DiaryAddRouteArgs(
                key: key,
                title: title,
                measureItem: measureItem,
                decimalDigits: decimalDigits,
                paramName: paramName,
                grouping: grouping,
                onSubmit: onSubmit,
                minValue: minValue,
                maxValue: maxValue,
                initialValues: initialValues,
                initialDate: initialDate));

  static const String name = 'DiaryAddRoute';
}

class DiaryAddRouteArgs {
  const DiaryAddRouteArgs(
      {this.key,
      required this.title,
      required this.measureItem,
      required this.decimalDigits,
      required this.paramName,
      required this.grouping,
      required this.onSubmit,
      required this.minValue,
      required this.maxValue,
      this.initialValues,
      this.initialDate});

  final _i40.Key? key;

  final String title;

  final String measureItem;

  final int decimalDigits;

  final List<String> paramName;

  final String grouping;

  final dynamic Function(String, DateTime, DateTime) onSubmit;

  final List<double> minValue;

  final List<double> maxValue;

  final List<double>? initialValues;

  final DateTime? initialDate;

  @override
  String toString() {
    return 'DiaryAddRouteArgs{key: $key, title: $title, measureItem: $measureItem, decimalDigits: $decimalDigits, paramName: $paramName, grouping: $grouping, onSubmit: $onSubmit, minValue: $minValue, maxValue: $maxValue, initialValues: $initialValues, initialDate: $initialDate}';
  }
}

/// generated route for
/// [_i37.RequireUpdateAppPage]
class RequireUpdateAppRoute extends _i39.PageRouteInfo<void> {
  const RequireUpdateAppRoute()
      : super(RequireUpdateAppRoute.name, path: '/require_updater_page');

  static const String name = 'RequireUpdateAppRoute';
}

/// generated route for
/// [_i38.WrongLoginPage]
class WrongLoginRoute extends _i39.PageRouteInfo<void> {
  const WrongLoginRoute() : super(WrongLoginRoute.name, path: '/wrong_login');

  static const String name = 'WrongLoginRoute';
}
