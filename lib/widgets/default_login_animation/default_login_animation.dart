import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/constants/app_constants.dart';

class DefaultLoginAnimation extends StatelessWidget {
  const DefaultLoginAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 0, top: 6, right: 0, bottom: 35),
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
          child: Lottie.asset(
            'assets/animations/onboarding_animation.json',
            fit: BoxFit.fitHeight,
            height:
                MediaQuery.of(context).size.width < AppConstants.smScreenWidth
                    ? MediaQuery.of(context).size.width * 0.7
                    : MediaQuery.of(context).size.width * 0.9,
          ),
        ));
  }
}
