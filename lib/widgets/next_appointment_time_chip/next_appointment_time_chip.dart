import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';

class NextAppointmentTimeChip extends StatefulWidget {
  const NextAppointmentTimeChip({
    Key? key,
    required this.appointmentDateTime,
    required this.timeZoneOffset,
  }) : super(key: key);

  final DateTime appointmentDateTime;
  final int timeZoneOffset;

  @override
  State<NextAppointmentTimeChip> createState() =>
      _NextAppointmentTimeChipState();
}

class _NextAppointmentTimeChipState extends State<NextAppointmentTimeChip> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: WidgetSpan(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.circleBgFirst,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/appointments/clock.svg'),
              const SizedBox(width: 8.0),
              Text(getAppointmentTime(
                widget.appointmentDateTime,
                widget.timeZoneOffset, // Стандарт МСК
              )),
            ],
          ),
        ),
      ),
    );
  }
}
