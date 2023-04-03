import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/app.dart';
import 'navigation/router.gr.dart';
import 'package:medlike/navigation/guards.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final _router = AppRouter(
    checkIsAuthUser: CheckIsAuthUser(),
    checkIsAuthSmartappUser: CheckIsAuthSmartappUser(),
    checkIsSavedPinCode: CheckIsSavedPinCode(),
    checkIsOneClinicForPrice: CheckIsOneClinicForPrice(),
    checkIsOneClinicForDetails: CheckIsOneClinicForDetails(),
    checkIsOneClinicForMain: CheckIsOneClinicForMain(),
    checkIsOneProfileForHealth: CheckIsOneProfileForHealth(),
    checkIsOneProfileForMain: CheckIsOneProfileForMain(),
  );

  getIt.registerSingleton<AppRouter>(_router);

  runApp(App());
}
