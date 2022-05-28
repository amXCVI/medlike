import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/navigation/routes_names_map.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            RouteData.of(context).router.navigateNamed(AppRoutes.main);
          },
          icon: Image.asset('assets/icons/ic_logo_launch.png')),
      title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      centerTitle: true,
    );
  }
}
