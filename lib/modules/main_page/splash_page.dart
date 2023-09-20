import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/helpers/project_determiner.dart';

/// Splash screen that will be opened every time user opens up an app
///
/// [parallelAction] - Action that'll be running "parallel" of the splash screen
@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.parallelAction});

  final Future<bool> parallelAction;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SvgPicture picture = SvgPicture.asset('assets/icons/ic_splash_filled.svg');

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: TweenAnimationBuilder<double>(
          builder: (context, value, child) =>
              SizedBox(width: 128 * value, height: 128 * value, child: child!),
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 0, end: 1),
          curve: Curves.easeOutCirc,
          child: picture,
          onEnd: () {
            widget.parallelAction.then((value) {
              if (ProjectDeterminer.getProjectType() == Projects.WEB) {
                context.router.navigateNamed(AppRoutes.main);
              } else {
                context.router.navigateNamed(
                    value ? AppRoutes.loginPinCodeCheck : AppRoutes.loginPhone);
              }
            });
          },
        ),
      ),
    );
  }
}
