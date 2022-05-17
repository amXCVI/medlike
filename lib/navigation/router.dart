import 'package:auto_route/annotations.dart';
import 'package:medlike/modules/login_with_pass/login_page.dart';

import 'package:medlike/modules/main_page/main_page.dart';
import 'package:medlike/navigation/routes_names_map.dart';

import 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: AppRoutes.main, page: MainPage, initial: true),
    AutoRoute(path: AppRoutes.login, page: LoginPage),
    RedirectRoute(path: '*', redirectTo: AppRoutes.main),
  ],
)

class $AppRouter {}
