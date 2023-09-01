import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/widgets/refund_card/payed_card_item.dart';

class RefundSlidable extends StatelessWidget {
  const RefundSlidable(
      {super.key, required this.appointment, required this.onDissmis});

  final AppointmentModelWithTimeZoneOffset appointment;
  final Function onDissmis;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
            color: Theme.of(context).colorScheme.background,
          ),
          child: AppointmentStatuses.cancellableStatusIds
                      .contains(appointment.status) &&
                  appointment.status != 4
              ? Slidable(
                  key: UniqueKey(),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        onDissmis();
                      },
                    ),
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Theme.of(context).colorScheme.error,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 20.0),
                                SvgPicture.asset(
                                    'assets/icons/appointments/ic_delete_appointment.svg'),
                                const SizedBox(width: 20.0),
                                Expanded(
                                  //flex: 1,
                                  child: Text(
                                    "Отменить приём \nи вернуть денежные средства.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Colors.white, fontSize: 12),
                                    //overflow: TextOverflow.fade,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: const PayedCardItem(
                    // TODO: Link payment amount here
                    amount: 1000,
                  ),
                )
              : const PayedCardItem(amount: 1000),
        ),
      );
}
