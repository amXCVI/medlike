import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/app/app_cubit.dart';
import 'package:medlike/utils/media/media_queryes.dart';
import 'package:medlike/widgets/app_bar/web_app_bars/web_app_bar_unauth.dart';
import 'package:medlike/widgets/default_scaffold/unauth_checker.dart';
import 'package:medlike/widgets/main_menu/web_drawer.dart';

class DefaultWebScaffold extends StatelessWidget {
  const DefaultWebScaffold({
    Key? key,
    required this.child,
    required this.isAuth,
    this.actionButton,
    this.isBottomIndent = true,
  }) : super(key: key);

  final Widget child;
  final bool isAuth;
  final Widget? actionButton;
  final bool isBottomIndent;

  @override
  Widget build(BuildContext context) {
    if (!AppMediaQuery.isDesktop(context)) {
      context.read<AppCubit>().closeWebMenuInitial(context);
    }

    return Scaffold(
      appBar: UnAuthWebAppBar(isAuth: isAuth),
      floatingActionButton: actionButton != null
          ? BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
              bool isOpenedMenuDrawer = appState.isOpenedWebMenu == null ||
                  appState.isOpenedWebMenu == true;
              return SizedBox(
                width: MediaQuery.of(context).size.width -
                    32 -
                    (isOpenedMenuDrawer
                        ? AppConstants.webMenuOpenedWidth
                        : AppConstants.webMenuClosedWidth),
                child: actionButton,
              );
            })
          : const SizedBox(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isAuth ? const WebDrawerMenu() : const SizedBox(),
          Expanded(
            child: Column(
              children: [
                Expanded(child: child),
                SizedBox(
                    height: actionButton != null && isBottomIndent ? 48 : 0)
              ],
            ),
          ),
          const UnAuthChecker(),
        ],
      ),
    );
  }
}
