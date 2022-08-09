import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class DefaultAuthSkeleton extends StatelessWidget {
  const DefaultAuthSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SkeletonLine(
          style: SkeletonLineStyle(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width - 32,
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width / 2))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SkeletonLine(
              style: SkeletonLineStyle(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 75),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
          ],
        ),
        const SkeletonLine(
          style: SkeletonLineStyle(
              alignment: AlignmentDirectional.center,
              height: 40,
              width: 130,
              borderRadius: BorderRadius.all(Radius.circular(24))),
        ),
        // const SkeletonLine(
        //   style: SkeletonLineStyle(
        //     alignment: AlignmentDirectional.center,
        //     width: 270,
        //     borderRadius: BorderRadius.all(Radius.circular(16)),
        //   ),
        // ),
      ],
    ));
  }
}
