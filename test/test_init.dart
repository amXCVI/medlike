import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/app.dart';
import 'package:flutter/widgets.dart';
import 'package:medlike/navigation/guards.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/helpers/push_handle_helper.dart';
import 'package:medlike/utils/notifications/push_navigation_service.dart';
import 'package:medlike/utils/notifications/push_notifications_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:testfairy_flutter/testfairy_flutter.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void testInit() async {
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

  await FCMService.initializeFirebase();
  await FCMService.initializeLocalNotifications();
  //await FCMService.onBackgroundMsg(_firebaseMessagingBackgroundHandler);
  //await FCMService.onMessage();
  FCMService.initializeSelect((notificationResponse) {
    Sentry.captureMessage("On push tap ${notificationResponse.payload}");
    pushHandler(notificationResponse.payload);
  });
  FCMService.checkNotificationClicked((notificationResponse) {
    Sentry.captureMessage("On open by push ${notificationResponse.payload}");
    pushHandler(notificationResponse.payload);
  });
  await FCMService.getFCMToken();
  await FCMService.getAPNSToken();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

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
