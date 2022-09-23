import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver appAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> registerAppOpenEvent() async {
    await FirebaseAnalytics.instance.logAppOpen();
  }

  static Future<void> registerAppLoginEvent() async {
    await FirebaseAnalytics.instance.logLogin();
  }

  static Future<void> registerCustomEvent({
    required String name,
    Map<String, Object?>? parameters,
    AnalyticsCallOptions? callOptions,
  }) async {
    await FirebaseAnalytics.instance
        .logEvent(name: name, parameters: parameters, callOptions: callOptions);
  }
}
