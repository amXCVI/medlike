import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as DateHelper;
import 'package:intl/intl.dart';

enum PickerType { date, time }

enum ColumnType { minute, hour, day, month, year }

String getTime(int time, ColumnType type) {
  switch (type) {
    case ColumnType.minute:
    case ColumnType.hour:
      return time <= 9 ? "0$time" : "$time";
    case ColumnType.day:
      return time < 9 ? "0${time + 1}" : "${time + 1}";
    case ColumnType.month:
      final format = DateFormat('d MMM y', 'ru_RU');

      final str = format.format(DateTime(DateTime.now().year, time + 1));

      return str.split(" ")[1];
    case ColumnType.year:
      return getYear(time).toString();
  }
}

int getInitialValue(ColumnType type, DateTime? initialDate) {
  final date = initialDate ?? DateTime.now();

  switch (type) {
    case ColumnType.minute:
      return date.minute;
    case ColumnType.hour:
      return date.hour;
    case ColumnType.day:
      return date.day - 1;
    case ColumnType.month:
      return date.month - 1;
    case ColumnType.year:
      return 0;
  }
}

DateTime getDateTime(List<int> values, PickerType type) {
  switch (type) {
    case PickerType.date:
      return DateTime(getYear(values[2]), values[1] + 1, values[0] + 1);
    case PickerType.time:
      return DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, values[0], values[1]);
  }
}

int getYear(int index) {
  return DateTime.now().year - index;
}

int getMonthDays(int month, year) {
  return DateUtils.getDaysInMonth(getYear(year), month + 1);
}

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({
    Key? key,
    required this.type,
    required this.onPressed,
    required this.onCancel,
    this.initialDate
  }) : super(key: key);

  final PickerType type;
  final void Function(DateTime) onPressed;
  final VoidCallback onCancel;
  final DateTime? initialDate;

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late DateTime dateTime;
  late List<int> values;
  late List<CarouselController> controllers;

  @override
  void initState() {
    dateTime = widget.initialDate ?? DateTime.now();

    values = widget.type == PickerType.date ? [
      getInitialValue(ColumnType.day, widget.initialDate), 
      getInitialValue(ColumnType.month, widget.initialDate), 
      getInitialValue(ColumnType.year, widget.initialDate)
    ] : [
      getInitialValue(ColumnType.hour, widget.initialDate), 
      getInitialValue(ColumnType.minute, widget.initialDate),
    ];

    controllers = [
      CarouselController(),
      CarouselController(),
      CarouselController(),
    ];
    super.initState();
  }

  void setValue(int index, int value, ColumnType type) {
    setState(() {
      /// TODO: убрать "магические" константы
      if(type == ColumnType.month) { 
        final prev = DateUtils.getDaysInMonth(getYear(values[2]), values[1] + 1);
        final cur = DateUtils.getDaysInMonth(getYear(values[2]), value + 1);
        values[0] += prev - cur;
        //_scrollToDate
        controllers[0].animateToPage(values[0]);
      } else if(type == ColumnType.year) {
        final prev = DateHelper.DateUtils.isLeapYear(getYear(values[2]));
        final cur = DateHelper.DateUtils.isLeapYear(getYear(value));
        if(values[1] == 1 && prev != cur) {
          values[0] -= 1;
          //_scrollToDate
          controllers[0].animateToPage(values[0]);
        }
      }
      values[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          widget.type == PickerType.date ? "Дата" : "Время",
          textAlign: TextAlign.center
        ),
      ),
      content: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          height: 250,
          child: DateTimeCarousel(
            type: widget.type,
            values: values,
            controllers: controllers,
            setValue: setValue,
            initialDate: widget.initialDate,
          )),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
                widget.onCancel();
              },
              child: const Text(
                'ОТМЕНА',
                style: TextStyle(
                  color: AppColors.mainText
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
                widget.onPressed(getDateTime(values, widget.type));
              },
              child: const Text(
                'ОК',
                style: TextStyle(
                  color: AppColors.mainBrandColor
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DateTimeCarousel extends StatelessWidget {
  const DateTimeCarousel({
    Key? key,
    required this.type,
    required this.values,
    required this.controllers,
    required this.setValue,
    this.initialDate
  }) : super(key: key);

  final PickerType type;
  final List<int> values;
  final List<CarouselController> controllers;
  final void Function(int, int, ColumnType) setValue;
  final DateTime? initialDate;

  @override
  Widget build(BuildContext context) {
    List<Widget> cols;

    if (type == PickerType.date) {
      cols = [
        CarouselColumn(
          type: ColumnType.day,
          col: 0,
          index: values[0],
          controller: controllers[0],

          /// Для подсчёта количества дней обязательно передавать
          /// все индексы
          values: values,
          setValue: setValue,
          initialDate: initialDate,
        ),
        CarouselColumn(
          type: ColumnType.month,
          col: 1,
          index: values[1],
          values: values,
          controller: controllers[1],
          setValue: setValue,
          initialDate: initialDate,
        ),
        CarouselColumn(
          type: ColumnType.year,
          col: 2,
          index: values[2],
          values: values,
          controller: controllers[2],
          setValue: setValue,
          initialDate: initialDate,
        ),
      ];
    } else {
      cols = [
        CarouselColumn(
          type: ColumnType.hour,
          col: 0,
          index: values[0],
          values: values,
          controller: controllers[0],
          setValue: setValue,
          initialDate: initialDate,
        ),
        Container(
          height: 60 * 3,
          padding: const EdgeInsets.all(5),
          child: const Center(
            child: Text(
              ':',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: AppColors.mainText
              ),
            ),
          ),
        ),
        CarouselColumn(
          type: ColumnType.minute,
          col: 1,
          controller: controllers[1],
          index: values[1],
          values: values,
          setValue: setValue,
          initialDate: initialDate,
        ),
      ];
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: type == PickerType.date ? 50 : 70
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.lightText, width: 1),
          bottom: BorderSide(color: AppColors.lightText, width: 1),
        ),
      ),
      child: Row(
        children: cols,
      ),
    );
  }
}

class CarouselColumn extends StatelessWidget {
  const CarouselColumn({
    Key? key,
    required this.type,
    required this.index,
    required this.col,
    required this.controller,
    required this.setValue,
    this.initialDate,
    required this.values
  }) : super(key: key);

  final ColumnType type;
  final int index;
  final int col;
  final CarouselController controller;
  final List<int> values;
  final void Function(int, int, ColumnType) setValue;
  final DateTime? initialDate;

  @override
  Widget build(BuildContext context) {
    int count;

    switch (type) {
      case ColumnType.minute:
        count = 60;
        break;
      case ColumnType.hour:
        count = 24;
        break;
      case ColumnType.day:
        /// Если месяц текущий и год текущий
        /// то количество дней в месяце = текущий день
        if (values[1] == DateTime.now().month &&
            values[2] == DateTime.now().year) {
          count = DateTime.now().day;
        } else {
          count = getMonthDays(values[1], values[2]);
        }

        break;
      case ColumnType.month:
        /// Если год текущий, то количество месяцев = текущий месяц
        if (values[2] == DateTime.now().year) {
          count = DateTime.now().month;
        } else {
          count = 12;
        }
        break;
      case ColumnType.year:
        /// Равен количеству лет с 2000 до текущего года
        count = DateTime.now().year - 2000;
        break;
    }

    const height = 60.0;

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: count,
              carouselController: controller,
              options: CarouselOptions(
                  height: height * 3,
                  viewportFraction: 0.35,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                  initialPage: getInitialValue(type, initialDate),
                  onPageChanged: ((index, reason) {
                    setValue(col, index, type); 
                  })),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      SizedBox(
                          height: height,
                          child: Center(
                            child: Text(
                              getTime(itemIndex, type),
                              style: TextStyle(
                                  color: index == itemIndex
                                      ? AppColors.mainText
                                      : AppColors.lightText,
                                  fontSize: type == ColumnType.hour || type == ColumnType.minute
                                    ? 20 : 16
                                ),
                            ),
                          ))),
          Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 2,
                        margin: const EdgeInsets.only(bottom: height - 4),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                color: AppColors.mainBrandColor, width: 2),
                            bottom: BorderSide(
                                color: AppColors.mainBrandColor, width: 2),
                          ),
                        )),
                    Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                color: AppColors.mainBrandColor, width: 2),
                            bottom: BorderSide(
                                color: AppColors.mainBrandColor, width: 2),
                          ),
                        ))
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
