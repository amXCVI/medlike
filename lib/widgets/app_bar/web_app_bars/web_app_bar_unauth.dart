import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/app/app_cubit.dart';

class UnAuthWebAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UnAuthWebAppBar({Key? key, required this.isAuth}) : super(key: key);

  final bool isAuth;

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppConstants.webAppBarHeight - 24);

  void handleTapOnMenuIcon(BuildContext context) {
    context.read<AppCubit>().clickOnWebMenu();
  }

  @override
  Widget build(BuildContext context) {
    if (!isAuth) {
      return const SizedBox();
    }
    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      bool isOpenedMenuDrawer =
          appState.isOpenedWebMenu == null || appState.isOpenedWebMenu == true;
      return AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 1,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              width: isOpenedMenuDrawer
                  ? AppConstants.webMenuOpenedWidth - 16
                  : AppConstants.webMenuClosedWidth - 16,
              padding: EdgeInsets.symmetric(
                  vertical: 12, horizontal: isOpenedMenuDrawer ? 22 : 12),
              duration: const Duration(milliseconds: 500),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => handleTapOnMenuIcon(context),
                    icon: SvgPicture.asset(
                      'assets/icons/menu_icons/ic_menu_icon_web.svg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
