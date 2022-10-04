@JS()
library boundle.js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlike/app.dart';

import 'dart:js' as js;


import 'package:js/js.dart';

@JS()
@anonymous
abstract class WebBridge {
  external factory WebBridge();
  external void enableLogs();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(App());


  var bridge = js.JsObject.fromBrowserObject(js.context['webBridgeInstance']);


  print(bridge['logsEnabled']);
  print(bridge['isRenameParamsEnabled']);

  js.context['webBridgeInstance'].callMethod('enableLogs');

  // print(bridge['logsEnabled']);
}
