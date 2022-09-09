import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/firebase_options.dart';

class FCMService {
  static FirebaseMessaging? _firebaseMessaging;

  static Future<void> initializeFirebase() async {
    try {
      if (Firebase.apps.isEmpty) {
        /// Непонятно, почему в ios нельзя указать название приложения
        /// Не работает. Для Android название обязательно
        await Firebase.initializeApp(
          name: Platform.isAndroid ? AppConstants.appName : '[DEFAULT]',
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
    } catch (err) {
      rethrow;
    }
    FCMService._firebaseMessaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings =
        await FCMService._firebaseMessaging!.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
      // TODO: handle the received notifications
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }

  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeLocalNotifications() async {
    const InitializationSettings _initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/launcher_icon"),
      iOS: IOSInitializationSettings(),
    );
    await FCMService._localNotificationsPlugin
        .initialize(_initializationSettings);
  }

  static NotificationDetails platformChannelSpecifics =
      const NotificationDetails(
    android: AndroidNotificationDetails(
      "channel id",
      "channel name",
      priority: Priority.high,
      importance: Importance.max,
    ),
    iOS: IOSNotificationDetails(),
  );

  static FirebaseMessaging _getFMInstance() {
    if (FCMService._firebaseMessaging == null) {
      return FirebaseMessaging.instance;
    } else {
      return FCMService._firebaseMessaging!;
    }
  }

  static Future<void> onBackgroundMsg() async {
    await FCMService._getFMInstance().getInitialMessage();
    FirebaseMessaging.onBackgroundMessage(FCMService.fcmBackgroundHandler);
  }

  static Future<void> fcmBackgroundHandler(RemoteMessage message) async {
    await FCMService._localNotificationsPlugin.show(
      0,
      message.data['title'],
      message.data['message'],
      FCMService.platformChannelSpecifics,
      payload: "new follower",
    );
  }

  static Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await FCMService._localNotificationsPlugin.show(
        0,
        message.data['title'],
        message.data['message'],
        FCMService.platformChannelSpecifics,
        payload: "new follower",
      );
    });
  }
}
