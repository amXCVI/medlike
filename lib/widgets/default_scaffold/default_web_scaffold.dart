import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
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
    bool isAuth = context.read<UserCubit>().isAuthorizedUser();

    return Scaffold(
      appBar: UnAuthWebAppBar(isAuth: isAuth),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isAuth ? const WebDrawerMenu() : const SizedBox(),
          Expanded(child: widget.child),
          const UnAuthChecker(),
        ],
      ),
    );
  }
}
