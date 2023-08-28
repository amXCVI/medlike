import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/navigation/routes_names_map.dart';

/// Splash screen that will be opened every time user opens up an app
///
/// [nextPage] - route to the page that will be opened afterwards
@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.nextPage});
  final String nextPage;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void showSplashScreen() async {
    await Future.delayed(const Duration(), () =>
        context.router.replaceNamed(
            widget.nextPage));
  }

  @override
  Widget build(BuildContext context) {
    showSplashScreen();
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      color: Colors.white,
      child:
      Center(child: SvgPicture.asset("assets/icons/ic_splash_filled.svg")),
    );
  }
}
