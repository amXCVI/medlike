import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key, this.radius = 20}) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/loader.json',
      width: radius * 2,
      height: radius * 2,
    );
  }
}
