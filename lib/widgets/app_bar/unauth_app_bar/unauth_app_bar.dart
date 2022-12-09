import 'package:flutter/material.dart';

class UnAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UnAuthAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: Row(
        children: [
          Image.asset(
            'assets/icons/ic_logo_launch.png',
            width: 28,
          ),
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/ic_feedback_navbar_outline.png'))
        ],
      ),
      // leading: Image.asset(
      //   'assets/icons/ic_logo_launch.png',
      //   width: 28,
      // ),
      // title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      // centerTitle: true,
      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: Image.asset('assets/icons/ic_feedback_navbar_outline.png'))
      // ],
    );
  }
}
