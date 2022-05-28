import 'package:flutter/material.dart';

class IconWithBottomLabel extends StatelessWidget {
  const IconWithBottomLabel({Key? key, required this.icon, required this.label}) : super(key: key);

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Text(label, style: Theme.of(context).textTheme.labelSmall,)
      ],
    );
  }
}
