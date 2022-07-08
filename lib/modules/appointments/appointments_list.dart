import 'package:flutter/material.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/modules/appointments/appointments_paragraph.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({
    Key? key,
    required this.appointmentsList,
    required this.onRefreshData,
  }) : super(key: key);

  final List<AppointmentModel> appointmentsList;
  final dynamic onRefreshData;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: ListView(shrinkWrap: true, children: [
        ...AppointmentStatuses.statusesList
            .map((paragraph) => AppointmentsParagraph(
                  statusItem: paragraph,
                  appointmentsList: appointmentsList
                      .where((element) => element.status == paragraph.statusId)
                      .toList(),
                ))
            .toList(),
      ]),
    );
  }
}
