import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/utils/animation/animate_slidable.dart';
import 'package:medlike/widgets/refund_card/payed_card_item.dart';
import 'package:medlike/widgets/slidable/slidable_widget.dart';

class RefundSlidable extends StatelessWidget {
  const RefundSlidable(
      {super.key, required this.appointment, required this.onDissmis});

  final AppointmentModelWithTimeZoneOffset appointment;
  final void Function() onDissmis;
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
              ? SlidableWidget(
                  onDissmis: onDissmis,
                  dissmisText: "Отменить приём \nи вернуть денежные средства.",
                  childWidget: const PayedCardItem(amount: 1000),
                  previewOnSutisfy: () async {
                    return !(context
                            .read<TourCubit>()
                            .state
                            .tourChecked?[TourChecked.refundCard] ??
                        false);
                  }(),
                  afterPreviewAction: () => context
                      .read<TourCubit>()
                      .checkItem(TourChecked.refundCard))
              : const PayedCardItem(amount: 1000),
        ),
      );
}
