import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class AppointmentsWidgetSkeleton extends StatelessWidget {
  const AppointmentsWidgetSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16.0, right: 16.0, bottom: 32.0, left: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 238, 248, 1),
            borderRadius: BorderRadius.circular(12)),
        height: 132,
        child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          padding: EdgeInsets.zero,
                          lines: 1,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 16,
                            borderRadius: BorderRadius.circular(16),
                            minLength: 150,
                            maxLength: 250,
                          )),
                    ),
                    const SizedBox(height: 8),
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          padding: EdgeInsets.zero,
                          lines: 1,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 16,
                            borderRadius: BorderRadius.circular(16),
                            minLength: 150,
                            maxLength: 250,
                          )),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          minLength: 80,
                          maxLength: 130,
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 16,
                              minLength: 80,
                              maxLength: 130,
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 16,
                              minLength: 80,
                              maxLength: 130,
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
