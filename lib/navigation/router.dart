import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/modules/about_clinic/all_clinics_list/all_clinics_list_page.dart';
import 'package:medlike/modules/about_clinic/detail_clinic_with_bottom_sheets/clinic_detail_with_bottom_sheets_page.dart';
import 'package:medlike/modules/about_clinic/price/price_page.dart';
import 'package:medlike/modules/about_clinic/sales/sales_page.dart';
import 'package:medlike/modules/appointments/appointment_detail/appointment_detail_page.dart';
import 'package:medlike/modules/appointments/appointments_page.dart';
import 'package:medlike/modules/appointments/feedback/feedback_page.dart';
import 'package:medlike/modules/documents/document_detail_page/document_page.dart';
import 'package:medlike/modules/documents/documents_list_page/documents_page.dart';
import 'package:medlike/modules/settings/faq/faq_item_page/faq_item_page.dart';
import 'package:medlike/modules/settings/faq/faqs_page/faqs_page.dart';
import 'package:medlike/modules/health/health_page/cards_page.dart';
import 'package:medlike/modules/login/auth_user_agreements/auth_user_agreements_page.dart';
import 'package:medlike/modules/health/diary_add_page/diary_add_page.dart';
import 'package:medlike/modules/health/diary_page/diary_page.dart';
import 'package:medlike/modules/health/health_page/health_page.dart';
import 'package:medlike/modules/login/check_pin_code_page/check_pin_code_page.dart';
import 'package:medlike/modules/login/create_pin_code_page/pin_code_page.dart';
import 'package:medlike/modules/login/esia_auth/esia_login_page.dart';
import 'package:medlike/modules/login/esia_register/esia_register_page.dart';
import 'package:medlike/modules/login/password_page/password_page.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_new_page.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_page.dart';
import 'package:medlike/modules/login/start_phone_number_page/start_phone_number_page.dart';
import 'package:medlike/modules/login/unauth_support/unauth_support_page.dart';
import 'package:medlike/modules/main_page/main_page.dart';
import 'package:medlike/modules/medcard/files/files_page.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_page.dart';
import 'package:medlike/modules/medcard/profiles_list/profiles_list_page.dart';
import 'package:medlike/modules/require_update_app/require_update_app_page.dart';
import 'package:medlike/modules/settings/agreements/agreements_page.dart';
import 'package:medlike/modules/settings/settings_page.dart';
import 'package:medlike/modules/settings/support/support_page.dart';
import 'package:medlike/modules/subscribe/clinics_list/clinics_list_page.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/confirmation_subscribe_page.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/payment_page.dart';
import 'package:medlike/modules/subscribe/doctors_list/doctors_list_page.dart';
import 'package:medlike/modules/subscribe/favorite_doctors_list/favorite_doctors_list_page.dart';
import 'package:medlike/modules/subscribe/profiles_list/profiles_list_page.dart';
import 'package:medlike/modules/subscribe/research_cabinets_list/research_cabinets_list_page.dart';
import 'package:medlike/modules/subscribe/researches_list/researches_list_page.dart';
import 'package:medlike/modules/subscribe/schedule/schedule_page.dart';
import 'package:medlike/modules/subscribe/services_list/services_list_page.dart';
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list_page.dart';
import 'package:medlike/navigation/guards.dart';
import 'package:medlike/navigation/routes_names_map.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        /// Логин
        AdaptiveRoute(
            path: AppRoutes.loginPhone, page: StartPhoneNumberRoute.page),
        AdaptiveRoute(path: AppRoutes.loginPassword, page: PasswordRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginPinCodeCreate, page: CreatePinCodeRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginPinCodeCheck,
            page: CheckPinCodeRoute.page,
            guards: [CheckIsSavedPinCode()]),
        AdaptiveRoute(
            path: AppRoutes.loginRecoverPasswordSms,
            page: RecoverPasswordSmsRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginRecoverPasswordNew,
            page: RecoverPasswordNewRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginAuthUserAgreements,
            page: AuthUserAgreementsRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginUnauthSupport, page: UnauthSupportRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginPinCodeCheck,
            page: CheckPinCodeRoute.page,
            guards: [CheckIsSavedPinCode()]),
        AdaptiveRoute(
            path: AppRoutes.loginRecoverPasswordSms,
            page: RecoverPasswordSmsRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginRecoverPasswordNew,
            page: RecoverPasswordNewRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginAuthUserAgreements,
            page: AuthUserAgreementsRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginUnauthSupport, page: UnauthSupportRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginEsiaLoginPage, page: EsiaLoginRoute.page),
        AdaptiveRoute(
            path: AppRoutes.loginEsiaRegisterPage,
            page: EsiaRegisterRoute.page),

        AdaptiveRoute(
            path: AppRoutes.main,
            page: MainRoute.page,
            guards: [CheckIsAuthUser()],
            initial: true),

        /// Приемы
        AdaptiveRoute(
            path: AppRoutes.myAppointments,
            page: AppointmentsRoute.page,
            guards: [CheckIsAuthUser()]),

        /// Запись
        AdaptiveRoute(
            path: AppRoutes.subscribeProfiles,
            page: SubscribeProfilesListRoute.page,
            guards: [CheckIsOneProfileForSubscribe(), CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeClinics,
            page: ClinicsListRoute.page,
            guards: [CheckIsOneClinicForSubscribe(), CheckIsAuthUser()]),
        //AdaptiveRoute(path: AppRoutes.subscribeProfiles, page: SubscribeProfilesListRoute.page, guards: [CheckIsAuthUser()]),
        //AdaptiveRoute(path: AppRoutes.subscribeClinics, page: ClinicsListRoute.page, guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeServices,
            page: ServicesListRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeResearches,
            page: ResearchesListRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeSpecialisations,
            page: SpecialisationsListRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeDoctors,
            page: DoctorsListRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeResearchCabinets,
            page: ResearchCabinetsListRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeFavoriteDoctors,
            page: FavoriteDoctorsListRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeSchedule,
            page: ScheduleRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribeConfirmation,
            page: ConfirmationSubscribeRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.subscribePayment,
            page: PaymentRoute.page,
            guards: [CheckIsAuthUser()]),

        /// Медкарта
        AdaptiveRoute(
            path: AppRoutes.medcard,
            page: MedcardProfilesListRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.medcardFilesList,
            page: MedcardRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.medcardUserFilesList,
            page: FilesRoute.page,
            guards: [CheckIsAuthUser()]),

        /// Настройки
        AdaptiveRoute(
            path: AppRoutes.settings,
            page: SettingsRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
          path: AppRoutes.settingsAgreements,
          page: AgreementsRoute.page,
        ),
        AdaptiveRoute(
            path: AppRoutes.settingsSupport,
            page: SupportRoute.page,
            guards: [CheckIsAuthUser()]),

        /// Клиники
        AdaptiveRoute(
            path: AppRoutes.clinicInfo,
            page: AllClinicsListRoute.page,
            guards: [CheckIsOneClinicForPrice(), CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.clinicInfoForDetails,
            page: ClinicForDetailsRoute.page,
            guards: [CheckIsOneClinicForDetails(), CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.clinicInfoForMain,
            page: ClinicForMainRoute.page,
            guards: [CheckIsOneClinicForMain(), CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.clinicInfoDetails,
            page: ClinicDetailWithBottomSheetsRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.clinicInfoPrice,
            page: PriceRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.clinicInfoSales,
            page: SalesRoute.page,
            guards: [CheckIsAuthUser()]),

        /// Показатели здоровья
        AdaptiveRoute(
            path: AppRoutes.healthProfiles,
            page: HealthRoute.page,
            guards: [CheckIsOneProfileForHealth(), CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.healthProfilesForMain,
            page: HealthForMainRoute.page,
            guards: [CheckIsOneProfileForMain(), CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.health,
            page: CardsRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.diary,
            page: DiaryRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.diaryAdd,
            page: DiaryAddRoute.page,
            guards: [CheckIsAuthUser()]),

        /// Документы
        AdaptiveRoute(
            path: AppRoutes.documents,
            page: DocumentsRoute.page,
            guards: [CheckIsAuthUser()]),
        AdaptiveRoute(
            path: AppRoutes.documentDetail,
            page: DocumentRoute.page,
            guards: [CheckIsAuthUser()]),

        /// Служебное
        AdaptiveRoute(
          path: AppRoutes.requireUpdater,
          page: RequireUpdateAppRoute.page,
        ),

        RedirectRoute(path: '*', redirectTo: AppRoutes.main),
      ];
}

class $AppRouter {}
