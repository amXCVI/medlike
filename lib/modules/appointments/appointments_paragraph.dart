import 'package:flutter/material.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/modules/appointments/appointment_item.dart';

class AppointmentsParagraph extends StatelessWidget {
  const AppointmentsParagraph(
      {Key? key, required this.statusItem, required this.appointmentsList})
      : super(key: key);

  final StatusItem statusItem;
  final List<AppointmentModel> appointmentsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        appointmentsList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 27.0, bottom: 5.0, left: 16.0, right: 16.0),
                child: Text(
                  statusItem.paragraphName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              )
            : const SizedBox(),
        ...appointmentsList
            .map((item) => AppointmentItem(
                  appointmentItem: item,
                ))
            .toList(),
      ],
    );
  }
}
