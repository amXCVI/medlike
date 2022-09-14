import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SliderSkeleton extends StatelessWidget {
  const SliderSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SkeletonItem(
          child: SkeletonLine(
        style: SkeletonLineStyle(
            height: MediaQuery.of(context).size.width / 16 * 9,
            width: MediaQuery.of(context).size.width,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
      )),
    );
  }
}
