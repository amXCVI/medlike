import 'package:flutter/material.dart';
import 'package:medlike/widgets/app_bar/web_app_bars/web_app_bar_unauth.dart';
import 'package:medlike/widgets/default_scaffold/unauth_checker.dart';
import 'package:medlike/widgets/main_menu/web_drawer.dart';

class DefaultWebScaffold extends StatefulWidget {
  const DefaultWebScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<DefaultWebScaffold> createState() => _DefaultWebScaffoldState();
}

class _DefaultWebScaffoldState extends State<DefaultWebScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UnAuthWebAppBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WebDrawerMenu(),
          Expanded(child: widget.child),
          const UnAuthChecker(),
        ],
      ),
    );
  }
}
