import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/widgets/main_menu/main_menu_items_list.dart';
import 'package:medlike/widgets/main_menu/menu_item.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentRoute = context.router.current.path;
    return Flexible(
      child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shrinkWrap: true,
          children: mainMenuItemsList.map((item) {
            print('currentRoute: ${item.name}');

            return MainMenuItem(
                svgIconPath: item.svgIconPath,
                title: item.title,
                isSelected: currentRoute.contains(item.name),
                svgFilledIconPath: item.svgFilledIconPath,
                link: item.link);
          }).toList()),
    );
  }
}
