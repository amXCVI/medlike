import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/constants/appointment_time_color.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';

class NextAppointmentTimeChip extends StatefulWidget {
  const NextAppointmentTimeChip({
    Key? key,
    required this.appointmentDateTime,
    required this.timeZoneOffset,
    this.isFullDateTime = false,
    this.isBottomLabel = false,
  }) : super(key: key);

  final DateTime appointmentDateTime;
  final int timeZoneOffset;
  final bool isFullDateTime;
  final bool isBottomLabel;

  @override
  State<NextAppointmentTimeChip> createState() =>
      _NextAppointmentTimeChipState();
}

class _NextAppointmentTimeChipState extends State<NextAppointmentTimeChip> {
  late int _differenceInMinutes =
      widget.appointmentDateTime.difference(DateTime.now()).inMinutes;

  late Timer _timer = Timer(
    const Duration(minutes: 1),
    () {},
  );

  void startTimer() {
    const oneSec = Duration(minutes: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_differenceInMinutes == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _differenceInMinutes--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: WidgetSpan(
            child: Container(
              decoration: BoxDecoration(
                color: AppointmentTimeStatusItems.getBackgroundColorByTime(
                    _differenceInMinutes),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/appointments/ic_clock.svg',
                    color: AppointmentTimeStatusItems.getIconColorByTime(
                        _differenceInMinutes),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.isFullDateTime
                        ? getAppointmentTime(
                              widget.appointmentDateTime,
                              widget.timeZoneOffset, // Стандарт МСК
                            ) +
                            ' ' +
                            DateFormat('dd.MM.yy')
                                .format(widget.appointmentDateTime)
                        : getAppointmentTime(
                            widget.appointmentDateTime,
                            widget.timeZoneOffset, // Стандарт МСК
                          ),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppointmentTimeStatusItems.getTextColorByTime(
                              _differenceInMinutes),
                          fontWeight: _differenceInMinutes >= 0 &&
                                  _differenceInMinutes <= 120
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        widget.isBottomLabel &&
                _differenceInMinutes >= 0 &&
                _differenceInMinutes <= 120
            ? const SizedBox(height: 8)
            : const SizedBox(),
        widget.isBottomLabel &&
                _differenceInMinutes >= 0 &&
                _differenceInMinutes <= 120
            ? Text(
                'До приема $_differenceInMinutes мин.',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppointmentTimeStatusItems.getLabelTextColorByTime(
                        _differenceInMinutes)),
              )
            : const SizedBox(),
      ],
    );
  }
}
