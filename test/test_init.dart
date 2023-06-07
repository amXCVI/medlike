import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/app.dart';
import 'package:flutter/widgets.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/navigation/guards.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/notifications/push_navigation_service.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void testInit() async {
  await withApp();
}

Future<Widget> withApp([Widget? child, 
  AppointmentsRepository? appointmentsRepository]
) async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  getIt.registerSingleton<AppRouter>(AppRouter(
    checkIsAuthUser: CheckIsAuthUser(),
    checkIsSavedPinCode: CheckIsSavedPinCode(),
    checkIsOneClinicForPrice: CheckIsOneClinicForPrice(),
    checkIsOneClinicForDetails: CheckIsOneClinicForDetails(),
    checkIsOneClinicForMain: CheckIsOneClinicForMain(),
    checkIsOneProfileForHealth: CheckIsOneProfileForHealth(),
    checkIsOneProfileForMain: CheckIsOneProfileForMain(),
    checkIsOneProfileForSubscribe: CheckIsOneProfileForSubscribe(),
    checkIsOneClinicForSubscribe: CheckIsOneClinicForSubscribe()
  ));

  getIt.registerSingleton(PushNavigationService());

  return App(
    testChild: child,
    appointmentsRepository: appointmentsRepository
  );
} 
