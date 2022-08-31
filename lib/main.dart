import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medlike/app.dart';
import 'package:medlike/utils/firebase/firebase_manager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  FirebaseManager.initFirebase();

  runApp(App());

  FlutterLocalNotificationsPlugin();
}
