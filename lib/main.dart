import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/app.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/firebase_options.dart';
import 'package:medlike/utils/notifications/push_notifications_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        name: AppConstants.appName,
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (err) {
    rethrow;
  }

  await FCMService.initializeLocalNotifications();
  await FCMService.onBackgroundMsg();
  await FCMService.onMessage();

  runApp(App());

}
