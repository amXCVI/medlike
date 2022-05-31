import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class UserProfileSkeleton extends StatelessWidget {
  const UserProfileSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(16.0),
        child: SkeletonItem(
            child: Row(
          children: [
            const SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.circle, width: 40, height: 40),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 2,
                    spacing: 7,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 14,
                      borderRadius: BorderRadius.circular(8),
                      minLength: MediaQuery.of(context).size.width / 6,
                      maxLength: MediaQuery.of(context).size.width / 3,
                    )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
