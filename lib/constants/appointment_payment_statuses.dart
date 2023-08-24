// <member name="F:MedLike.Domain.Core.Contracts.AppointmentPaymentStatus.Unknown">
// <summary>Неизвестен</summary>
// </member>
// <member name="F:MedLike.Domain.Core.Contracts.AppointmentPaymentStatus.NotPaid">
// <summary>Не оплачено (cash)</summary>
// </member>
// <member name="F:MedLike.Domain.Core.Contracts.AppointmentPaymentStatus.SuccessfullyPaid">
// <summary>Оплачено</summary>
// </member>
// <member name="F:MedLike.Domain.Core.Contracts.AppointmentPaymentStatus.Refunded">
// <summary>Был возврат</summary>
// </member>
// <member name="F:MedLike.Domain.Core.Contracts.AppointmentPaymentStatus.InProcess">
// <summary>В процессе оплаты</summary>
// </member>
// <member name="F:MedLike.Domain.Core.Contracts.AppointmentPaymentStatus.PartialPaid">
// <summary>Частичная оплата</summary>
// </member>

class AppointmentPaymentStatuses {
  static List<PaymentStatusItem> paymentStatusesList = [
    PaymentStatusItem(
      statusId: 0,
      statusName: 'unknown',
      description: 'Статус оплаты неизвестен',
      id: 0,
    ),
    PaymentStatusItem(
      statusId: 1,
      statusName: 'notPaid',
      description: 'Не оплачено',
      id: 1,
    ),
    PaymentStatusItem(
      statusId: 2,
      statusName: 'successfullyPaid',
      description: 'Оплачено',
      id: 2,
    ),
    PaymentStatusItem(
      statusId: 3,
      statusName: 'refunded',
      description: 'Был возврат',
      id: 3,
    ),
    PaymentStatusItem(
      statusId: 4,
      statusName: 'inProcess',
      description: 'В процессе оплаты',
      id: 4,
    ),
    PaymentStatusItem(
      statusId: 5,
      statusName: 'partialPaid',
      description: 'Частичная оплата',
      id: 5,
    ),
  ];

  static PaymentStatusItem getPaymentStatus(int statusId) {
    try {
      PaymentStatusItem findStatus = paymentStatusesList
          .firstWhere((statusItem) => statusItem.statusId == statusId);
      return findStatus;
    } catch (err) {
      return paymentStatusesList[0];
    }
  }
}

class PaymentStatusItem {
  final int statusId;
  final int id;
  final String statusName;
  final String description;

  PaymentStatusItem({
    required this.statusId,
    required this.statusName,
    required this.description,
    required this.id,
  });
}
