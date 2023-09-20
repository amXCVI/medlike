import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/app/app_cubit.dart';

import 'main_menu_items_list.dart';
import 'menu_item.dart';

class WebDrawerMenu extends StatelessWidget {
  const WebDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentRoute = context.router.current.path;

    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      bool isOpenedMenuDrawer =
          appState.isOpenedWebMenu == null || appState.isOpenedWebMenu == true;

      return AnimatedContainer(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Theme.of(context).dividerColor),
          ),
          color: Theme.of(context).colorScheme.background,
        ),
        width: isOpenedMenuDrawer
            ? AppConstants.webMenuOpenedWidth
            : AppConstants.webMenuClosedWidth,
        height: MediaQuery.of(context).size.height,
        duration: const Duration(milliseconds: 500),
        child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 12),
            shrinkWrap: true,
            children: mainMenuItemsList.map((item) {
              return MainMenuItem(
                svgIconPath: item.svgIconPath,
                title: item.title,
                isSelected: currentRoute.contains(item.name),
                svgFilledIconPath: item.svgFilledIconPath,
                link: item.link,
                isIconOnly: isOpenedMenuDrawer ? false : true,
              );
            }).toList()),
      );
    });
  }
}
