import 'package:auto_route/annotations.dart';
import 'package:medlike/modules/appointments/appointments_page.dart';
import 'package:medlike/modules/login_with_pass/login_page.dart';

import 'package:medlike/modules/main_page/main_page.dart';
import 'package:medlike/modules/subscribe/clinics_list/clinics_list_page.dart';
import 'package:medlike/modules/subscribe/doctors_list/doctors_list_page.dart';
import 'package:medlike/modules/subscribe/profiles_list/profiles_list_page.dart';
import 'package:medlike/modules/subscribe/researches_list/researches_list_page.dart';
import 'package:medlike/modules/subscribe/services_list/services_list_page.dart';
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list_page.dart';
import 'package:medlike/navigation/routes_names_map.dart';

import 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: AppRoutes.main, page: MainPage, initial: true),
    AutoRoute(path: AppRoutes.myAppointments, page: AppointmentsPage),
    AutoRoute(path: AppRoutes.subscribeProfiles, page: ProfilesListPage),
    AutoRoute(path: AppRoutes.subscribeClinics, page: ClinicsListPage),
    AutoRoute(path: AppRoutes.subscribeServices, page: ServicesListPage),
    AutoRoute(path: AppRoutes.subscribeResearches, page: ResearchesListPage),
    AutoRoute(path: AppRoutes.subscribeSpecialisations, page: SpecialisationsListPage),
    AutoRoute(path: AppRoutes.subscribeDoctors, page: DoctorsListPage),
    AutoRoute(path: AppRoutes.login, page: LoginPage),
    RedirectRoute(path: '*', redirectTo: AppRoutes.main),
  ],
)
class $AppRouter {}
