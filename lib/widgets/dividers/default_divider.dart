import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider(
      {Key? key, this.height = 1, this.color = AppColors.mainSeparatorAlpha})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
