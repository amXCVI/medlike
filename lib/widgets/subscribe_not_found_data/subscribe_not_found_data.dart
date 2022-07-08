import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class SubscribeNotFoundData extends StatelessWidget {
  const SubscribeNotFoundData({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Center(
          child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppColors.lightText),
      )),
    );
  }
}
