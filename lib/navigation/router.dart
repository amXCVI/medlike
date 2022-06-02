import 'package:auto_route/annotations.dart';
import 'package:medlike/modules/appointments/appointments_page.dart';
import 'package:medlike/modules/login_with_pass/login_page.dart';

import 'package:medlike/modules/main_page/main_page.dart';
import 'package:medlike/modules/subscribe/clinics_list/clinics_list_page.dart';
import 'package:medlike/modules/subscribe/profiles_list/profiles_list_page.dart';
import 'package:medlike/navigation/routes_names_map.dart';

import 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: AppRoutes.main, page: MainPage, initial: true),
    AutoRoute(path: AppRoutes.myAppointments, page: AppointmentsPage),
    AutoRoute(path: AppRoutes.subscribeProfiles, page: ProfilesListPage),
    AutoRoute(path: AppRoutes.subscribeClinics, page: ClinicsListPage),
    AutoRoute(path: AppRoutes.login, page: LoginPage),
    RedirectRoute(path: '*', redirectTo: AppRoutes.main),
  ],
)
class $AppRouter {}
