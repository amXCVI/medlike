import 'package:flutter/material.dart';
import 'package:medlike/widgets/app_bar/web_app_bars/web_app_bar_unauth.dart';
import 'package:medlike/widgets/default_scaffold/unauth_checker.dart';
import 'package:medlike/widgets/main_menu/web_drawer.dart';

class DefaultWebScaffold extends StatelessWidget {
  const DefaultWebScaffold({
    Key? key,
    required this.child,
    required this.isAuth,
  }) : super(key: key);

  final Widget child;
  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UnAuthWebAppBar(isAuth: isAuth),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isAuth ? const WebDrawerMenu() : const SizedBox(),
          Expanded(child: child),
          const UnAuthChecker(),
        ],
      ),
    );
  }
}
