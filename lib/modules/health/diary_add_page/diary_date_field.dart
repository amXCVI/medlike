
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/modules/health/diary_add_page/field_wrapper.dart';
import 'package:medlike/widgets/datetime_picker/datetime_picker.dart';

enum DiaryDateFieldType {
  date,
  time
}

class DiaryDateField extends StatelessWidget {
  const DiaryDateField({
    Key? key,
    required this.labelText,
    required this.type,
    required this.initialDate,
    required this.onChange
  }) : super(key: key);

  final String labelText;
  final DiaryDateFieldType type;
  final DateTime? initialDate;
  final void Function(DateTime) onChange;

  String? getInitialValue(DateTime? date) {
    if(date == null) {
      return null;
    }

    if(type == DiaryDateFieldType.date) {
      return DateFormat('yyyy/MM/dd').format(date);
    } else {
      return DateFormat('kk:mm').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FieldWrapper(
      labelText: labelText,
      initialValue: getInitialValue(initialDate),
      onTap: () {
        showDialog(
          context: context, builder: (ctx) {
            return DateTimePicker(
              type: type == DiaryDateFieldType.date ?
                PickerType.date 
                : PickerType.time,
              onPressed: (date) => {
                onChange(date)
              },
              onCancel: () => {
                Navigator.pop(context)
              },
            );
          });
      },
      onChange: () {},
      isEmpty: true,
    );
  }
}
