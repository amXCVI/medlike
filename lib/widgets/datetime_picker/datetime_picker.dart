import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medlike/themes/colors.dart';

enum PickerType {
  date,
  time
}

enum ColumnType {
  minute,
  hour,
  day,
  month,
  year
}

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({
    Key? key,
    required this.type,
    required this.onPressed,
    required this.onCancel
  }) : super(key: key);

  final PickerType type;
  final void Function(DateTime) onPressed;
  final VoidCallback onCancel;

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime dateTime = DateTime.now();
  late List<int> values; 

  @override
  void initState() {
    values = widget.type == PickerType.date 
      ? [0, 0, 0] : [0, 0];
    super.initState();
  }

  void setValue(int index, int value) {
    setState(() {
      values[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        height: MediaQuery.of(context).size.height - 400,
        child: DateTimeCarousel(
          type: widget.type,
          values: values,
          setValue: setValue,
        )
      ),
      actions: [
        TextButton(
          onPressed: widget.onCancel,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => widget.onPressed(dateTime),
          child: const Text('OK'),
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
    required this.setValue
  }) : super(key: key);

  final PickerType type;
  final List<int> values;
  final void Function(int, int) setValue;

  @override
  Widget build(BuildContext context) {
    List<Widget> cols;

    if(type == PickerType.date) {
      cols = [
        CarouselColumn(
          type: ColumnType.day,
          col: 0,
          index: values[0],
          setValue: setValue,
        ),
        CarouselColumn(
          type: ColumnType.month,
          col: 1,
          index: values[1],
          setValue: setValue,
        ),
        CarouselColumn(
          type: ColumnType.year,
          col: 2,
          index: values[2],
          setValue: setValue,
        ),
      ];
    } else {
      cols = [
        CarouselColumn(
          type: ColumnType.minute,
          col: 0,
          index: values[0],
          setValue: setValue,
        ),
        CarouselColumn(
          type: ColumnType.hour,
          col: 1,
          index: values[1],
          setValue: setValue,
        ),
      ];
    }

    return Row(
      children: cols,
    );
  }
}

class CarouselColumn extends StatelessWidget {
  const CarouselColumn({
    Key? key,
    required this.type,
    required this.index,
    required this.col,
    required this.setValue
  }) : super(key: key);

  final ColumnType type;
  final int index;
  final int col;
  final void Function(int, int) setValue;

  String getTime(int time) {
    switch(type) {
      case ColumnType.minute:
      case ColumnType.hour:
      case ColumnType.day:
        return time < 10 ? "0$time" : "$time";
      case ColumnType.month:
        return time < 10 ? "0$time" : "$time";
      case ColumnType.year:
        return (DateTime.now().year - time).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    int count;
    
    switch(type) {
      case ColumnType.minute:
        count = 60;
        break;
      case ColumnType.hour:
        count = 24;
        break;
      case ColumnType.day:
        count = 30;
        break;
      case ColumnType.month:
        count = 12;
        break;
      case ColumnType.year:
        count = 20;
        break;
    }

    return SizedBox(
      width: 50,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: count,
            options: CarouselOptions(
              height: 100.0,
              viewportFraction: 0.35,
              enlargeCenterPage: true,
              scrollDirection: Axis.vertical,
              onPageChanged: ((index, reason) {
                setValue(col, index);
              })
            ),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              SizedBox(
                width: 50,
                height: 50,
                child: Text(
                  getTime(itemIndex),
                  style: TextStyle(
                    color: index == itemIndex ? AppColors.mainText : AppColors.lightText
                  ),
                )
              )
            ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.mainBrandColor, 
                      width: 2
                    ),
                    bottom: BorderSide(
                      color: AppColors.mainBrandColor, 
                      width: 2
                    ),
                  ),
                )
              )                
            ),
          ),
        ],
      )
      );
    }
  }
