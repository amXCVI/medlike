import 'package:flutter/material.dart';
import 'package:medlike/widgets/default_scaffold/unauth_checker.dart';

class DefaultWebScaffold extends StatelessWidget {
  const DefaultWebScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          const UnAuthChecker(),
        ],
      ),
    );
  }
}
