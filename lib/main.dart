import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/app.dart';
import 'package:flutter/widgets.dart';
import 'package:medlike/navigation/guards.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/helpers/push_handle_helper.dart';
import 'package:medlike/utils/notifications/local_notifications_service.dart';
import 'package:medlike/utils/notifications/push_navigation_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:testfairy_flutter/testfairy_flutter.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  /*print(message.notification.title); */
  print(message.data.toString());
  LocalNotificationService.createAndDisplayNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TestFairy.begin("SDK-clfFRlpJ");

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  getIt.registerSingleton<AppRouter>(AppRouter(
    checkIsAuthUser: CheckIsAuthUser(),
    checkIsSavedPinCode: CheckIsSavedPinCode(),
    checkIsOneClinicForPrice: CheckIsOneClinicForPrice(),
    checkIsOneClinicForDetails: CheckIsOneClinicForDetails(),
    checkIsOneClinicForMain: CheckIsOneClinicForMain(),
    checkIsOneProfileForHealth: CheckIsOneProfileForHealth(),
    checkIsOneProfileForMain: CheckIsOneProfileForMain()
  ));

  getIt.registerSingleton(PushNavigationService());

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Sentry.captureMessage("FirebaseMessaging.onMessageOpenedApp.listen ${message.data["title"]}");
      pushHandler(jsonEncode(message.data));
  });
  LocalNotificationService.initialize(null);

  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://f6a923e6681b4453b447df38aa889523@o4504496183246848.ingest.sentry.io/4504496185737216';
        options.debug = true;
        options.sendDefaultPii = true;
      },
    );

    runApp(App());
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
