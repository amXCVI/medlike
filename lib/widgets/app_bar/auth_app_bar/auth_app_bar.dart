import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/navigation/routes_names_map.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    Key? key,
    required this.title,
    this.isChildrenPage = false,
  }) : super(key: key);
  final String title;
  final bool isChildrenPage;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      leading: isChildrenPage
          ? IconButton(
              onPressed: () {
                RouteData.of(context).router.popTop();
              },
              icon: SvgPicture.asset('assets/icons/app_bar/app_bar_back_icon.svg'))
          : IconButton(
              onPressed: () {
                RouteData.of(context).router.navigateNamed(AppRoutes.main);
              },
              icon: Image.asset('assets/icons/ic_logo_launch.png')),
      title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      centerTitle: true,
    );
  }
}
