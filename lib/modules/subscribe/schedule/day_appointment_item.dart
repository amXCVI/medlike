import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';

class DayAppointmentItem extends StatelessWidget {
  const DayAppointmentItem({Key? key, required this.item}) : super(key: key);

  final TimetableLogModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/icons/subscribe/time_clock.svg'),
          const SizedBox(width: 15),
          SizedBox(
            width: 50,
            child: Text(
              DateFormat("HH:mm").format(item.date),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Text(
              item.description,
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
