import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMMM('ru_RU').format(focusedDay);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/ic_arrow_left_calendar.svg'),
            onPressed: onLeftArrowTap,
          ),
          Text(
            '${toBeginningOfSentenceCase(headerText)}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/ic_arrow_right_calendar.svg'),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}
