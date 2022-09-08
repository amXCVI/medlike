import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class DiarySkeleton extends StatelessWidget {
  const DiarySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chips = [1, 2, 3, 4].map((e) =>
      SkeletonLine(
        style: SkeletonLineStyle(
          height: 32,
          width: 78,
          borderRadius: BorderRadius.circular(32)
        ),
      ), 
    ).toList();

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: chips
        ),
        const SizedBox(height: 18),
        SkeletonParagraph(
          style: SkeletonParagraphStyle(
            padding: EdgeInsets.zero,
            lines: 3,
            spacing: 6,
            lineStyle: SkeletonLineStyle(
              randomLength: true,
              height: 16,
              borderRadius: BorderRadius.circular(16),
              minLength: 91,
              maxLength: 136,
            )
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 238, 248, 1),
            borderRadius: BorderRadius.circular(12)
          ),
          height: 165,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    SkeletonRow(height: 44),
                    SkeletonRow(height: 69),
                    SkeletonRow(height: 50),
                    SkeletonRow(height: 24),
                    SkeletonRow(height: 44),
                    SkeletonRow(height: 31),
                    SkeletonRow(height: 59),
                    SkeletonRow(height: 50),
                    SkeletonRow(height: 24),
                    SkeletonRow(height: 44),
                    SkeletonRow(height: 31),
                    SkeletonRow(height: 59),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 55),
        SkeletonParagraph(
          style: SkeletonParagraphStyle(
            padding: EdgeInsets.zero,
            lines: 2,
            spacing: 6,
            lineStyle: SkeletonLineStyle(
              randomLength: true,
              height: 16,
              borderRadius: BorderRadius.circular(16),
              minLength: 106,
              maxLength: 166,
            )
          ),
        )
      ],
    );
  }
}

class SkeletonRow extends StatelessWidget {
  const SkeletonRow({
    Key? key,
    required this.height
  }) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style: SkeletonLineStyle(
        height: height,
        width: 16,
        borderRadius: BorderRadius.circular(16)),
    );
  }
}
