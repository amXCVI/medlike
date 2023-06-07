import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/prompt/prompt_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/utils/helpers/resume_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class InactivityManager extends StatefulWidget {
  const InactivityManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<InactivityManager> createState() => _InactivityManagerState();
}

class _InactivityManagerState extends State<InactivityManager>
    with WidgetsBindingObserver {
  late Timer _timer = Timer(const Duration(hours: 1), () {});
  late bool isLogoutApp = false;

  @override
  void initState() {
    super.initState();

    /// TODO: переписать нормально из хелпера 
    /// в вызов метода кубита
    getSmartappTokenHelper(context);

    WidgetsBinding.instance.addObserver(this);
    _initializeTimer();

    LocalNotificationService.requestPermission().then((value) async {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      print('!!!!!!!!! FCM Token: $fcmToken');

      /// TODO Terminated State
      /// 1. This method call when app in terminated state and you get a notification
      // when you click on notification app open from terminated state and
      // you can get notification data in this method
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          Sentry.captureMessage("FirebaseMessaging.instance.getInitialMessage ${message.data["title"]}");
          LocalNotificationService.createAndDisplayNotification(message);
        }
      }).catchError((error) {
        print(error);
      });

      /// TODO Foreground State
      /// 2. This method only call when App in foreground it mean app must be opened
      FirebaseMessaging.onMessage.listen((message) {
        print("FirebaseMessaging.onMessage.listen");
        //if (message.notification != null) {
          //print(message.notification.title);
          //print(message.notification.body);
          Sentry.captureMessage("FirebaseMessaging.onMessage.listen ${message.data["title"]}");
          LocalNotificationService.createAndDisplayNotification(message);
        //}
      });

      /// TODO Background State
      /// 3. This method only call when App in background and not terminated(not closed)
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        Sentry.captureMessage("FirebaseMessaging.onMessageOpenedApp.listen ${message.data["title"]}");
        LocalNotificationService.createAndDisplayNotification(message);
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    const dur = Duration(
        minutes: kDebugMode ? 60 : AppConstants.timeoutDurationMinutes);

    if (state != AppLifecycleState.resumed) {
      await UserSecureStorage.setField(
          AppConstants.timeoutStart, DateTime.now().toString());
      context.read<PromptCubit>().unselect();
    } else {
      final time = DateTime.tryParse(
          await UserSecureStorage.getField(AppConstants.timeoutStart) ?? '');
      if (time == null || DateTime.now().difference(time) >= dur) {
        _logOutUser();
      }
    }
  }

  void _initializeTimer() {
    _timer = Timer.periodic(
        const Duration(
            minutes: kDebugMode ? 60 : AppConstants.timeoutDurationMinutes),
        (_) => {_logOutUser()});
  }

  void _logOutUser() {
    context.read<PromptCubit>().unselect();
    setState(() {
      isLogoutApp = true;
    });
    _timer.cancel();
  }

  void _handleUserInteraction([_]) {
    if (!_timer.isActive) {
      return;
    }

    _timer.cancel();
    _initializeTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    if (isLogoutApp) {
      /// Убираем логаут по истеечнии времени
      // context.read<UserCubit>().signOut();
      _initializeTimer();
    }

    return Listener(
      onPointerDown: _handleUserInteraction, // best place to reset timer imo
      onPointerMove: _handleUserInteraction,
      onPointerUp: _handleUserInteraction,
      child: widget.child,
    );
  }
}
