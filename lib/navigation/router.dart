import 'package:auto_route/annotations.dart';
import 'package:medlike/modules/about_clinic/all_clinics_list/all_clinics_list_page.dart';
import 'package:medlike/modules/about_clinic/detail_clinic/detail_clinic_page.dart';
import 'package:medlike/modules/about_clinic/price/price_page.dart';
import 'package:medlike/modules/about_clinic/sales/sales_page.dart';
import 'package:medlike/modules/appointments/appointments_page.dart';
import 'package:medlike/modules/login/check_pin_code_page/check_pin_code_page.dart';
import 'package:medlike/modules/login/create_pin_code_page/pin_code_page.dart';
import 'package:medlike/modules/login/password_page/password_page.dart';
import 'package:medlike/modules/login/phone_number_page/phone_number_page.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_new_page.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_page.dart';
import 'package:medlike/modules/main_page/main_page.dart';
import 'package:medlike/modules/medcard/files/files_page.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/medcard_page.dart';
import 'package:medlike/modules/medcard/profiles_list/profiles_list_page.dart';
import 'package:medlike/modules/settings/agreements/agreements_page.dart';
import 'package:medlike/modules/settings/settings_page.dart';
import 'package:medlike/modules/subscribe/clinics_list/clinics_list_page.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/confirmation_subscribe_page.dart';
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

import 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute(path: AppRoutes.loginPhone, page: PhoneNumberPage),
    AdaptiveRoute(path: AppRoutes.loginPassword, page: PasswordPage),
    AdaptiveRoute(path: AppRoutes.loginPinCodeCreate, page: CreatePinCodePage),
    AdaptiveRoute(path: AppRoutes.loginPinCodeCheck, page: CheckPinCodePage, guards: [CheckIsSavedPinCode]),
    AdaptiveRoute(path: AppRoutes.loginRecoverPasswordSms, page: RecoverPasswordSmsPage),
    AdaptiveRoute(path: AppRoutes.loginRecoverPasswordNew, page: RecoverPasswordNewPage),

    AdaptiveRoute(path: AppRoutes.main, page: MainPage, guards: [CheckIsAuthUser], initial: true),

    AdaptiveRoute(path: AppRoutes.myAppointments, page: AppointmentsPage, guards: [CheckIsAuthUser]),

    AdaptiveRoute(path: AppRoutes.subscribeProfiles, page: ProfilesListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeClinics, page: ClinicsListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeServices, page: ServicesListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeResearches, page: ResearchesListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeSpecialisations, page: SpecialisationsListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeDoctors, page: DoctorsListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeResearchCabinets, page: ResearchCabinetsListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeFavoriteDoctors, page: FavoriteDoctorsListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeSchedule, page: SchedulePage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.subscribeConfirmation, page: ConfirmationSubscribePage, guards: [CheckIsAuthUser]),

    AdaptiveRoute(path: AppRoutes.medcard, page: MedcardProfilesListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.medcardFilesList, page: MedcardPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.medcardUserFilesList, page: FilesPage, guards: [CheckIsAuthUser]),

    AdaptiveRoute(path: AppRoutes.settings, page: SettingsPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.settingsAgreements, page: AgreementsPage),

    AdaptiveRoute(path: AppRoutes.clinicInfo, page: AllClinicsListPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.clinicInfoDetails, page: DetailClinicPage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.clinicInfoPrice, page: PricePage, guards: [CheckIsAuthUser]),
    AdaptiveRoute(path: AppRoutes.clinicInfoSales, page: SalesPage, guards: [CheckIsAuthUser]),

    // RedirectRoute(path: '*', redirectTo: AppRoutes.main),
  ],
)

class $AppRouter {}
