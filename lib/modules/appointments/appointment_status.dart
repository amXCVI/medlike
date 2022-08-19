import 'package:flutter/material.dart';
import 'package:medlike/constants/appointment_statuses.dart';

class Status extends StatelessWidget {
  const Status({Key? key, required this.status}) : super(key: key);

  final int status;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppointmentStatuses().getStatus(status).statusName.toLowerCase(),
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: AppointmentStatuses().getStatus(status).color),
    );
  }
}
