import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/modules/appointments/appointment_item.dart';
import 'package:medlike/utils/animation/animate_slidable.dart';
import 'package:medlike/widgets/slidable/slidable_widget.dart';

class AppointmentsParagraph extends StatelessWidget {
  const AppointmentsParagraph({
    Key? key,
    required this.statusItem,
    required this.appointmentsList,
    required this.onRefreshData,
  }) : super(key: key);

  final StatusItem statusItem;
  final List<AppointmentModelWithTimeZoneOffset> appointmentsList;
  final Function onRefreshData;

  @override
  Widget build(BuildContext context) {
    void _deleteAppointment(String appointmentId, String userId) {
      HapticFeedback.lightImpact();
      context
          .read<AppointmentsCubit>()
          .deleteAppointment(appointmentId: appointmentId, userId: userId);
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appointmentsList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                        top: 27.0, bottom: 5.0, left: 6.0, right: 16.0),
                    child: Text(
                      statusItem.paragraphName,
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.left,
                    ),
                  )
                : const SizedBox(),
            ...appointmentsList
                .map((item) => Padding(
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
                                    .contains(item.status) &&
                                item.status != 4
                            ? SlidableWidget(
                                onDissmis: () {
                                  _deleteAppointment(
                                      item.id, item.patientInfo.id as String);
                                },
                                dissmisText:
                                    "Отменить приём ${(item.paymentStatus == 3 || item.paymentStatus == 6) ? "\nи вернуть денежные средства." : ""}",
                                childWidget: SliderChild(
                                    item: item,
                                    index: appointmentsList.indexOf(item)),
                                previewOnSutisfy: () async {
                                  return !(context
                                              .read<TourCubit>()
                                              .state
                                              .tourChecked?[
                                          TourChecked.removeAppointment] ??
                                      false);
                                }(),
                                afterPreviewAction: () => context
                                    .read<TourCubit>()
                                    .checkItem(TourChecked.removeAppointment))
                            : AppointmentItem(appointmentItem: item))))
                .toList()
          ],
        ));
  }
}

class SliderChild extends StatefulWidget {
  const SliderChild({Key? key, required this.item, required this.index})
      : super(key: key);

  final AppointmentModelWithTimeZoneOffset item;
  final int index;

  @override
  State<SliderChild> createState() => _SliderChildState();
}

class _SliderChildState extends State<SliderChild> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourState>(buildWhen: (_, state) {
      return true;
    }, builder: (context, state) {
      return AppointmentItem(appointmentItem: widget.item);
    });
  }
}
