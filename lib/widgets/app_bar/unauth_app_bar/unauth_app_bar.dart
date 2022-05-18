import 'package:flutter/material.dart';

class UnAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UnAuthAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      leading: Image.asset('assets/icons/ic_logo_launch.png'),
      title: Text(title, style: Theme.of(context).textTheme.bodyText2),
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset('assets/icons/ic_feedback_navbar_outline.png'))
      ],
    );
  }
}
