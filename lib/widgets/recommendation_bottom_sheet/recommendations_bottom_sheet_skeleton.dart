import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class RecommendationsBottomSheetSkeleton extends StatelessWidget {
  const RecommendationsBottomSheetSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: SkeletonItem(
          child: SkeletonParagraph(
        style: SkeletonParagraphStyle(
            padding: const EdgeInsets.all(0),
            lines: 5,
            spacing: 7,
            lineStyle: SkeletonLineStyle(
              randomLength: true,
              height: 14,
              borderRadius: BorderRadius.circular(8),
              minLength: MediaQuery.of(context).size.width * 0.6,
              maxLength: MediaQuery.of(context).size.width,
            )),
      )),
    );
  }
}
