import 'package:flutter/material.dart';
import 'package:medlike/modules/health/diary_add_page/diary_date_field.dart';

class DiaryAddForm extends StatelessWidget {
  const DiaryAddForm({
    Key? key,
    required this.formKey,
    required this.children,
    required this.onDateChange,
    required this.onTimeChange
  }) : super(key: key);

  final GlobalKey formKey;
  final List<Widget> children;
  final Function(DateTime) onDateChange;
  final Function(DateTime) onTimeChange;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ...children,
          DiaryDateField(
            labelText: 'Дата', 
            type:  DiaryDateFieldType.date, 
            onChange: onDateChange
          ),
          DiaryDateField(
            labelText: 'Время', 
            type:  DiaryDateFieldType.time, 
            onChange: onTimeChange
          ),
        ],
      ),
    );
  }
}
