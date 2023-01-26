import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medlike/app.dart';
import 'package:flutter/widgets.dart';
import 'package:medlike/utils/notifications/push_notifications_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:testfairy_flutter/testfairy_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TestFairy.begin("SDK-clfFRlpJ");

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await FCMService.initializeFirebase();
  await FCMService.initializeLocalNotifications();
  await FCMService.onBackgroundMsg();
  //await FCMService.onMessage();
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
