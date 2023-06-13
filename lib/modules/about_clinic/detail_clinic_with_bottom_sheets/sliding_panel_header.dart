import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class SlidingPanelHeader extends StatelessWidget {
  const SlidingPanelHeader({Key? key, required this.clinicName})
      : super(key: key);

  final String clinicName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

class SlidingPanelHeaderMark extends StatelessWidget {
  const SlidingPanelHeaderMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
