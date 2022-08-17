
import 'package:flutter/material.dart';
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
    required this.onChange
  }) : super(key: key);

  final String labelText;
  final DiaryDateFieldType type;
  final void Function(DateTime) onChange;

  @override
  Widget build(BuildContext context) {
    return FieldWrapper(
      labelText: labelText,
      onTap: () {
        showDialog(
          context: context, builder: (ctx) {
            return DateTimePicker(
              type: type == DiaryDateFieldType.date ?
                PickerType.date 
                : PickerType.time,
              onPressed: (date) => {},
              onCancel: () => {},
            );
          });
      },
      onChange: () {},
      isEmpty: true,
    );
  }
}
