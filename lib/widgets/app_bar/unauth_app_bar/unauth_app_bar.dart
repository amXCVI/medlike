import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      leading: SvgPicture.asset('assets/icons/small_app_logo.svg'),
      title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/ic_feedback_navbar_outline.png'))
      ],
    );
  }
}
