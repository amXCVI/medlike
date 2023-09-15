import 'package:flutter/material.dart';

class UnAuthWebAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UnAuthWebAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
