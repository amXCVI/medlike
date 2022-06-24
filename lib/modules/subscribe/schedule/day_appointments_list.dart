import 'package:flutter/material.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/modules/subscribe/schedule/day_appointment_item.dart';

class DayAppointmentsList extends StatelessWidget {
  const DayAppointmentsList({Key? key, required this.timetableLogsList})
      : super(key: key);

  final List<TimetableLogModel> timetableLogsList;

  @override
  Widget build(BuildContext context) {
    return timetableLogsList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Приемы на день:',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: timetableLogsList
                        .map((item) => DayAppointmentItem(
                              item: item,
                            ))
                        .toList()),
              ],
            ),
          )
        : const SizedBox();
  }
}
