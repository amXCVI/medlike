import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medlike/constants/client_platforms.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/firebase_options.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

class FirebaseManager {
  static void initFirebase() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        name: 'zClinic',
        options: DefaultFirebaseOptions.currentPlatform,
      ).then((value) => null).catchError((err) => {
            print('!ERROR!: ${err.toString()}'),
          });
    } else {
      AppToast.showAppToast(msg: '${Firebase.apps.map((e) => e.name).toList()}');
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.requestPermission();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // The statement below will fetch the device token and
    // store it in the token variable.
    String? token = await FirebaseMessaging.instance.getToken();
    // The statement below will print the device token id
    print("Token = " + token.toString());
    UserRepository()
        .registerUserDevice(
            deviceId: token.toString(),
            clientPlatform: Platform.isAndroid
                ? ClientPlatforms.android
                : ClientPlatforms.ios,
            appBuildType: kDebugMode ? 0 : 1) // Dev = 0, Prod = 1
        .then((value) =>
            {AppToast.showAppToast(msg: 'set firebase token: $token')});
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.',
  // description
  importance: Importance.high,
);
