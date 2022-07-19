import 'dart:ui';

import 'package:medlike/themes/colors.dart';

class AppointmentStatuses {
  static List<StatusItem> statusesList = [
    StatusItem(
        statusId: 4,
        id: 0,
        statusName: 'Ожидает',
        color: AppColors.lightText,
        paragraphName: 'Предстоящие'),
    StatusItem(
        statusId: 0,
        id: 1,
        statusName: 'Предстоит',
        color: AppColors.lightText,
        paragraphName: 'Предстоящие'),
    StatusItem(
        statusId: 1,
        id: 2,
        statusName: 'Выполнен',
        color: AppColors.mainDone,
        paragraphName: 'Выполненные'),
    StatusItem(
        statusId: 2,
        id: 3,
        statusName: 'Отменен',
        color: AppColors.mainError,
        paragraphName: 'Отмененные'),
    StatusItem(
        statusId: 3,
        id: 4,
        statusName: 'Не выполнен',
        color: AppColors.notDone,
        paragraphName: 'Не выполненные'),
  ];

  StatusItem getStatus(int statusId) {
    StatusItem findStatus = statusesList
        .firstWhere((categoryType) => categoryType.statusId == statusId);
    return findStatus;
  }

  static List<int> cancellableStatusIds = [0, 4];
}

class StatusItem {
  final int statusId;
  final int id;
  final String statusName;
  final Color color;
  final String paragraphName;

  StatusItem({
    required this.statusId,
    required this.statusName,
    required this.color,
    required this.paragraphName,
    required this.id,
  });
}
