import 'dart:io';

import 'package:flutter/cupertino.dart';

class CustomWillPopScope extends StatelessWidget {
  const CustomWillPopScope(
      {Key? key, required this.child, required this.onWillPop})
      : super(key: key);

  final Widget child;
  final Function() onWillPop;

  @override
  Widget build(BuildContext context) {
    return !Platform.isIOS
        ? WillPopScope(child: child, onWillPop: onWillPop())
        : GestureDetector(
        onHorizontalDragUpdate: (details) {
          // int sensitivity = Integers().iosSwipeSensitivity;
          if (details.delta.dx > 0) {
            onWillPop();
          }
        },
        child: child,
    );
  }
}
