import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class TimeCellsListSkeleton extends StatelessWidget {
  const TimeCellsListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
        child: SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 1,
              spacing: 14,
              lineStyle: SkeletonLineStyle(
                randomLength: false,
                height: 24,
                width: 50,
                borderRadius: BorderRadius.circular(25),
              )),
        ));
  }
}
