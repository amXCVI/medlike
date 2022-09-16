import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NextActionButtonItem extends StatelessWidget {
  const NextActionButtonItem({
    Key? key,
    required this.handleTap,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  final void Function() handleTap;
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
          onTap: handleTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const SizedBox(width: 16),
                SvgPicture.asset(iconPath),
                const SizedBox(width: 16),
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const Expanded(child: SizedBox()),
                SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg'),
                const SizedBox(width: 16),
              ],
            ),
          )),
    );
  }
}
