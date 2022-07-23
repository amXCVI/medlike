import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class SliderPageIndicators extends StatelessWidget {
  const SliderPageIndicators(
      {Key? key, required this.indicators, required this.activeIndicator})
      : super(key: key);

  final List<int> indicators;
  final int activeIndicator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...indicators
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Container(
                    width: 6.0,
                    height: 6.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: e == activeIndicator
                          ? Colors.white
                          : AppColors.lightBgAlpha,
                    ),
                  ),
                ))
            .toList()
      ],
    );
  }
}
