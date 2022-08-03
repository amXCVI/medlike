import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class HealthListSkeleton extends StatelessWidget {
  const HealthListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: SkeletonParagraph(
          style: SkeletonParagraphStyle(
            lines: 1,
            lineStyle: SkeletonLineStyle(
              randomLength: true,
              height: 14,
              borderRadius: BorderRadius.circular(8),
            )
          ),
        ),
      )
    );
  }
}
