import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

  /// TODO: понять где вызывать
  static Future<void> initializeSelect(Function(NotificationResponse notificationResponse) onSelectNotification) async {
    final InitializationSettings _initializationSettings =
        InitializationSettings(
      android: const AndroidInitializationSettings("@mipmap/launcher_icon"),
      iOS: DarwinInitializationSettings(
        onDidReceiveLocalNotification: ((id, title, body, payload) {
          Sentry.captureMessage("$id $title $body $payload");
        })
      ),
    );

    _notificationsPlugin.initialize(
      _initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        Sentry.captureMessage("FC details: ${details.payload}");
        onSelectNotification(details);
      },
      onDidReceiveBackgroundNotificationResponse:(details) {
        Sentry.captureMessage("BC details: ${details.payload}");
        onSelectNotification(details);
      },
    );
  }

  static Future<void> checkNotificationClicked(
    Function(NotificationResponse notificationResponse) onSelectNotification
  ) async {
     Sentry.captureMessage("NotificationService.checkNotificationClicked()");
    NotificationAppLaunchDetails? details =
        await _notificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null &&
        details.didNotificationLaunchApp &&
        details.notificationResponse != null) {
      onSelectNotification(details.notificationResponse!);
    }
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "flutter_push_notification_app",
          "flutter_push_notification_app",
          icon: "@mipmap/launcher_icon",
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
        payload: jsonEncode(message.data)
      );
    } on Exception catch (e) {
      Sentry.captureMessage("${message.data['title']} error: $e ${StackTrace.current}");
      Sentry.captureException(e, stackTrace: StackTrace.current);
    }
  }
}
