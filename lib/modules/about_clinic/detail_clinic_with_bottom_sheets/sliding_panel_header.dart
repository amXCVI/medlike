import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class SlidingPanelHeader extends StatelessWidget {
  const SlidingPanelHeader({Key? key, required this.clinicName})
      : super(key: key);

  final String clinicName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        color: Theme.of(context).backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12.0),
              height: 5,
              width: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(3.0),
                ),
                color: AppColors.mainSeparatorAlpha,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              clinicName,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
