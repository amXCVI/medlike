
import 'package:flutter/material.dart';
import 'package:medlike/modules/health/diary_add_page/field_wrapper.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
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
    required this.onChange,
    required this.controller
  }) : super(key: key);

  final String labelText;
  final DiaryDateFieldType type;
  final DateTime? initialDate;
  final TextEditingController controller;
  final void Function(DateTime, String) onChange;

  @override
  Widget build(BuildContext context) {
    return FieldWrapper(
      labelText: labelText,
      //initialValue: getInitialValue(initialDate),
      onTap: () {
        showDialog(
          context: context, builder: (ctx) {
            return DateTimePicker(
              type: type == DiaryDateFieldType.date ?
                PickerType.date 
                : PickerType.time,
              initialDate: initialDate,  
              onPressed: (date) => {
                onChange(date, ValueHelper.getDatepickerString(
                  date, type == DiaryDateFieldType.date)!
                )
              },
              onCancel: () => {},
            );
          });
      },
      onChange: () {},
      controller: controller,
      isEmpty: true,
    );
  }
}
