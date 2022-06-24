import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class TimeCellsListSkeleton extends StatelessWidget {
  const TimeCellsListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...[0, 1, 2, 3, 4, 5, 6, 7]
            .map((item) => Center(
              child: SkeletonItem(
                      child: SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 1,
                        spacing: 0,
                        lineStyle: SkeletonLineStyle(
                          randomLength: false,
                          height: 24,
                          borderRadius: BorderRadius.circular(25),
                        )),
                  )),
            ))
            .toList(),
        const SizedBox(height: 20),
      ],
    );
  }
}
