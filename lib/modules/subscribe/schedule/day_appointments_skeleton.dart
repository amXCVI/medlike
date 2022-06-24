import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class DayAppointmentsSkeleton extends StatelessWidget {
  const DayAppointmentsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...[0, 1]
            .map((item) => Center(
          child: SkeletonItem(
              child: Row(
                children: [
                  const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        shape: BoxShape.circle, width: 17, height: 17),
                  ),
                  const SizedBox(width: 15),
                  SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 1,
                        lineStyle: SkeletonLineStyle(
                          height: 10,
                          width: 38,
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 2,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  )
                ],
              )),
        ))
            .toList(),
        const SizedBox(height: 20),
      ],
    );
  }
}
