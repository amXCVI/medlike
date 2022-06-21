import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/calendar/calendar_header.dart';
import 'package:medlike/widgets/calendar/days_of_week.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as DateHelpers;

import 'calendar_builders.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.selectedDate,
    required this.calendarList,
    required this.onChangeSelectedDate,
    required this.onChangeStartDate,
    required this.onChangeEndDate,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDate;
  final List<CalendarModel> calendarList;
  final void Function(DateTime date) onChangeSelectedDate;
  final void Function(DateTime date) onChangeStartDate;
  final void Function(DateTime date) onChangeEndDate;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  late PageController _pageController;
  late ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  List<int> _getEventsForDay(DateTime day) {
    if (widget.calendarList
            .indexWhere((e) => e.hasLogs && isSameDay(e.date, day)) >=
        0) {
      return [1];
    } else {
      return [];
    }
  }

  void _hideOrShowFullCalendar() {
    if (_calendarFormat == CalendarFormat.month) {
      setState(() {
        _calendarFormat = CalendarFormat.week;
      });
    } else {
      setState(() {
        _calendarFormat = CalendarFormat.month;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ValueListenableBuilder<DateTime>(
            valueListenable: _focusedDay,
            builder: (context, value, _) {
              return CalendarHeader(
                focusedDay: value,
                onLeftArrowTap: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              );
            },
          ),
          const DaysOfWeek(),
          TableCalendar(
                  locale: 'ru_RU',
                  firstDay: widget.selectedDate.add(const Duration(days: -365)),
                  lastDay: widget.selectedDate.add(const Duration(days: 365)),
                  focusedDay: _focusedDay.value,
                  onCalendarCreated: (controller) =>
                      _pageController = controller,
                  onPageChanged: (focusedDay) {
                    widget.onChangeStartDate(
                        DateHelpers.DateUtils.firstDayOfMonth(focusedDay));
                    widget.onChangeEndDate(
                        DateHelpers.DateUtils.lastDayOfMonth(focusedDay));
                    _focusedDay.value = focusedDay;
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _focusedDay = ValueNotifier(selectedDay);
                    });
                    widget.onChangeSelectedDate(selectedDay);
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  selectedDayPredicate: (day) {
                    return widget.calendarList.indexWhere((e) =>
                                e.hasAvailableCells &&
                                isSameDay(e.date, day)) >=
                            0
                        ? true
                        : false;
                  },
                  rangeStartDay: widget.selectedDate,
                  rangeEndDay: widget.selectedDate,
                  eventLoader: _getEventsForDay,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                    CalendarFormat.week: 'Week',
                  },
                  calendarFormat: _calendarFormat,
                  headerVisible: false,
                  daysOfWeekVisible: false,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarBuilders: calendarBuilder(
                    isLoading: widget.isLoading,
                    selectedDay: widget.selectedDate,
                  ),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: true,
                    cellMargin: const EdgeInsets.all(4.0),
                    cellPadding: const EdgeInsets.all(7.0),
                    markersAlignment: Alignment.topRight,
                    markersMaxCount: 1,
                    markerSize: 6.0,
                    markersAnchor: -2,
                    weekendDecoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColors.lightText) as TextStyle,
                    markerDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(child: Divider(indent: 8.0, endIndent: 16.0)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: Theme.of(context).backgroundColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: IconButton(
                    onPressed: _hideOrShowFullCalendar,
                    icon: SvgPicture.asset(
                        _calendarFormat == CalendarFormat.week
                            ? 'assets/icons/calendar_show_button.svg'
                            : 'assets/icons/calendar_hidden_button.svg',
                        width: 15)),
              ),
              const Flexible(child: Divider(indent: 16.0, endIndent: 8.0)),
            ],
          )
        ],
      ),
    );
  }
}
