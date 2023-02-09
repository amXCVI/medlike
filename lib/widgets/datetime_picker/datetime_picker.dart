import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:medlike/themes/colors.dart';

enum PickerType { date, time }
/// TODO: для времени передавать выбранную дату в пикере даты

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
  late DateTime dateTime = widget.initialDate ?? DateTime.now();

  final divider = Container(
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
  );

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
      content: Container(
        padding: EdgeInsets.symmetric(
          horizontal: widget.type == PickerType.date 
            ? 40.0 : 60.0
        ),
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              width: 1.0,
              color: AppColors.mainSeparatorAlpha
            )
          )
        ),
        width: MediaQuery.of(context).size.width - 50,
        child: DatePickerWidget(
          looping: true, // default is not looping
          firstDate: DateTime(2000), //DateTime(1960),
          lastDate: DateTime.now(),
          initialDate: dateTime,
          dateFormat:
            /// "MM специальный формат для месяца",
            widget.type == PickerType.date 
            ? "dd/MM/yyyy"
            : "HH/mm",
          isTimerPicker: widget.type == PickerType.time,
          verticalDivider: widget.type == PickerType.time 
            ? divider
            : null,
          locale: DatePicker.localeFromString('RU'),
          onChange: (DateTime newDate, _) {
            setState(() {
              dateTime = newDate;
            });
          }, 
          pickerTheme: const DateTimePickerTheme(
            backgroundColor: Colors.transparent,
            itemHeight: 50,
            itemDividerTop: 8,
            itemDividerBottom: 8,
            diameterRatio: 12,
            isRuMonth: true,
            itemTextStyle:
              TextStyle(color: Colors.black, fontSize: 14),
            dividerColor: AppColors.mainBrandColor,
          ),
        ),
      ),
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
                widget.onPressed(
                  dateTime
                );
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
