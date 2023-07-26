import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/navigation/router.dart';

class AppointmentDetailActionButton extends StatelessWidget {
  const AppointmentDetailActionButton(
      {Key? key, required this.appointmentId, required this.appointmentStatus})
      : super(key: key);

  final String appointmentId;
  final int appointmentStatus;

  void handleChangeRatig(BuildContext context) {
    context.router.push(FeedbackRoute(appointmentId: appointmentId));
  }

  @override
  Widget build(BuildContext context) {
    if (AppointmentStatuses.checkIsPastAppointment(appointmentStatus)) {
      return FloatingActionButton.extended(
        onPressed: () => handleChangeRatig(context),
        label: Text(
          'Оставить отзыв'.toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
