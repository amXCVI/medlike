import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CalendarSkeletonItem extends StatelessWidget {
  const CalendarSkeletonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(3.0),
      child: SkeletonAvatar(
        style:
            SkeletonAvatarStyle(shape: BoxShape.circle, width: 40, height: 40),
      ),
    );
  }
}

class WeekCalendarSkeleton extends StatelessWidget {
  const WeekCalendarSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...[0, 1, 2, 3, 4, 5, 6].map((e) => const SkeletonItem(
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.circle, width: 40, height: 40),
                ),
              ))
        ],
      ),
    );
  }
}

class MonthCalendarSkeleton extends StatelessWidget {
  const MonthCalendarSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ...[0, 1, 2, 3, 4].map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...[0, 1, 2, 3, 4, 5, 6].map((e) => const SkeletonItem(
                        child: SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.circle, width: 40, height: 40),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
