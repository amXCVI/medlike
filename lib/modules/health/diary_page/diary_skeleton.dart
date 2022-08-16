import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class DiarySkeleton extends StatelessWidget {
  const DiarySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonParagraph(
      style: SkeletonParagraphStyle(
        lines: 1,
        lineStyle: SkeletonLineStyle(
          height: 170,
          borderRadius: BorderRadius.circular(12),
        )
      ),
    );
  }
}
