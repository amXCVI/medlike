import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/calendar/calendar_skeletons.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarBuilders calendarBuilder({
  required bool isLoading,
  required DateTime selectedDay,
  required List<String> hasLogsDatesList,
  required List<String> hasAvailableCellsDatesList,
}) {
  return CalendarBuilders(rangeStartBuilder: (context, date, _) {
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
      return hasAvailableCellsDatesList
              .contains(DateFormat("yyyy-MM-dd").format(date))
          ? Container(
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
            )
          : Center(
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
              : hasAvailableCellsDatesList
                      .contains(DateFormat("yyyy-MM-dd").format(date))
                  ? AppColors.circleBgFirst
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
  }, markerBuilder: (context, date, _) {
    if (isLoading) {
      return const CalendarSkeletonItem();
    } else {
      return Center(
        child: Stack(
          children: [
            hasLogsDatesList.contains(DateFormat("yyyy-MM-dd").format(date))
                ? Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    }
  });
}
