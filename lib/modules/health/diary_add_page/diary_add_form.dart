import 'package:flutter/material.dart';
import 'package:medlike/modules/health/diary_add_page/diary_date_field.dart';
import 'package:medlike/utils/helpers/value_helper.dart';

class DiaryAddForm extends StatelessWidget {
  const DiaryAddForm({
    Key? key,
    required this.formKey,
    required this.children,
    required this.onDateChange,
    required this.onTimeChange,
    required this.dateController,
    required this.timeController,
    this.initialDate,
    this.initialTime,
    required this.setEnabled
  }) : super(key: key);

  final GlobalKey formKey;
  final List<Widget> children;
  final Function(DateTime, String) onDateChange;
  final Function(DateTime, String) onTimeChange;
  final DateTime? initialDate;
  /// Обновлям время когда дата изменилась
  final DateTime? initialTime;
  final Function(bool) setEnabled;
  
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
            initialDate: initialTime ?? DateTime.now(),
            controller: timeController,
            validator: (timeString) {
              final date = ValueHelper.getDatepickerTime(dateController.text, true);
              final time = ValueHelper.getDatepickerTime(timeString, false);
              final timeDuration = Duration(
                hours: time?.hour ?? 0, 
                minutes: time?.minute ?? 0, 
                seconds: time?.second ?? 0
              );
              final finalDate = date?.add(timeDuration);
              if (finalDate!.isAfter(DateTime.now())) {
                setEnabled(false);
                return 'Нельзя добавить показатель на будущую дату';
              }
              setEnabled(true);
              return null;
            },
          ),
        ],
      ),
    );
  }
}
