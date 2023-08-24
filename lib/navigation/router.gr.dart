// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i37;
import 'package:flutter/cupertino.dart' as _i40;
import 'package:flutter/material.dart' as _i38;
import 'package:medlike/data/models/clinic_models/clinic_models.dart' as _i41;
import 'package:medlike/data/models/diary_models/diary_models.dart' as _i42;
import 'package:medlike/modules/about_clinic/all_clinics_list/all_clinics_list_page.dart'
    as _i28;
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/clinic_detail_with_bottom_sheets_page.dart'
    as _i29;
import 'package:medlike/modules/about_clinic/price/price_page.dart' as _i30;
import 'package:medlike/modules/about_clinic/sales/sales_page.dart' as _i31;
import 'package:medlike/modules/appointments/appointments_page.dart' as _i10;
import 'package:medlike/modules/health/diary_add_page/diary_add_page.dart'
    as _i35;
import 'package:medlike/modules/health/diary_page/diary_page.dart' as _i34;
import 'package:medlike/modules/health/health_page/cards_page.dart' as _i33;
import 'package:medlike/modules/health/health_page/health_page.dart' as _i32;
import 'package:medlike/modules/login/auth_user_agreements/auth_user_agreements_page.dart'
    as _i7;
import 'package:medlike/modules/login/check_pin_code_page/check_pin_code_page.dart'
    as _i4;
import 'package:medlike/modules/login/create_pin_code_page/pin_code_page.dart'
    as _i3;
import 'package:medlike/modules/login/password_page/password_page.dart' as _i2;
import 'package:medlike/modules/login/recover_passvord/recover_password_new_page.dart'
    as _i6;
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_page.dart'
    as _i5;
import 'package:medlike/modules/login/start_phone_number_page/start_phone_number_page.dart'
    as _i1;
import 'package:medlike/modules/login/unauth_support/unauth_support_page.dart'
    as _i8;
import 'package:medlike/modules/main_page/main_page.dart' as _i9;
import 'package:medlike/modules/medcard/files/files_page.dart' as _i24;
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_page.dart'
    as _i23;
import 'package:medlike/modules/medcard/profiles_list/profiles_list_page.dart'
    as _i22;
import 'package:medlike/modules/require_update_app/require_update_app_page.dart'
    as _i36;
import 'package:medlike/modules/settings/agreements/agreements_page.dart'
    as _i26;
import 'package:medlike/modules/settings/settings_page.dart' as _i25;
import 'package:medlike/modules/settings/support/support_page.dart' as _i27;
import 'package:medlike/modules/subscribe/clinics_list/clinics_list_page.dart'
    as _i12;
import 'package:medlike/modules/subscribe/confirmation_subscribe/confirmation_subscribe_page.dart'
    as _i20;
import 'package:medlike/modules/subscribe/confirmation_subscribe/payment_page.dart'
    as _i21;
import 'package:medlike/modules/subscribe/doctors_list/doctors_list_page.dart'
    as _i16;
import 'package:medlike/modules/subscribe/favorite_doctors_list/favorite_doctors_list_page.dart'
    as _i18;
import 'package:medlike/modules/subscribe/profiles_list/profiles_list_page.dart'
    as _i11;
import 'package:medlike/modules/subscribe/research_cabinets_list/research_cabinets_list_page.dart'
    as _i17;
import 'package:medlike/modules/subscribe/researches_list/researches_list_page.dart'
    as _i14;
import 'package:medlike/modules/subscribe/schedule/schedule_page.dart' as _i19;
import 'package:medlike/modules/subscribe/services_list/services_list_page.dart'
    as _i13;
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list_page.dart'
    as _i15;
import 'package:medlike/navigation/guards.dart' as _i39;

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FaqsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FaqsPage(),
      );
    },
    FaqItemRoute.name: (routeData) {
      final args = routeData.argsAs<FaqItemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FaqItemPage(
          key: args.key,
          question: args.question,
          answer: args.answer,
        ),
      );
    },
    AgreementsRoute.name: (routeData) {
      final args = routeData.argsAs<AgreementsRouteArgs>(
          orElse: () => const AgreementsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AgreementsPage(
          key: args.key,
          isAppointmentAgreements: args.isAppointmentAgreements,
        ),
      );
    },
    SupportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupportPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    AppointmentsRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentsRouteArgs>(
          orElse: () => const AppointmentsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppointmentsPage(
          key: args.key,
          isRefresh: args.isRefresh,
          initDay: args.initDay,
          notificationId: args.notificationId,
        ),
      );
    },
    FeedbackRoute.name: (routeData) {
      final args = routeData.argsAs<FeedbackRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FeedbackPage(
          key: args.key,
          appointmentId: args.appointmentId,
          rating: args.rating,
          controllerCaption: args.controllerCaption,
          controllerVisible: args.controllerVisible,
          controllerMessage: args.controllerMessage,
          controllerEmail: args.controllerEmail,
        ),
      );
    },
    AppointmentDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppointmentDetailPage(
          key: args.key,
          appointmentItem: args.appointmentItem,
        ),
      );
    },
    CardsRoute.name: (routeData) {
      final args = routeData.argsAs<CardsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CardsPage(
          key: args.key,
          isChildrenPage: args.isChildrenPage,
        ),
      );
    },
    HealthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HealthPage(),
      );
    },
    HealthForMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HealthForMainPage(),
      );
    },
    DiaryAddRoute.name: (routeData) {
      final args = routeData.argsAs<DiaryAddRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DiaryAddPage(
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
          initialDate: args.initialDate,
        ),
      );
    },
    DiaryRoute.name: (routeData) {
      final args = routeData.argsAs<DiaryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DiaryPage(
          key: args.key,
          title: args.title,
          categoryModel: args.categoryModel,
          syn: args.syn,
        ),
      );
    },
    AllClinicsListRoute.name: (routeData) {
      final args = routeData.argsAs<AllClinicsListRouteArgs>(
          orElse: () => const AllClinicsListRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllClinicsListPage(
          key: args.key,
          isFromMainPage: args.isFromMainPage,
        ),
      );
    },
    ClinicForDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicForDetailsRouteArgs>(
          orElse: () => const ClinicForDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClinicForDetailsPage(
          key: args.key,
          isFromMainPage: args.isFromMainPage,
        ),
      );
    },
    ClinicForMainRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicForMainRouteArgs>(
          orElse: () => const ClinicForMainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClinicForMainPage(
          key: args.key,
          isFromMainPage: args.isFromMainPage,
        ),
      );
    },
    SalesRoute.name: (routeData) {
      final args = routeData.argsAs<SalesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SalesPage(
          key: args.key,
          clinicId: args.clinicId,
        ),
      );
    },
    PriceRoute.name: (routeData) {
      final args = routeData.argsAs<PriceRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PricePage(
          key: args.key,
          clinicId: args.clinicId,
        ),
      );
    },
    ClinicDetailWithBottomSheetsRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicDetailWithBottomSheetsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClinicDetailWithBottomSheetsPage(
          key: args.key,
          selectedClinic: args.selectedClinic,
        ),
      );
    },
    DoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorsListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoctorsListPage(
          key: args.key,
          userId: args.userId,
          buildingId: args.buildingId,
          clinicId: args.clinicId,
          categoryTypeId: args.categoryTypeId,
          specialisationId: args.specialisationId,
          specialisationName: args.specialisationName,
        ),
      );
    },
    ScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SchedulePage(
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
          isFavorite: args.isFavorite,
        ),
      );
    },
    SubscribeProfilesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubscribeProfilesListPage(),
      );
    },
    ResearchCabinetsListRoute.name: (routeData) {
      final args = routeData.argsAs<ResearchCabinetsListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResearchCabinetsListPage(
          key: args.key,
          userId: args.userId,
          buildingId: args.buildingId,
          clinicId: args.clinicId,
          categoryTypeId: args.categoryTypeId,
          researchIds: args.researchIds,
        ),
      );
    },
    FavoriteDoctorsListRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteDoctorsListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FavoriteDoctorsListPage(
          key: args.key,
          userId: args.userId,
          buildingId: args.buildingId,
          clinicId: args.clinicId,
        ),
      );
    },
    ServicesListRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServicesListPage(
          key: args.key,
          userId: args.userId,
          buildingId: args.buildingId,
          clinicId: args.clinicId,
        ),
      );
    },
    ConfirmationSubscribeRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmationSubscribeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConfirmationSubscribePage(
          key: args.key,
          userId: args.userId,
          timeZoneHours: args.timeZoneHours,
        ),
      );
    },
    PaymentRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ResearchesListRoute.name: (routeData) {
      final args = routeData.argsAs<ResearchesListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResearchesListPage(
          key: args.key,
          userId: args.userId,
          buildingId: args.buildingId,
          clinicId: args.clinicId,
          categoryTypeId: args.categoryTypeId,
        ),
      );
    },
    ClinicsListRoute.name: (routeData) {
      final args = routeData.argsAs<ClinicsListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClinicsListPage(
          key: args.key,
          userId: args.userId,
          isChildrenPage: args.isChildrenPage,
        ),
      );
    },
    SpecialisationsListRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialisationsListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SpecialisationsListPage(
          key: args.key,
          userId: args.userId,
          buildingId: args.buildingId,
          clinicId: args.clinicId,
          categoryTypeId: args.categoryTypeId,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MedcardProfilesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MedcardProfilesListPage(),
      );
    },
    MedcardRoute.name: (routeData) {
      final args = routeData.argsAs<MedcardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MedcardPage(
          key: args.key,
          userId: args.userId,
          isChildrenPage: args.isChildrenPage,
          eventId: args.eventId,
        ),
      );
    },
    FilesRoute.name: (routeData) {
      final args = routeData.argsAs<FilesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FilesPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    DocumentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DocumentsPage(),
      );
    },
    DocumentRoute.name: (routeData) {
      final args = routeData.argsAs<DocumentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DocumentPage(
          key: args.key,
          document: args.document,
        ),
      );
    },
    RequireUpdateAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RequireUpdateAppPage(),
      );
    },
    CreatePinCodeRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePinCodeRouteArgs>(
          orElse: () => const CreatePinCodeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreatePinCodePage(
          key: args.key,
          noUsedBiometric: args.noUsedBiometric,
        ),
      );
    },
    UnauthSupportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnauthSupportPage(),
      );
    },
    EsiaLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EsiaLoginPage(),
      );
    },
    EsiaRegisterRoute.name: (routeData) {
      final args = routeData.argsAs<EsiaRegisterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EsiaRegisterPage(
          key: args.key,
          firstName: args.firstName,
          lastName: args.lastName,
          middleName: args.middleName,
          phoneNumber: args.phoneNumber,
          snils: args.snils,
          sex: args.sex,
          birthday: args.birthday,
          passportSerial: args.passportSerial,
          passportNumber: args.passportNumber,
          passportIssueDate: args.passportIssueDate,
          passportIssueId: args.passportIssueId,
          esiaToken: args.esiaToken,
        ),
      );
    },
    RecoverPasswordNewRoute.name: (routeData) {
      final args = routeData.argsAs<RecoverPasswordNewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecoverPasswordNewPage(
          key: args.key,
          smsToken: args.smsToken,
        ),
      );
    },
    HealthRouteForMain.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i32.HealthPageForMain());
    },
    CardsRoute.name: (routeData) {
      final args = routeData.argsAs<CardsRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i33.CardsPage(
              key: args.key, isChildrenPage: args.isChildrenPage));
    },
    StartPhoneNumberRoute.name: (routeData) {
      final args = routeData.argsAs<StartPhoneNumberRouteArgs>(
          orElse: () => const StartPhoneNumberRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StartPhoneNumberPage(
          key: args.key,
          isDeletingProfile: args.isDeletingProfile,
        ),
      );
    },
    AuthUserAgreementsRoute.name: (routeData) {
      final args = routeData.argsAs<AuthUserAgreementsRouteArgs>(
          orElse: () => const AuthUserAgreementsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthUserAgreementsPage(
          key: args.key,
          isFullScreen: args.isFullScreen,
        ),
      );
    },
    CheckPinCodeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CheckPinCodePage(),
      );
    },
    PasswordRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PasswordPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.StartPhoneNumberPage]
class StartPhoneNumberRoute
    extends _i37.PageRouteInfo<StartPhoneNumberRouteArgs> {
  StartPhoneNumberRoute({_i40.Key? key, bool isDeletingProfile = false})
      : super(StartPhoneNumberRoute.name,
            path: '/login_phone',
            args: StartPhoneNumberRouteArgs(
                key: key, isDeletingProfile: isDeletingProfile));

  static const String name = 'StartPhoneNumberRoute';
}

  static const String name = 'FaqsRoute';

  final _i40.Key? key;

  final bool isDeletingProfile;

  @override
  String toString() {
    return 'StartPhoneNumberRouteArgs{key: $key, isDeletingProfile: $isDeletingProfile}';
  }
}

/// generated route for
/// [_i2.PasswordPage]
class PasswordRoute extends _i37.PageRouteInfo<PasswordRouteArgs> {
  PasswordRoute({_i40.Key? key, required String phoneNumber})
      : super(PasswordRoute.name,
            path: '/login_password',
            args: PasswordRouteArgs(key: key, phoneNumber: phoneNumber));

  static const PageInfo<FaqItemRouteArgs> page =
      PageInfo<FaqItemRouteArgs>(name);
}

class FaqItemRouteArgs {
  const FaqItemRouteArgs({
    this.key,
    required this.question,
    required this.answer,
  });

  final _i40.Key? key;

  final String question;

  final String answer;

  @override
  String toString() {
    return 'FaqItemRouteArgs{key: $key, question: $question, answer: $answer}';
  }
}

/// generated route for
/// [_i3.CreatePinCodePage]
class CreatePinCodeRoute extends _i37.PageRouteInfo<CreatePinCodeRouteArgs> {
  CreatePinCodeRoute({_i40.Key? key, bool noUsedBiometric = false})
      : super(CreatePinCodeRoute.name,
            path: '/login_pin_code',
            args: CreatePinCodeRouteArgs(
                key: key, noUsedBiometric: noUsedBiometric));

  static const String name = 'AgreementsRoute';

  static const PageInfo<AgreementsRouteArgs> page =
      PageInfo<AgreementsRouteArgs>(name);
}

class AgreementsRouteArgs {
  const AgreementsRouteArgs({
    this.key,
    this.isAppointmentAgreements = false,
  });

  final _i40.Key? key;

  final bool isAppointmentAgreements;

  @override
  String toString() {
    return 'AgreementsRouteArgs{key: $key, isAppointmentAgreements: $isAppointmentAgreements}';
  }
}

/// generated route for
/// [SupportPage]
class SupportRoute extends PageRouteInfo<void> {
  const SupportRoute({List<PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [_i5.RecoverPasswordSmsPage]
class RecoverPasswordSmsRoute
    extends _i37.PageRouteInfo<RecoverPasswordSmsRouteArgs> {
  RecoverPasswordSmsRoute({_i40.Key? key, required String phoneNumber})
      : super(RecoverPasswordSmsRoute.name,
            path: '/login_recover_password_sms',
            args: RecoverPasswordSmsRouteArgs(
                key: key, phoneNumber: phoneNumber));

  static const String name = 'RecoverPasswordSmsRoute';
}

  static const String name = 'SettingsRoute';

  final _i40.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RecoverPasswordSmsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i6.RecoverPasswordNewPage]
class RecoverPasswordNewRoute
    extends _i37.PageRouteInfo<RecoverPasswordNewRouteArgs> {
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
/// [_i7.AuthUserAgreementsPage]
class AuthUserAgreementsRoute
    extends _i37.PageRouteInfo<AuthUserAgreementsRouteArgs> {
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
/// [_i8.UnauthSupportPage]
class UnauthSupportRoute extends _i37.PageRouteInfo<void> {
  const UnauthSupportRoute()
      : super(UnauthSupportRoute.name, path: '/login_unauth_support');

  static const String name = 'UnauthSupportRoute';
}

/// generated route for
/// [_i9.MainPage]
class MainRoute extends _i37.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i10.AppointmentsPage]
class AppointmentsRoute extends _i37.PageRouteInfo<AppointmentsRouteArgs> {
  AppointmentsRoute(
      {_i40.Key? key,
      bool? isRefresh = false,
      DateTime? initDay,
      String? notificationId})
      : super(AppointmentsRoute.name,
            path: '/my_appointments',
            args: AppointmentsRouteArgs(
                key: key,
                isRefresh: isRefresh,
                initDay: initDay,
                notificationId: notificationId));

  static const String name = 'AppointmentsRoute';

  static const PageInfo<AppointmentsRouteArgs> page =
      PageInfo<AppointmentsRouteArgs>(name);
}

class AppointmentsRouteArgs {
  const AppointmentsRouteArgs({
    this.key,
    this.isRefresh = false,
    this.initDay,
    this.notificationId,
  });

  final _i40.Key? key;

  final bool? isRefresh;

  final DateTime? initDay;

  final String? notificationId;

  @override
  String toString() {
    return 'AppointmentsRouteArgs{key: $key, isRefresh: $isRefresh, initDay: $initDay, notificationId: $notificationId}';
  }
}

/// generated route for
/// [FeedbackPage]
class FeedbackRoute extends PageRouteInfo<FeedbackRouteArgs> {
  FeedbackRoute({
    Key? key,
    required String appointmentId,
    required int rating,
    required String controllerCaption,
    required String controllerVisible,
    required String controllerMessage,
    required String controllerEmail,
    List<PageRouteInfo>? children,
  }) : super(
          FeedbackRoute.name,
          args: FeedbackRouteArgs(
            key: key,
            appointmentId: appointmentId,
            rating: rating,
            controllerCaption: controllerCaption,
            controllerVisible: controllerVisible,
            controllerMessage: controllerMessage,
            controllerEmail: controllerEmail,
          ),
          initialChildren: children,
        );

  static const String name = 'FeedbackRoute';

  static const PageInfo<FeedbackRouteArgs> page =
      PageInfo<FeedbackRouteArgs>(name);
}

class FeedbackRouteArgs {
  const FeedbackRouteArgs({
    this.key,
    required this.appointmentId,
    required this.rating,
    required this.controllerCaption,
    required this.controllerVisible,
    required this.controllerMessage,
    required this.controllerEmail,
  });

  final Key? key;

  final String appointmentId;

  final int rating;

  final String controllerCaption;

  final String controllerVisible;

  final String controllerMessage;

  final String controllerEmail;

  @override
  String toString() {
    return 'FeedbackRouteArgs{key: $key, appointmentId: $appointmentId, rating: $rating, controllerCaption: $controllerCaption, controllerVisible: $controllerVisible, controllerMessage: $controllerMessage, controllerEmail: $controllerEmail}';
  }
}

/// generated route for
/// [AppointmentDetailPage]
class AppointmentDetailRoute extends PageRouteInfo<AppointmentDetailRouteArgs> {
  AppointmentDetailRoute({
    Key? key,
    required AppointmentModelWithTimeZoneOffset appointmentItem,
    List<PageRouteInfo>? children,
  }) : super(
          AppointmentDetailRoute.name,
          args: AppointmentDetailRouteArgs(
            key: key,
            appointmentItem: appointmentItem,
          ),
          initialChildren: children,
        );

  static const String name = 'AppointmentDetailRoute';

  static const PageInfo<AppointmentDetailRouteArgs> page =
      PageInfo<AppointmentDetailRouteArgs>(name);
}

class AppointmentDetailRouteArgs {
  const AppointmentDetailRouteArgs({
    this.key,
    required this.appointmentItem,
  });

  final Key? key;

  final AppointmentModelWithTimeZoneOffset appointmentItem;

  @override
  String toString() {
    return 'AppointmentDetailRouteArgs{key: $key, appointmentItem: $appointmentItem}';
  }
}

/// generated route for
/// [_i12.ClinicsListPage]
class ClinicsListRoute extends _i37.PageRouteInfo<ClinicsListRouteArgs> {
  ClinicsListRoute(
      {_i40.Key? key, required String userId, required bool isChildrenPage})
      : super(ClinicsListRoute.name,
            path: '/subscribe_clinics',
            args: ClinicsListRouteArgs(
                key: key, userId: userId, isChildrenPage: isChildrenPage));

  static const String name = 'CardsRoute';

  static const PageInfo<CardsRouteArgs> page = PageInfo<CardsRouteArgs>(name);
}

  final _i40.Key? key;

  final Key? key;

  final bool isChildrenPage;

  @override
  String toString() {
    return 'CardsRouteArgs{key: $key, isChildrenPage: $isChildrenPage}';
  }
}

/// generated route for
/// [HealthPage]
class HealthRoute extends PageRouteInfo<void> {
  const HealthRoute({List<PageRouteInfo>? children})
      : super(
          HealthRoute.name,
          initialChildren: children,
        );

  static const String name = 'HealthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HealthForMainPage]
class HealthForMainRoute extends PageRouteInfo<void> {
  const HealthForMainRoute({List<PageRouteInfo>? children})
      : super(
          HealthForMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'HealthForMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiaryAddPage]
class DiaryAddRoute extends PageRouteInfo<DiaryAddRouteArgs> {
  DiaryAddRoute({
    Key? key,
    required String title,
    required String measureItem,
    required int decimalDigits,
    required List<String> paramName,
    required String grouping,
    required dynamic Function(
      String,
      DateTime,
      DateTime,
    ) onSubmit,
    required List<double> minValue,
    required List<double> maxValue,
    List<double>? initialValues,
    DateTime? initialDate,
    List<PageRouteInfo>? children,
  }) : super(
          DiaryAddRoute.name,
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
            initialDate: initialDate,
          ),
          initialChildren: children,
        );

  static const String name = 'DiaryAddRoute';

  static const PageInfo<DiaryAddRouteArgs> page =
      PageInfo<DiaryAddRouteArgs>(name);
}

class DiaryAddRouteArgs {
  const DiaryAddRouteArgs({
    this.key,
    required this.title,
    required this.measureItem,
    required this.decimalDigits,
    required this.paramName,
    required this.grouping,
    required this.onSubmit,
    required this.minValue,
    required this.maxValue,
    this.initialValues,
    this.initialDate,
  });

  final Key? key;

  final String title;

  final String measureItem;

  final int decimalDigits;

  final List<String> paramName;

  final String grouping;

  final dynamic Function(
    String,
    DateTime,
    DateTime,
  ) onSubmit;

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
/// [DiaryPage]
class DiaryRoute extends PageRouteInfo<DiaryRouteArgs> {
  DiaryRoute({
    Key? key,
    required String title,
    required DiaryCategoryModel categoryModel,
    required String syn,
    List<PageRouteInfo>? children,
  }) : super(
          DiaryRoute.name,
          args: DiaryRouteArgs(
            key: key,
            title: title,
            categoryModel: categoryModel,
            syn: syn,
          ),
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static const PageInfo<DiaryRouteArgs> page = PageInfo<DiaryRouteArgs>(name);
}

class DiaryRouteArgs {
  const DiaryRouteArgs({
    this.key,
    required this.title,
    required this.categoryModel,
    required this.syn,
  });

  final Key? key;

  final String title;

  final DiaryCategoryModel categoryModel;

  final String syn;

  @override
  String toString() {
    return 'DiaryRouteArgs{key: $key, title: $title, categoryModel: $categoryModel, syn: $syn}';
  }
}

/// generated route for
/// [AllClinicsListPage]
class AllClinicsListRoute extends PageRouteInfo<AllClinicsListRouteArgs> {
  AllClinicsListRoute({
    Key? key,
    bool isFromMainPage = false,
    List<PageRouteInfo>? children,
  }) : super(
          AllClinicsListRoute.name,
          args: AllClinicsListRouteArgs(
            key: key,
            isFromMainPage: isFromMainPage,
          ),
          initialChildren: children,
        );

  static const String name = 'AllClinicsListRoute';

  static const PageInfo<AllClinicsListRouteArgs> page =
      PageInfo<AllClinicsListRouteArgs>(name);
}

class AllClinicsListRouteArgs {
  const AllClinicsListRouteArgs({
    this.key,
    this.isFromMainPage = false,
  });

  final Key? key;

  final bool isFromMainPage;

  @override
  String toString() {
    return 'AllClinicsListRouteArgs{key: $key, isFromMainPage: $isFromMainPage}';
  }
}

/// generated route for
/// [ClinicForDetailsPage]
class ClinicForDetailsRoute extends PageRouteInfo<ClinicForDetailsRouteArgs> {
  ClinicForDetailsRoute({
    Key? key,
    bool isFromMainPage = false,
    List<PageRouteInfo>? children,
  }) : super(
          ClinicForDetailsRoute.name,
          args: ClinicForDetailsRouteArgs(
            key: key,
            isFromMainPage: isFromMainPage,
          ),
          initialChildren: children,
        );

  static const String name = 'ClinicForDetailsRoute';

  static const PageInfo<ClinicForDetailsRouteArgs> page =
      PageInfo<ClinicForDetailsRouteArgs>(name);
}

class ClinicForDetailsRouteArgs {
  const ClinicForDetailsRouteArgs({
    this.key,
    this.isFromMainPage = false,
  });

  final Key? key;

  final bool isFromMainPage;

  @override
  String toString() {
    return 'ClinicForDetailsRouteArgs{key: $key, isFromMainPage: $isFromMainPage}';
  }
}

/// generated route for
/// [ClinicForMainPage]
class ClinicForMainRoute extends PageRouteInfo<ClinicForMainRouteArgs> {
  ClinicForMainRoute({
    Key? key,
    bool isFromMainPage = false,
    List<PageRouteInfo>? children,
  }) : super(
          ClinicForMainRoute.name,
          args: ClinicForMainRouteArgs(
            key: key,
            isFromMainPage: isFromMainPage,
          ),
          initialChildren: children,
        );

  static const String name = 'ClinicForMainRoute';

  static const PageInfo<ClinicForMainRouteArgs> page =
      PageInfo<ClinicForMainRouteArgs>(name);
}

class ClinicForMainRouteArgs {
  const ClinicForMainRouteArgs({
    this.key,
    this.isFromMainPage = false,
  });

  final Key? key;

  final bool isFromMainPage;

  @override
  String toString() {
    return 'ClinicForMainRouteArgs{key: $key, isFromMainPage: $isFromMainPage}';
  }
}

/// generated route for
/// [_i13.ServicesListPage]
class ServicesListRoute extends _i37.PageRouteInfo<ServicesListRouteArgs> {
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

  static const String name = 'SalesRoute';

  static const PageInfo<SalesRouteArgs> page = PageInfo<SalesRouteArgs>(name);
}

  final _i40.Key? key;

  final Key? key;

  final String clinicId;

  @override
  String toString() {
    return 'SalesRouteArgs{key: $key, clinicId: $clinicId}';
  }
}

/// generated route for
/// [_i14.ResearchesListPage]
class ResearchesListRoute extends _i37.PageRouteInfo<ResearchesListRouteArgs> {
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

  static const String name = 'PriceRoute';

  static const PageInfo<PriceRouteArgs> page = PageInfo<PriceRouteArgs>(name);
}

class ResearchesListRouteArgs {
  const ResearchesListRouteArgs(
      {this.key,
      required this.userId,
      required this.buildingId,
      required this.clinicId,
      required this.categoryTypeId});

  final _i40.Key? key;

  final Key? key;

  final String clinicId;

  @override
  String toString() {
    return 'PriceRouteArgs{key: $key, clinicId: $clinicId}';
  }
}

/// generated route for
/// [ClinicDetailWithBottomSheetsPage]
class ClinicDetailWithBottomSheetsRoute
    extends PageRouteInfo<ClinicDetailWithBottomSheetsRouteArgs> {
  ClinicDetailWithBottomSheetsRoute({
    Key? key,
    required ClinicModel selectedClinic,
    List<PageRouteInfo>? children,
  }) : super(
          ClinicDetailWithBottomSheetsRoute.name,
          args: ClinicDetailWithBottomSheetsRouteArgs(
            key: key,
            selectedClinic: selectedClinic,
          ),
          initialChildren: children,
        );

  static const String name = 'ClinicDetailWithBottomSheetsRoute';

  static const PageInfo<ClinicDetailWithBottomSheetsRouteArgs> page =
      PageInfo<ClinicDetailWithBottomSheetsRouteArgs>(name);
}

class ClinicDetailWithBottomSheetsRouteArgs {
  const ClinicDetailWithBottomSheetsRouteArgs({
    this.key,
    required this.selectedClinic,
  });

  final Key? key;

  final ClinicModel selectedClinic;

  @override
  String toString() {
    return 'ClinicDetailWithBottomSheetsRouteArgs{key: $key, selectedClinic: $selectedClinic}';
  }
}

/// generated route for
/// [_i15.SpecialisationsListPage]
class SpecialisationsListRoute
    extends _i37.PageRouteInfo<SpecialisationsListRouteArgs> {
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

  static const String name = 'DoctorsListRoute';

  static const PageInfo<DoctorsListRouteArgs> page =
      PageInfo<DoctorsListRouteArgs>(name);
}

class DoctorsListRouteArgs {
  const DoctorsListRouteArgs({
    this.key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
    required this.specialisationId,
    required this.specialisationName,
  });

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
/// [_i16.DoctorsListPage]
class DoctorsListRoute extends _i37.PageRouteInfo<DoctorsListRouteArgs> {
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

  static const String name = 'ScheduleRoute';

  static const PageInfo<ScheduleRouteArgs> page =
      PageInfo<ScheduleRouteArgs>(name);
}

class ScheduleRouteArgs {
  const ScheduleRouteArgs({
    this.key,
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
    this.isFavorite = false,
  });

  final Key? key;

  final _i40.Key? key;

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
/// [SubscribeProfilesListPage]
class SubscribeProfilesListRoute extends PageRouteInfo<void> {
  const SubscribeProfilesListRoute({List<PageRouteInfo>? children})
      : super(
          SubscribeProfilesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscribeProfilesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResearchCabinetsListPage]
class ResearchCabinetsListRoute
    extends _i37.PageRouteInfo<ResearchCabinetsListRouteArgs> {
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

  static const PageInfo<ResearchCabinetsListRouteArgs> page =
      PageInfo<ResearchCabinetsListRouteArgs>(name);
}

class ResearchCabinetsListRouteArgs {
  const ResearchCabinetsListRouteArgs({
    this.key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
    required this.researchIds,
  });

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
/// [FavoriteDoctorsListPage]
class FavoriteDoctorsListRoute
    extends _i37.PageRouteInfo<FavoriteDoctorsListRouteArgs> {
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

  static const PageInfo<FavoriteDoctorsListRouteArgs> page =
      PageInfo<FavoriteDoctorsListRouteArgs>(name);
}

class FavoriteDoctorsListRouteArgs {
  const FavoriteDoctorsListRouteArgs({
    this.key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
  });

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
/// [_i19.SchedulePage]
class ScheduleRoute extends _i37.PageRouteInfo<ScheduleRouteArgs> {
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

  static const String name = 'ServicesListRoute';

  static const PageInfo<ServicesListRouteArgs> page =
      PageInfo<ServicesListRouteArgs>(name);
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

  final Key? key;

  final String userId;

  final String buildingId;

  final String clinicId;

  @override
  String toString() {
    return 'ServicesListRouteArgs{key: $key, userId: $userId, buildingId: $buildingId, clinicId: $clinicId}';
  }
}

/// generated route for
/// [ConfirmationSubscribePage]
class ConfirmationSubscribeRoute
    extends _i37.PageRouteInfo<ConfirmationSubscribeRouteArgs> {
  ConfirmationSubscribeRoute(
      {_i40.Key? key, required String userId, required int timeZoneHours})
      : super(ConfirmationSubscribeRoute.name,
            path: '/subscribe_confirm',
            args: ConfirmationSubscribeRouteArgs(
                key: key, userId: userId, timeZoneHours: timeZoneHours));

  static const String name = 'ConfirmationSubscribeRoute';

  static const PageInfo<ConfirmationSubscribeRouteArgs> page =
      PageInfo<ConfirmationSubscribeRouteArgs>(name);
}

class ConfirmationSubscribeRouteArgs {
  const ConfirmationSubscribeRouteArgs({
    this.key,
    required this.userId,
    required this.timeZoneHours,
  });

  final _i40.Key? key;

  final String userId;

  final int timeZoneHours;

  @override
  String toString() {
    return 'ConfirmationSubscribeRouteArgs{key: $key, userId: $userId, timeZoneHours: $timeZoneHours}';
  }
}

/// generated route for
/// [_i21.PaymentPage]
class PaymentRoute extends _i37.PageRouteInfo<PaymentRouteArgs> {
  PaymentRoute({_i40.Key? key, required String userId})
      : super(PaymentRoute.name,
            path: '/subscribe_payment_page',
            args: PaymentRouteArgs(key: key, userId: userId));

  static const String name = 'PaymentRoute';

  static const PageInfo<PaymentRouteArgs> page =
      PageInfo<PaymentRouteArgs>(name);
}

class PaymentRouteArgs {
  const PaymentRouteArgs({
    this.key,
    required this.userId,
  });

  final _i40.Key? key;

  final String userId;

  @override
  String toString() {
    return 'PaymentRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [ResearchesListPage]
class ResearchesListRoute extends PageRouteInfo<ResearchesListRouteArgs> {
  ResearchesListRoute({
    Key? key,
    required String userId,
    required String buildingId,
    required String clinicId,
    required int categoryTypeId,
    List<PageRouteInfo>? children,
  }) : super(
          ResearchesListRoute.name,
          args: ResearchesListRouteArgs(
            key: key,
            userId: userId,
            buildingId: buildingId,
            clinicId: clinicId,
            categoryTypeId: categoryTypeId,
          ),
          initialChildren: children,
        );

  static const String name = 'ResearchesListRoute';

  static const PageInfo<ResearchesListRouteArgs> page =
      PageInfo<ResearchesListRouteArgs>(name);
}

class ResearchesListRouteArgs {
  const ResearchesListRouteArgs({
    this.key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
  });

  final Key? key;

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
/// [ClinicsListPage]
class ClinicsListRoute extends PageRouteInfo<ClinicsListRouteArgs> {
  ClinicsListRoute({
    Key? key,
    required String userId,
    required bool isChildrenPage,
    List<PageRouteInfo>? children,
  }) : super(
          ClinicsListRoute.name,
          args: ClinicsListRouteArgs(
            key: key,
            userId: userId,
            isChildrenPage: isChildrenPage,
          ),
          initialChildren: children,
        );

  static const String name = 'ClinicsListRoute';

  static const PageInfo<ClinicsListRouteArgs> page =
      PageInfo<ClinicsListRouteArgs>(name);
}

class ClinicsListRouteArgs {
  const ClinicsListRouteArgs({
    this.key,
    required this.userId,
    required this.isChildrenPage,
  });

  final Key? key;

  final String userId;

  final bool isChildrenPage;

  @override
  String toString() {
    return 'ClinicsListRouteArgs{key: $key, userId: $userId, isChildrenPage: $isChildrenPage}';
  }
}

/// generated route for
/// [SpecialisationsListPage]
class SpecialisationsListRoute
    extends PageRouteInfo<SpecialisationsListRouteArgs> {
  SpecialisationsListRoute({
    Key? key,
    required String userId,
    required String buildingId,
    required String clinicId,
    required int categoryTypeId,
    List<PageRouteInfo>? children,
  }) : super(
          SpecialisationsListRoute.name,
          args: SpecialisationsListRouteArgs(
            key: key,
            userId: userId,
            buildingId: buildingId,
            clinicId: clinicId,
            categoryTypeId: categoryTypeId,
          ),
          initialChildren: children,
        );

  static const String name = 'SpecialisationsListRoute';

  static const PageInfo<SpecialisationsListRouteArgs> page =
      PageInfo<SpecialisationsListRouteArgs>(name);
}

class SpecialisationsListRouteArgs {
  const SpecialisationsListRouteArgs({
    this.key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
  });

  final Key? key;

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
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MedcardProfilesListPage]
class MedcardProfilesListRoute extends PageRouteInfo<void> {
  const MedcardProfilesListRoute({List<PageRouteInfo>? children})
      : super(
          MedcardProfilesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MedcardProfilesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [_i23.MedcardPage]
class MedcardRoute extends _i37.PageRouteInfo<MedcardRouteArgs> {
  MedcardRoute(
      {_i40.Key? key,
      required String userId,
      required bool isChildrenPage,
      String? eventId})
      : super(MedcardRoute.name,
            path: '/medcard_files_list',
            args: MedcardRouteArgs(
                key: key,
                userId: userId,
                isChildrenPage: isChildrenPage,
                eventId: eventId));

  static const String name = 'MedcardRoute';

  static const PageInfo<MedcardRouteArgs> page =
      PageInfo<MedcardRouteArgs>(name);
}

class MedcardRouteArgs {
  const MedcardRouteArgs({
    this.key,
    required this.userId,
    required this.isChildrenPage,
    this.eventId,
  });

  final _i40.Key? key;

  final String userId;

  final bool isChildrenPage;

  final String? eventId;

  @override
  String toString() {
    return 'MedcardRouteArgs{key: $key, userId: $userId, isChildrenPage: $isChildrenPage, eventId: $eventId}';
  }
}

/// generated route for
/// [_i24.FilesPage]
class FilesRoute extends _i37.PageRouteInfo<FilesRouteArgs> {
  FilesRoute({_i40.Key? key, required String userId})
      : super(FilesRoute.name,
            path: '/medcard_user_files_list',
            args: FilesRouteArgs(key: key, userId: userId));

  static const String name = 'FilesRoute';

  static const PageInfo<FilesRouteArgs> page = PageInfo<FilesRouteArgs>(name);
}

class FilesRouteArgs {
  const FilesRouteArgs({
    this.key,
    required this.userId,
  });

  final _i40.Key? key;

  final String userId;

  @override
  String toString() {
    return 'FilesRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [DocumentsPage]
class DocumentsRoute extends PageRouteInfo<void> {
  const DocumentsRoute({List<PageRouteInfo>? children})
      : super(
          DocumentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocumentsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [_i26.AgreementsPage]
class AgreementsRoute extends _i37.PageRouteInfo<AgreementsRouteArgs> {
  AgreementsRoute({_i40.Key? key, bool isAppointmentAgreements = false})
      : super(AgreementsRoute.name,
            path: '/settings_agreements',
            args: AgreementsRouteArgs(
                key: key, isAppointmentAgreements: isAppointmentAgreements));

  static const String name = 'DocumentRoute';

  static const PageInfo<DocumentRouteArgs> page =
      PageInfo<DocumentRouteArgs>(name);
}

class DocumentRouteArgs {
  const DocumentRouteArgs({
    this.key,
    required this.document,
  });

  final _i40.Key? key;

  final DocumentModel document;

  @override
  String toString() {
    return 'DocumentRouteArgs{key: $key, document: $document}';
  }
}

/// generated route for
/// [RequireUpdateAppPage]
class RequireUpdateAppRoute extends PageRouteInfo<void> {
  const RequireUpdateAppRoute({List<PageRouteInfo>? children})
      : super(
          RequireUpdateAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequireUpdateAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [_i28.AllClinicsListPage]
class AllClinicsListRoute extends _i37.PageRouteInfo<AllClinicsListRouteArgs> {
  AllClinicsListRoute({_i40.Key? key, bool isFromMainPage = false})
      : super(AllClinicsListRoute.name,
            path: '/clinic_info',
            args: AllClinicsListRouteArgs(
                key: key, isFromMainPage: isFromMainPage));

  static const String name = 'CreatePinCodeRoute';

  static const PageInfo<CreatePinCodeRouteArgs> page =
      PageInfo<CreatePinCodeRouteArgs>(name);
}

class CreatePinCodeRouteArgs {
  const CreatePinCodeRouteArgs({
    this.key,
    this.noUsedBiometric = false,
  });

  final _i40.Key? key;

  final bool noUsedBiometric;

  @override
  String toString() {
    return 'CreatePinCodeRouteArgs{key: $key, noUsedBiometric: $noUsedBiometric}';
  }
}

/// generated route for
/// [_i28.ClinicPageForDetails]
class ClinicRouteForDetails
    extends _i37.PageRouteInfo<ClinicRouteForDetailsArgs> {
  ClinicRouteForDetails({_i40.Key? key, bool isFromMainPage = false})
      : super(ClinicRouteForDetails.name,
            path: '/clinic_info_for_details',
            args: ClinicRouteForDetailsArgs(
                key: key, isFromMainPage: isFromMainPage));

  static const String name = 'ClinicRouteForDetails';
}

  static const String name = 'UnauthSupportRoute';

  final _i40.Key? key;

  final bool isFromMainPage;

  @override
  String toString() {
    return 'ClinicRouteForDetailsArgs{key: $key, isFromMainPage: $isFromMainPage}';
  }
}

/// generated route for
/// [_i28.ClinicPageForMain]
class ClinicRouteForMain extends _i37.PageRouteInfo<ClinicRouteForMainArgs> {
  ClinicRouteForMain({_i40.Key? key, bool isFromMainPage = false})
      : super(ClinicRouteForMain.name,
            path: '/clinic_info_for_main',
            args: ClinicRouteForMainArgs(
                key: key, isFromMainPage: isFromMainPage));

  static const String name = 'ClinicRouteForMain';
}

  static const String name = 'EsiaLoginRoute';

  final _i40.Key? key;

  final bool isFromMainPage;

  @override
  String toString() {
    return 'ClinicRouteForMainArgs{key: $key, isFromMainPage: $isFromMainPage}';
  }
}

/// generated route for
/// [_i29.ClinicDetailWithBottomSheetsPage]
class ClinicDetailWithBottomSheetsRoute
    extends _i37.PageRouteInfo<ClinicDetailWithBottomSheetsRouteArgs> {
  ClinicDetailWithBottomSheetsRoute(
      {_i40.Key? key, required _i41.ClinicModel selectedClinic})
      : super(ClinicDetailWithBottomSheetsRoute.name,
            path: '/clinic_info_details',
            args: ClinicDetailWithBottomSheetsRouteArgs(
                key: key, selectedClinic: selectedClinic));

  static const PageInfo<EsiaRegisterRouteArgs> page =
      PageInfo<EsiaRegisterRouteArgs>(name);
}

class EsiaRegisterRouteArgs {
  const EsiaRegisterRouteArgs({
    this.key,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.phoneNumber,
    required this.snils,
    required this.sex,
    required this.birthday,
    required this.passportSerial,
    required this.passportNumber,
    required this.passportIssueDate,
    required this.passportIssueId,
    required this.esiaToken,
  });

  final Key? key;

  final String firstName;

  final String lastName;

  final String middleName;

  final String phoneNumber;

  final String snils;

  final int sex;

  final String birthday;

  final String passportSerial;

  final _i40.Key? key;

  final _i41.ClinicModel selectedClinic;

  @override
  String toString() {
    return 'EsiaRegisterRouteArgs{key: $key, firstName: $firstName, lastName: $lastName, middleName: $middleName, phoneNumber: $phoneNumber, snils: $snils, sex: $sex, birthday: $birthday, passportSerial: $passportSerial, passportNumber: $passportNumber, passportIssueDate: $passportIssueDate, passportIssueId: $passportIssueId, esiaToken: $esiaToken}';
  }
}

/// generated route for
/// [_i30.PricePage]
class PriceRoute extends _i37.PageRouteInfo<PriceRouteArgs> {
  PriceRoute({_i40.Key? key, required String clinicId})
      : super(PriceRoute.name,
            path: '/clinic_info_price',
            args: PriceRouteArgs(key: key, clinicId: clinicId));

  static const String name = 'RecoverPasswordNewRoute';

  static const PageInfo<RecoverPasswordNewRouteArgs> page =
      PageInfo<RecoverPasswordNewRouteArgs>(name);
}

class RecoverPasswordNewRouteArgs {
  const RecoverPasswordNewRouteArgs({
    this.key,
    required this.smsToken,
  });

  final _i40.Key? key;

  final String smsToken;

  @override
  String toString() {
    return 'RecoverPasswordNewRouteArgs{key: $key, smsToken: $smsToken}';
  }
}

/// generated route for
/// [_i31.SalesPage]
class SalesRoute extends _i37.PageRouteInfo<SalesRouteArgs> {
  SalesRoute({_i40.Key? key, required String clinicId})
      : super(SalesRoute.name,
            path: '/clinic_info_sales',
            args: SalesRouteArgs(key: key, clinicId: clinicId));

  static const String name = 'RecoverPasswordSmsRoute';

  static const PageInfo<RecoverPasswordSmsRouteArgs> page =
      PageInfo<RecoverPasswordSmsRouteArgs>(name);
}

class RecoverPasswordSmsRouteArgs {
  const RecoverPasswordSmsRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i40.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RecoverPasswordSmsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [StartPhoneNumberPage]
class StartPhoneNumberRoute extends PageRouteInfo<StartPhoneNumberRouteArgs> {
  StartPhoneNumberRoute({
    Key? key,
    bool isDeletingProfile = false,
    List<PageRouteInfo>? children,
  }) : super(
          StartPhoneNumberRoute.name,
          args: StartPhoneNumberRouteArgs(
            key: key,
            isDeletingProfile: isDeletingProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'StartPhoneNumberRoute';

  static const PageInfo<StartPhoneNumberRouteArgs> page =
      PageInfo<StartPhoneNumberRouteArgs>(name);
}

/// generated route for
/// [_i33.CardsPage]
class CardsRoute extends _i37.PageRouteInfo<CardsRouteArgs> {
  CardsRoute({_i40.Key? key, required bool isChildrenPage})
      : super(CardsRoute.name,
            path: '/health',
            args: CardsRouteArgs(key: key, isChildrenPage: isChildrenPage));

  final Key? key;

class CardsRouteArgs {
  const CardsRouteArgs({this.key, required this.isChildrenPage});

  final _i40.Key? key;

  final bool isChildrenPage;

  @override
  String toString() {
    return 'CardsRouteArgs{key: $key, isChildrenPage: $isChildrenPage}';
  }
}

/// generated route for
/// [_i34.DiaryPage]
class DiaryRoute extends _i37.PageRouteInfo<DiaryRouteArgs> {
  DiaryRoute(
      {_i40.Key? key,
      required String title,
      required _i42.DiaryCategoryModel categoryModel,
      required String syn})
      : super(DiaryRoute.name,
            path: '/diary',
            args: DiaryRouteArgs(
                key: key,
                title: title,
                categoryModel: categoryModel,
                syn: syn));

  static const String name = 'AuthUserAgreementsRoute';

  static const PageInfo<AuthUserAgreementsRouteArgs> page =
      PageInfo<AuthUserAgreementsRouteArgs>(name);
}

  final _i40.Key? key;

  final Key? key;

  final _i42.DiaryCategoryModel categoryModel;

  final String syn;

  @override
  String toString() {
    return 'AuthUserAgreementsRouteArgs{key: $key, isFullScreen: $isFullScreen}';
  }
}

/// generated route for
/// [_i35.DiaryAddPage]
class DiaryAddRoute extends _i37.PageRouteInfo<DiaryAddRouteArgs> {
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

  static const String name = 'PasswordRoute';

  static const PageInfo<PasswordRouteArgs> page =
      PageInfo<PasswordRouteArgs>(name);
}

class PasswordRouteArgs {
  const PasswordRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'PasswordRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}
