import 'package:flutter/material.dart';
import 'package:medlike/modules/health/diary_add_page/diary_date_field.dart';

class DiaryAddForm extends StatelessWidget {
  const DiaryAddForm({
    Key? key,
    required this.formKey,
    required this.children,
    required this.onDateChange,
    required this.onTimeChange,
    required this.dateController,
    required this.timeController,
    this.initialDate
  }) : super(key: key);

  final GlobalKey formKey;
  final List<Widget> children;
  final Function(DateTime, String) onDateChange;
  final Function(DateTime, String) onTimeChange;
  final DateTime? initialDate;
  
  final TextEditingController dateController;
  final TextEditingController timeController;

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
            onChange: onDateChange,
            initialDate: initialDate ?? DateTime.now(),
            controller: dateController,
          ),
          DiaryDateField(
            labelText: 'Время', 
            type:  DiaryDateFieldType.time, 
            onChange: onTimeChange,
            initialDate: initialDate ?? DateTime.now(),
            controller: timeController,
          ),
        ],
      ),
    );
  }
}
