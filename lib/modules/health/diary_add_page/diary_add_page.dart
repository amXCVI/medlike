import 'package:flutter/material.dart' hide FormField;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/diary_add_page/diary_add_form.dart';
import 'package:medlike/modules/health/diary_add_page/form_field.dart';

import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:auto_route/auto_route.dart';

import '../../../utils/helpers/value_helper.dart';

class DiaryAddPage extends StatefulWidget {
  const DiaryAddPage({
    Key? key, 
    required this.title,
    required this.measureItem,
    required this.decimalDigits,
    required this.paramName,
    required this.grouping,
    required this.onSubmit,
    required this.minValue,
    required this.maxValue,
    this.initialValues,
    this.initialDate
  }) : super(key: key);

  final String title;
  final String measureItem;
  final int decimalDigits;
  final List<String> paramName;
  final DateTime? initialDate;
  final List<double>? initialValues;
  final List<double> minValue;
  final List<double> maxValue;
  final String grouping;
  final Function(String, DateTime, DateTime) onSubmit;

  @override
  State<DiaryAddPage> createState() => _DiaryAddPageState();
}

class _DiaryAddPageState extends State<DiaryAddPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _initialDate;
  DateTime? _initialTime;
  
  late final List<TextEditingController> _controllers = widget.paramName.map(
    (e) => TextEditingController()
  ).toList();
  late List<bool> isEmpties = widget.paramName.map(
    (e) => true
  ).toList();
  late List<String> initialValues = widget.paramName.map(
    (e) => ''
  ).toList();
  late List<bool> isValidate = widget.paramName.map(
    (e) => false
  ).toList();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  DateTime? date;
  DateTime? time;

  @override
  void initState() {
    if(widget.initialDate != null) {
      date = widget.initialDate;
      time = widget.initialDate;
      _initialDate = widget.initialDate;
      _initialTime = widget.initialDate;
    }

    if(widget.initialValues != null) {
      for(int i = 0; i < widget.paramName.length; i++) {
        initialValues[i] = 
          widget.initialValues![i].toStringAsFixed(widget.decimalDigits);
        _controllers[i].text = initialValues[i];
      }
    }

    final initDate = widget.initialDate ?? DateTime.now();

    dateController.text = ValueHelper.getDatepickerString(initDate, true)!;
    timeController.text = ValueHelper.getDatepickerString(initDate, false)!;

    date = initDate;
    time = initDate;
    
    super.initState();
  }

  void onFocus(int index, bool status) {
    _formKey.currentState!.validate();
    setState(() {
      isValidate[index] = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fields = widget.paramName.map((e) {
      int index = widget.paramName.indexOf(e);

      return FormField(
        labelText: e,
        isValidate: isValidate[index],
        onFocus: () => onFocus(index, false), 
        controller: _controllers[index], 
        isEmpty: isEmpties[index],
        validator: (str) {
          final num = double.tryParse(str ?? '');

          if(!isValidate[index]) {
            return null;
          }

          if(num == null) {
            return 'Введите число';
          }
          if(num < widget.minValue[index]) {
            return 'Введённое значение ниже минимального';
          }
          if(num > widget.maxValue[index]) {
            return 'Введённое значение выше максимального';
          }
          return null;
        },
        onChange: (text) {
          onFocus(index, false);
          setState(() {
            isEmpties[index] = text == '';
          });
        },
      );
    }).toList();

    void onDateChange(DateTime date, String text) {
      setState(() {
        dateController.text = text;
        this.date = date;
        _initialDate = date;
      });
    }

    void onTimeChange(DateTime time, String text) {
      setState(() {
        timeController.text = text;
        this.time = time;
        _initialTime = time;
      });
    }

    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        return DefaultScaffold(
          isChildrenPage: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DiaryAddForm(
              children: fields,
              formKey: _formKey,
              initialDate: _initialDate,
              initialTime: _initialTime,
              onDateChange: onDateChange,
              onTimeChange: onTimeChange,
              dateController: dateController,
              timeController: timeController,
            ),
          ),
          appBarTitle: widget.title,
          actionButton: FloatingActionButton.extended(
            onPressed: () {
              isValidate.asMap().map((k, v) {
                setState(() {
                  isValidate[k] = true;
                });
                return MapEntry(k, v);
              });

              if (!_formKey.currentState!.validate()) {
                return;
              }

              final newDate = DateTime(
                date!.year,
                date!.month,
                date!.day,
                time!.hour,
                time!.minute
              );

              final dates = ValueHelper.getPeriodTiming(newDate, widget.grouping);
              
              if(widget.initialDate != null || widget.initialValues != null) {
                final dates = ValueHelper.getPeriodTiming(widget.initialDate!, widget.grouping);
                widget.onSubmit(widget.grouping, dates[0], dates[1]);

                context.read<DiaryCubit>().putDiaryEntry(
                  date: newDate,
                  oldDate: widget.initialDate!,
                  syn: state.selectedDiary!.syn,
                  values: _controllers.map((e) => 
                    double.parse(e.text) 
                  ).toList(),
                  updateFrom: dates[0],
                  updateTo: dates[1]
                );
              } else {
                widget.onSubmit(widget.grouping, dates[0], dates[1]);

                context.read<DiaryCubit>().postDiaryEntry(
                  date: newDate,
                  syn: state.selectedDiary!.syn,
                  values: _controllers.map((e) => 
                    double.parse(e.text) 
                  ).toList(),
                  updateFrom: dates[0],
                  updateTo: dates[1]
                );
              }
              context.router.pop();
            },
            label: Text(
              (widget.initialValues == null ? 'Добавить' : 'Сохранить').toUpperCase(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        );
      },
    );
  }
}
