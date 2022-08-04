import 'package:flutter/material.dart';

class DefaultScrollbar extends StatelessWidget {
  const DefaultScrollbar({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: child);
  }
}
