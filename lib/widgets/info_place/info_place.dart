import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';

class InfoPlace extends StatelessWidget {
  const InfoPlace({
    Key? key,
    required this.text,
    required this.onClosePlace,
    this.margin,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;
  final String text;
  final void Function() onClosePlace;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: AppColors.circleBgFirst,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            text,
            style: Theme.of(context).textTheme.labelSmall,
          )),
          IconButton(
              onPressed: onClosePlace,
              icon: SvgPicture.asset(
                  'assets/icons/subscribe/ic_close_tips_filled.svg'),
            padding: const EdgeInsets.only(top: 0, right: 0),
            alignment: Alignment.topRight,
          )
        ],
      ),
    );
  }
}
