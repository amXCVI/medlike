import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:medlike/app.dart';
import 'package:flutter/widgets.dart';
import 'package:medlike/constants/entity_types.dart';
import 'package:medlike/navigation/guards.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/notifications/push_navigation_service.dart';
import 'package:medlike/utils/notifications/push_notifications_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:testfairy_flutter/testfairy_flutter.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  await FCMService.fcmBackgroundHandler(message);
}

void onPayload(String? payload) {
  final data = jsonDecode(payload ?? '{}');

  final _router = getIt<AppRouter>();
  final pushNavigationService = getIt<PushNavigationService>();

  final userId = data['UserId'] as String?;

  switch(data['EntityType']) {
    case EntityType.newMedcardEvent:
      if(userId != null) {
        _router.push(
          MedcardRoute(
            userId: userId,
            isChildrenPage: true,
            eventId: data['EventId']
          )
        );
      }
      break;
    case EntityType.appointmentCanceled:
    case EntityType.appointmentScheduled:
    case EntityType.appointmentReminder24h:
      final message = data['message'] as String?; 
      final parts = message?.split(',');
      if((parts?.length ?? 0) > 1) {
        try{
          final dt = parts![1];
          final dateString = dt.split(" ")[1];
          DateFormat dateFormat = DateFormat("dd.MM.yyyy");

          Sentry.captureMessage("Push message: $message $dateString ${dateFormat.parse(dateString)}");
          final date = dateFormat.parse(dateString);
          pushNavigationService.nextPage = AppointmentsRoute(
            initDay: date
          );

          _router.push(
            AppointmentsRoute(
              initDay: date
            )
          );
        } catch(err, stackTrace) {
          Sentry.captureException(err, stackTrace: stackTrace);
          _router.push(AppointmentsRoute());
        }
      }
      break;
    case EntityType.memberAttached:
      _router.push(const MainRoute());
      break;
    }
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

  await FCMService.initializeFirebase();
  await FCMService.initializeLocalNotifications();
  await FCMService.onBackgroundMsg(_firebaseMessagingBackgroundHandler);
  //await FCMService.onMessage();
  FCMService.initializeSelect((notificationResponse) {
    Sentry.captureMessage("On push tap ${notificationResponse.payload}");
    onPayload(notificationResponse.payload);
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
