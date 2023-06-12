class DocumentStatuses {
  static List<StatusItem> statusesList = [
    StatusItem(
      statusId: 1,
      id: 1,
      statusName: 'Не подписан',
      filterValue: 'Не подписан',
      isSubscribed: false,
    ),
    StatusItem(
      statusId: 2,
      id: 2,
      statusName: 'Подписан клиникой',
      filterValue: 'Подписан',
      isSubscribed: false,
    ),
    StatusItem(
      statusId: 3,
      id: 3,
      statusName: 'Подписан пациентом',
      filterValue: 'Подписан',
      isSubscribed: true,
    ),
    StatusItem(
      statusId: 4,
      id: 4,
      statusName: 'Подписан пациентом и клиникой',
      filterValue: 'Подписан',
      isSubscribed: true,
    ),
  ];

  static StatusItem getStatus(int statusId) {
    try {
      StatusItem findStatus = statusesList
          .firstWhere((categoryType) => categoryType.statusId == statusId);
      return findStatus;
    } catch (err) {
      return StatusItem(
        statusId: 0,
        id: 0,
        statusName: 'Статус неизвестен',
        filterValue: 'Не подписан',
        isSubscribed: false,
      );
    }
  }

  static List<int> cancellableStatusIds = [0, 4];
}

class StatusItem {
  final int statusId;
  final int id;
  final String statusName;
  final String filterValue;
  final bool isSubscribed;

  StatusItem({
    required this.statusId,
    required this.statusName,
    required this.id,
    required this.filterValue,
    required this.isSubscribed,
  });
}
