import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class AppointmentTimeStatusItems {
  static List<TimeStatusItem> statusesList = [
    TimeStatusItem(
      id: 1,
      startTimeDuration: 30,
      color: AppColors.mainError,
    ),
    TimeStatusItem(
      id: 2,
      startTimeDuration: 60,
      color: AppColors.mainAlarm,
    ),
    TimeStatusItem(
      id: 3,
      startTimeDuration: 120,
      color: AppColors.mainWaiting,
    ),
    TimeStatusItem(
      id: 4,
      startTimeDuration: 120,
      color: AppColors.circleBgFirst,
    ),
  ];

  static Color getBackgroundColorByTime(int difference) {
    if (difference >= statusesList[3].startTimeDuration || difference < 0) {
      return statusesList[3].color;
    } else if (difference > statusesList[1].startTimeDuration) {
      return statusesList[2].color;
    } else if (difference > statusesList[0].startTimeDuration) {
      return statusesList[1].color;
    } else {
      return statusesList[0].color;
    }
  }

  static Color getTextColorByTime(int difference) {
    if (difference >= statusesList[3].startTimeDuration || difference < 0) {
      return AppColors.mainText;
    } else {
      return Colors.white;
    }
  }

  static Color getIconColorByTime(int difference) {
    if (difference >= statusesList[3].startTimeDuration || difference < 0) {
      return AppColors.lightText;
    } else {
      return Colors.white;
    }
  }

  static Color getLabelTextColorByTime(int difference) {
    if (difference >= statusesList[3].startTimeDuration || difference < 0) {
      return AppColors.mainText;
    } else if (difference > statusesList[1].startTimeDuration) {
      return statusesList[2].color;
    } else if (difference > statusesList[0].startTimeDuration) {
      return statusesList[1].color;
    } else {
      return statusesList[0].color;
    }
  }
}

class TimeStatusItem {
  final int id;
  final int startTimeDuration;
  final Color color;

  TimeStatusItem({
    required this.id,
    required this.startTimeDuration,
    required this.color,
  });
}
