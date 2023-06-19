import 'package:flutter/material.dart';
import 'package:js/js.dart';

@JS('window.location.href')
external String href;

class SmartappNavigatorObserver extends NavigatorObserver {
  void _printRoute(String type, Route<dynamic>? route, Route<dynamic>? previousRoute) {
    print('!!!!!!!!!!!!!!!!!!!!!!!! ROUTES $type: $route - $previousRoute');
    print('!!!!!!!!!!!!!!!!!!!!!!!! ROUTES HREF $href ${route?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _printRoute("didPop", route, previousRoute);
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _printRoute("didPush", route, previousRoute);
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _printRoute("didRemove", route, previousRoute);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({ Route<dynamic>? newRoute, Route<dynamic>? oldRoute }) {
    _printRoute("didReplace", newRoute, oldRoute);
    super.didReplace(
      newRoute: newRoute,
      oldRoute: oldRoute
    );
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _printRoute("didStartUserGesture", route, previousRoute);
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    _printRoute("didStopUserGesture", null, null);
    super.didStopUserGesture();
  }
}
