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
    this.initialValues,
    this.initialDate
  }) : super(key: key);

  final String title;
  final String measureItem;
  final int decimalDigits;
  final List<String> paramName;
  final DateTime? initialDate;
  final List<double>? initialValues;

  @override
  State<DiaryAddPage> createState() => _DiaryAddPageState();
}

class _DiaryAddPageState extends State<DiaryAddPage> {
  final _formKey = GlobalKey<FormState>();
  
  late final List<TextEditingController> _controllers = widget.paramName.map(
    (e) => TextEditingController()
  ).toList();
  late List<bool> isEmpties = widget.paramName.map(
    (e) => true
  ).toList();
  late List<String> initialValues = widget.paramName.map(
    (e) => ''
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

  @override
  Widget build(BuildContext context) {
    final fields = widget.paramName.map((e) {
      return FormField(
        labelText: e, 
        controller: _controllers[widget.paramName.indexOf(e)], 
        isEmpty: isEmpties[widget.paramName.indexOf(e)],
        validator: (str) {
          final num = double.tryParse(str ?? '');
          if(num == null) {
            return 'Введите число';
          }
          return null;
        },
        onChange: (text) {
          setState(() {
            isEmpties[widget.paramName.indexOf(e)] = text == '';
          });
        },
      );
    }).toList();

    void onDateChange(DateTime date, String text) {
      setState(() {
        dateController.text = text;
        this.date = date;
      });
    }

    void onTimeChange(DateTime time, String text) {
      setState(() {
        timeController.text = text;
        this.time = time;
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
              initialDate: widget.initialDate,
              onDateChange: onDateChange,
              onTimeChange: onTimeChange,
              dateController: dateController,
              timeController: timeController,
            ),
          ),
          appBarTitle: widget.title,
          actionButton: FloatingActionButton.extended(
            onPressed: () {
              final newDate = date!.add(Duration(
                hours: time!.hour,
                minutes: time!.minute,
                seconds: time!.second
              ));
              if(widget.initialDate != null || widget.initialValues != null) {
                context.read<DiaryCubit>().putDiaryEntry(
                  date: newDate,
                  oldDate: widget.initialDate!,
                  syn: state.selectedDiary!.syn,
                  values: _controllers.map((e) => 
                    double.parse(e.text) 
                  ).toList()
                );
              } else {
                context.read<DiaryCubit>().postDiaryEntry(
                  date: newDate,
                  syn: state.selectedDiary!.syn,
                  values: _controllers.map((e) => 
                    double.parse(e.text) 
                  ).toList()
                );
              }
              context.router.pop();
            },
            label: Text(
              'Добавить'.toUpperCase(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        );
      },
    );
  }
}