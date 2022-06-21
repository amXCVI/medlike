import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/calendar/calendar_skeletons.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarBuilders calendarBuilder({
  required bool isLoading,
  required DateTime selectedDay,
}) {
  return CalendarBuilders(selectedBuilder: (context, date, _) {
    if (isLoading) {
      return const CalendarSkeletonItem();
    } else {
      return Container(
        decoration: BoxDecoration(
          color: isSameDay(selectedDay, date)
              ? Theme.of(context).primaryColor
              : AppColors.circleBgFirst,
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: Center(
          child: Text(
            date.day.toString(),
            style: TextStyle(
                color: isSameDay(selectedDay, date)
                    ? Colors.white
                    : AppColors.mainText),
          ),
        ),
      );
    }
  }, rangeStartBuilder: (context, date, _) {
    if (isLoading) {
      return const CalendarSkeletonItem();
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: Center(
          child: Text(
            date.day.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }, defaultBuilder: (context, date, _) {
    if (isLoading) {
      return const CalendarSkeletonItem();
    } else {
      return Center(
        child: Text(date.day.toString()),
      );
    }
  }, todayBuilder: (context, date, _) {
    if (isLoading) {
      return const CalendarSkeletonItem();
    } else {
      return Container(
        decoration: BoxDecoration(
          color: isSameDay(selectedDay, date)
              ? Theme.of(context).primaryColor
              : Theme.of(context).backgroundColor,
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: Center(
          child: Text(
            date.day.toString(),
            style: isSameDay(selectedDay, date)
                ? Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white)
                : Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainBrandColor),
          ),
        ),
      );
    }
  }, outsideBuilder: (context, date, _) {
    if (isLoading) {
      return const CalendarSkeletonItem();
    } else {
      return Center(
        child: Text(
          date.day.toString(),
          style: isSameDay(selectedDay, date)
              ? Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white)
              : Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: AppColors.lightText),
        ),
      );
    }
  });
}
