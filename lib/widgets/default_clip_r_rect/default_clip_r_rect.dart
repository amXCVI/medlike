import 'package:flutter/material.dart';

class DefaultClipRRect extends StatelessWidget {
  const DefaultClipRRect({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
      child: child,
    );
  }
}
