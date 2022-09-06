import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/app.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:medlike/firebase_options.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // try {
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  //   // Pass all uncaught errors from the framework to Crashlytics.
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // } catch (err) {
  //   rethrow;
  // }

  // final fcmToken = await FirebaseMessaging.instance.getToken();


  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          name: AppConstants.appName,
          options: DefaultFirebaseOptions.currentPlatform,
        );
      } else {
        print('!!!!!!!!!!!!!!!!!!!!!${Firebase.apps.map((e) => e.name)}');
      }
    } catch (err) {
      rethrow;
    }

    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    messaging.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.
      UserRepository().registerDeviceFirebaseToken(token: fcmToken);

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      AppToast.showAppToast(
          msg:
          'Ошибка соединения с firebase. Мы в курсе проблемы и работаем над ее разрешением');
      // Error getting token.
    });

    runApp(App());

    // Запрашиваем разрешение показывать уведомления (Для apple)
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }, (error, stackTrace) {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });

  // FirebaseCrashlytics.instance.crash();

  // AppToast.showAppToast(
  //     msg: 'User granted permission: ${settings.authorizationStatus}');

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   AppToast.showAppToast(msg: 'Got a message whilst in the foreground!');
  //   AppToast.showAppToast(msg: 'Message data: ${message.data}');
  //
  //   if (message.notification != null) {
  //     AppToast.showAppToast(
  //         msg:
  //             'Message also contained a notification: ${message.notification}');
  //   }
  // });
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//
//   AppToast.showAppToast(
//       msg: "Handling a background message: ${message.messageId}");
// }

//
//
// import 'dart:async';
//
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// import 'tabs_page.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//   static FirebaseAnalyticsObserver observer =
//   FirebaseAnalyticsObserver(analytics: analytics);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Analytics Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       navigatorObservers: <NavigatorObserver>[observer],
//       home: MyHomePage(
//         title: 'Firebase Analytics Demo',
//         analytics: analytics,
//         observer: observer,
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//     required this.title,
//     required this.analytics,
//     required this.observer,
//   }) : super(key: key);
//
//   final String title;
//   final FirebaseAnalytics analytics;
//   final FirebaseAnalyticsObserver observer;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String _message = '';
//
//   void setMessage(String message) {
//     setState(() {
//       _message = message;
//     });
//   }
//
//   Future<void> _sendAnalyticsEvent() async {
//     await widget.analytics.logEvent(
//       name: 'test_event',
//       parameters: <String, dynamic>{
//         'string': 'string',
//         'int': 42,
//         'long': 12345678910,
//         'double': 42.0,
//         // Only strings and numbers (ints & doubles) are supported for GA custom event parameters:
//         // https://developers.google.com/analytics/devguides/collection/analyticsjs/custom-dims-mets#overview
//         'bool': true.toString(),
//         'items': [itemCreator()]
//       },
//     );
//     setMessage('logEvent succeeded');
//   }
//
//   Future<void> _testSetUserId() async {
//     await widget.analytics.setUserId(id: 'some-user');
//     setMessage('setUserId succeeded');
//   }
//
//   Future<void> _testSetCurrentScreen() async {
//     await widget.analytics.setCurrentScreen(
//       screenName: 'Analytics Demo',
//       screenClassOverride: 'AnalyticsDemo',
//     );
//     setMessage('setCurrentScreen succeeded');
//   }
//
//   Future<void> _testSetAnalyticsCollectionEnabled() async {
//     await widget.analytics.setAnalyticsCollectionEnabled(false);
//     await widget.analytics.setAnalyticsCollectionEnabled(true);
//     setMessage('setAnalyticsCollectionEnabled succeeded');
//   }
//
//   Future<void> _testSetSessionTimeoutDuration() async {
//     await widget.analytics
//         .setSessionTimeoutDuration(const Duration(milliseconds: 20000));
//     setMessage('setSessionTimeoutDuration succeeded');
//   }
//
//   Future<void> _testSetUserProperty() async {
//     await widget.analytics.setUserProperty(name: 'regular', value: 'indeed');
//     setMessage('setUserProperty succeeded');
//   }
//
//   Future<void> _testAppInstanceId() async {
//     String? id = await widget.analytics.appInstanceId;
//     if (id != null) {
//       setMessage('appInstanceId succeeded: $id');
//     } else {
//       setMessage('appInstanceId failed, consent declined');
//     }
//   }
//
//   Future<void> _testResetAnalyticsData() async {
//     await widget.analytics.resetAnalyticsData();
//     setMessage('resetAnalyticsData succeeded');
//   }
//
//   AnalyticsEventItem itemCreator() {
//     return AnalyticsEventItem(
//       affiliation: 'affil',
//       coupon: 'coup',
//       creativeName: 'creativeName',
//       creativeSlot: 'creativeSlot',
//       discount: 2.22,
//       index: 3,
//       itemBrand: 'itemBrand',
//       itemCategory: 'itemCategory',
//       itemCategory2: 'itemCategory2',
//       itemCategory3: 'itemCategory3',
//       itemCategory4: 'itemCategory4',
//       itemCategory5: 'itemCategory5',
//       itemId: 'itemId',
//       itemListId: 'itemListId',
//       itemListName: 'itemListName',
//       itemName: 'itemName',
//       itemVariant: 'itemVariant',
//       locationId: 'locationId',
//       price: 9.99,
//       currency: 'USD',
//       promotionId: 'promotionId',
//       promotionName: 'promotionName',
//       quantity: 1,
//     );
//   }
//
//   Future<void> _testAllEventTypes() async {
//     await widget.analytics.logAddPaymentInfo();
//     await widget.analytics.logAddToCart(
//       currency: 'USD',
//       value: 123,
//       items: [itemCreator(), itemCreator()],
//     );
//     await widget.analytics.logAddToWishlist();
//     await widget.analytics.logAppOpen();
//     await widget.analytics.logBeginCheckout(
//       value: 123,
//       currency: 'USD',
//       items: [itemCreator(), itemCreator()],
//     );
//     await widget.analytics.logCampaignDetails(
//       source: 'source',
//       medium: 'medium',
//       campaign: 'campaign',
//       term: 'term',
//       content: 'content',
//       aclid: 'aclid',
//       cp1: 'cp1',
//     );
//     await widget.analytics.logEarnVirtualCurrency(
//       virtualCurrencyName: 'bitcoin',
//       value: 345.66,
//     );
//
//     await widget.analytics.logGenerateLead(
//       currency: 'USD',
//       value: 123.45,
//     );
//     await widget.analytics.logJoinGroup(
//       groupId: 'test group id',
//     );
//     await widget.analytics.logLevelUp(
//       level: 5,
//       character: 'witch doctor',
//     );
//     await widget.analytics.logLogin(loginMethod: 'login');
//     await widget.analytics.logPostScore(
//       score: 1000000,
//       level: 70,
//       character: 'tiefling cleric',
//     );
//     await widget.analytics
//         .logPurchase(currency: 'USD', transactionId: 'transaction-id');
//     await widget.analytics.logSearch(
//       searchTerm: 'hotel',
//       numberOfNights: 2,
//       numberOfRooms: 1,
//       numberOfPassengers: 3,
//       origin: 'test origin',
//       destination: 'test destination',
//       startDate: '2015-09-14',
//       endDate: '2015-09-16',
//       travelClass: 'test travel class',
//     );
//     await widget.analytics.logSelectContent(
//       contentType: 'test content type',
//       itemId: 'test item id',
//     );
//     await widget.analytics.logSelectPromotion(
//       creativeName: 'promotion name',
//       creativeSlot: 'promotion slot',
//       items: [itemCreator()],
//       locationId: 'United States',
//     );
//     await widget.analytics.logSelectItem(
//       items: [itemCreator(), itemCreator()],
//       itemListName: 't-shirt',
//       itemListId: '1234',
//     );
//     await widget.analytics.logScreenView(
//       screenName: 'tabs-page',
//     );
//     await widget.analytics.logViewCart(
//       currency: 'USD',
//       value: 123,
//       items: [itemCreator(), itemCreator()],
//     );
//     await widget.analytics.logShare(
//       contentType: 'test content type',
//       itemId: 'test item id',
//       method: 'facebook',
//     );
//     await widget.analytics.logSignUp(
//       signUpMethod: 'test sign up method',
//     );
//     await widget.analytics.logSpendVirtualCurrency(
//       itemName: 'test item name',
//       virtualCurrencyName: 'bitcoin',
//       value: 34,
//     );
//     await widget.analytics.logViewPromotion(
//       creativeName: 'promotion name',
//       creativeSlot: 'promotion slot',
//       items: [itemCreator()],
//       locationId: 'United States',
//       promotionId: '1234',
//       promotionName: 'big sale',
//     );
//     await widget.analytics.logRefund(
//       currency: 'USD',
//       value: 123,
//       items: [itemCreator(), itemCreator()],
//     );
//     await widget.analytics.logTutorialBegin();
//     await widget.analytics.logTutorialComplete();
//     await widget.analytics.logUnlockAchievement(id: 'all Firebase API covered');
//     await widget.analytics.logViewItem(
//       currency: 'usd',
//       value: 1000,
//       items: [itemCreator()],
//     );
//     await widget.analytics.logViewItemList(
//       itemListId: 't-shirt-4321',
//       itemListName: 'green t-shirt',
//       items: [itemCreator()],
//     );
//     await widget.analytics.logViewSearchResults(
//       searchTerm: 'test search term',
//     );
//     setMessage('All standard events logged successfully');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: <Widget>[
//           MaterialButton(
//             onPressed: _sendAnalyticsEvent,
//             child: const Text('Test logEvent'),
//           ),
//           MaterialButton(
//             onPressed: _testAllEventTypes,
//             child: const Text('Test standard event types'),
//           ),
//           MaterialButton(
//             onPressed: _testSetUserId,
//             child: const Text('Test setUserId'),
//           ),
//           MaterialButton(
//             onPressed: _testSetCurrentScreen,
//             child: const Text('Test setCurrentScreen'),
//           ),
//           MaterialButton(
//             onPressed: _testSetAnalyticsCollectionEnabled,
//             child: const Text('Test setAnalyticsCollectionEnabled'),
//           ),
//           MaterialButton(
//             onPressed: _testSetSessionTimeoutDuration,
//             child: const Text('Test setSessionTimeoutDuration'),
//           ),
//           MaterialButton(
//             onPressed: _testSetUserProperty,
//             child: const Text('Test setUserProperty'),
//           ),
//           MaterialButton(
//             onPressed: _testAppInstanceId,
//             child: const Text('Test appInstanceId'),
//           ),
//           MaterialButton(
//             onPressed: _testResetAnalyticsData,
//             child: const Text('Test resetAnalyticsData'),
//           ),
//           Text(
//             _message,
//             style: const TextStyle(color: Color.fromARGB(255, 0, 155, 0)),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute<TabsPage>(
//               settings: const RouteSettings(name: TabsPage.routeName),
//               builder: (BuildContext context) {
//                 return TabsPage(widget.observer);
//               },
//             ),
//           );
//         },
//         child: const Icon(Icons.tab),
//       ),
//     );
//   }
// }
