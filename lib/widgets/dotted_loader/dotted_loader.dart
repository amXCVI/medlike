import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DottedLoader extends StatelessWidget {
  const DottedLoader({super.key});
  @override
  Widget build(BuildContext context) =>
      Lottie.asset("assets/animations/pin_loading_lottie.json");
}
