import 'package:flutter/material.dart';
import 'package:medlike/app.dart';

void main() async {
  runApp(App());

  // BlocOverrides.runZoned(
  //   () => runApp(App()),
  //   blocObserver: SimpleBlocObserver(),
  // );
}
