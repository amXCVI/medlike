import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medlike/utils/helpers/push_handle_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<PermissionStatus> requestPermission() async {
    const permission = Permission.notification;
    final status = await permission.status;
    if (status.isGranted) {
      print('User granted this permission before');
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      print('!!!!!!!!! FCM Token: $fcmToken');
      return status;
    } else {
      final before = await permission.shouldShowRequestRationale;
      final rs = await [permission, Permission.photos].request();
      final after = await permission.shouldShowRequestRationale;

      if (rs[0]?.isGranted == true) {
        print('User granted this permission');
      } else if (!before && after) {
        print('Show permission request pop-up and user denied first time');
      } else if (before && !after) {
        print('Show permission request pop-up and user denied a second time');
      } else if (!before && !after) {
        print('No more permission pop-ups displayed');
      }
    }

    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print('!!!!!!!!! FCM Token: $fcmToken');
    print('!!!!!!!!! isGranted ${status.isGranted}');
    return status;
  }

  static void initialize(BuildContext? context) {
    // initializationSettings for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse? response) async {
        Sentry.captureMessage("JSON payload: ${response == null} ${response?.payload}");
        if (response != null) {
          pushHandler(response.payload);
        }
      },
      onDidReceiveBackgroundNotificationResponse: (NotificationResponse? response) async {
        Sentry.captureMessage("JSON background payload: ${response?.payload}");
        if (response != null) {
          pushHandler(response.payload);
        }
      }
    );
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "flutter_push_notification_app",
          "flutter_push_notification_app",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      /// pop up show
      await _notificationsPlugin.show(
        id,
        message.data['title'],
        message.data['message'],
        notificationDetails,
        payload: message.data["_id"],
        ////////////////////////////////////////////////////////////////////
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
