import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/app.dart';
import 'package:medlike/utils/notifications/push_notifications_service.dart';
import 'package:testfairy_flutter/testfairy_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TestFairy.begin("SDK-clfFRlpJ");

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await FCMService.initializeFirebase();
  await FCMService.initializeLocalNotifications();
  await FCMService.onBackgroundMsg();
  await FCMService.onMessage();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(App());

}
