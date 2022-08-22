import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/health/diary_add_page/field_wrapper.dart';

enum DiaryDateFieldType {
  date,
  time
}

class DiaryDateField extends StatelessWidget {
  const DiaryDateField({
    Key? key,
    required this.labelText,
    required this.type,
    required this.onChange
  }) : super(key: key);

  final String labelText;
  final DiaryDateFieldType type;
  final void Function(DateTime) onChange;

  @override
  Widget build(BuildContext context) {
    return FieldWrapper(
      labelText: labelText,
      child: DateTimeFormField(
        mode: type == DiaryDateFieldType.date 
          ? DateTimeFieldPickerMode.date : DateTimeFieldPickerMode.time,
        autovalidateMode: AutovalidateMode.always,
        onDateSelected: onChange,
      ),
    );
  }
}
