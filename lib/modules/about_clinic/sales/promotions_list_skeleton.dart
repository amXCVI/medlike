import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class PromotionsListSkeleton extends StatelessWidget {
  const PromotionsListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border:
                Border.all(color: Theme.of(context).dividerColor, width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: SkeletonItem(
              child: Column(
            children: [
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 1,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 14,
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              Row(
                children: [
                  const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        shape: BoxShape.circle, width: 30, height: 30),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 1,
                          spacing: 14,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                ],
              ),
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 3,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
