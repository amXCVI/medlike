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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 238, 248, 1),
            borderRadius: BorderRadius.circular(12)
          ),
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        shape: BoxShape.circle, width: 16, height: 16
                      ),
                    ),
                    const SizedBox(width: 6),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                        padding: EdgeInsets.zero,
                        lines: 1,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 16,
                          borderRadius: BorderRadius.circular(16),
                          minLength: 87,
                          maxLength: 107,
                        )
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 16,
                            width: 110,
                            borderRadius: BorderRadius.circular(16)),
                        ),
                        const SizedBox(height: 4,),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 16,
                            width: 78,
                            borderRadius: BorderRadius.circular(16)),
                        ),  
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        SkeletonRow(height: 44),
                        SkeletonRow(height: 69),
                        SkeletonRow(height: 50),
                        SkeletonRow(height: 24),
                        SkeletonRow(height: 44),
                        SkeletonRow(height: 31),
                        SkeletonRow(height: 59),
                      ],
                    )
                  ],
                )
              ],
            )
          ),
        ),
      )
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
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SkeletonLine(
        style: SkeletonLineStyle(
          height: height,
          width: 16,
          borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
