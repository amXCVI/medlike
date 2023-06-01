import 'dart:ui';

import 'package:medlike/themes/colors.dart';

class AppointmentTimeStatusItems {
  static List<TimeStatusItem> statusesList = [
    TimeStatusItem(id: 1, startTimeDuration: 30, color: AppColors.mainError),
    TimeStatusItem(id: 1, startTimeDuration: 60, color: AppColors.mainAlarm),
    TimeStatusItem(id: 1, startTimeDuration: 120, color: AppColors.mainWaiting),
  ];
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
