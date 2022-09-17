import 'package:flutter/material.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/modules/appointments/appointments_paragraph.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

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
    return Column(children: [
      ...AppointmentStatuses.statusesList
          .map((paragraph) => AppointmentsParagraph(
                statusItem: paragraph,
                appointmentsList: appointmentsList
                    .where((element) => element.status == paragraph.statusId)
                    .toList(),
                onRefreshData: onRefreshData,
              ))
          .toList(),
      appointmentsList.isEmpty
          ? const NotFoundData(
              text: 'Здесь будет список ваших приемов')
          : const SizedBox(height: 20)
    ]);
  }
}
