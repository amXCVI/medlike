class DocumentStatuses {
  static List<StatusItem> statusesList = [
    StatusItem(
      statusId: 1,
      id: 1,
      statusName: 'Не подписан',
      filterValue: 'Не подписан',
      isSubscribed: false,
      isSignByPatient: false,
      isSignByEmployee: false,
    ),
    StatusItem(
      statusId: 2,
      id: 2,
      statusName: 'Подписан клиникой',
      filterValue: 'Подписан',
      isSubscribed: false,
      isSignByPatient: false,
      isSignByEmployee: true,
    ),
    StatusItem(
      statusId: 3,
      id: 3,
      statusName: 'Подписан пациентом',
      filterValue: 'Подписан',
      isSubscribed: true,
      isSignByPatient: true,
      isSignByEmployee: false,
    ),
    StatusItem(
      statusId: 4,
      id: 4,
      statusName: 'Подписан пациентом и клиникой',
      filterValue: 'Подписан',
      isSubscribed: true,
      isSignByPatient: true,
      isSignByEmployee: true,
    ),
  ];

  static StatusItem getStatus({
    required bool isSignByPatient,
    required bool isSignByEmployee,
  }) {
    try {
      StatusItem findStatus = statusesList.firstWhere((e) =>
          e.isSignByPatient == isSignByPatient &&
          e.isSignByEmployee == isSignByEmployee);
      return findStatus;
    } catch (err) {
      return StatusItem(
        statusId: 0,
        id: 0,
        statusName: 'Статус неизвестен',
        filterValue: 'Не подписан',
        isSubscribed: false,
        isSignByPatient: false,
        isSignByEmployee: false,
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
  final bool isSignByPatient;
  final bool isSignByEmployee;

  StatusItem({
    required this.statusId,
    required this.statusName,
    required this.id,
    required this.filterValue,
    required this.isSubscribed,
    required this.isSignByPatient,
    required this.isSignByEmployee,
  });
}
