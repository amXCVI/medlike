import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ClinicsListSkeleton extends StatelessWidget {
  const ClinicsListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border(
            bottom: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: SkeletonItem(
            child: Row(
              children: [
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.circle, width: 50, height: 50),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 2,
                        spacing: 14,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 10,
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
