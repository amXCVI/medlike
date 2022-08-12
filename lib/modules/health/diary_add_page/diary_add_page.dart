import 'package:flutter/material.dart' hide FormField;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/diary_add_page/diary_add_form.dart';
import 'package:medlike/modules/health/diary_add_page/form_field.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:auto_route/auto_route.dart';

class DiaryAddPage extends StatefulWidget {
  const DiaryAddPage({
    Key? key, 
    required this.title,
    required this.measureItem,
    required this.paramName
  }) : super(key: key);

  final String title;
  final String measureItem;
  final List<String> paramName;

  @override
  State<DiaryAddPage> createState() => _DiaryAddPageState();
}

class _DiaryAddPageState extends State<DiaryAddPage> {
  final _formKey = GlobalKey<FormState>();
  late final List<TextEditingController> _controllers = widget.paramName.map(
    (e) => TextEditingController()
  ).toList();

  DateTime? date;
  DateTime? time;

  @override
  Widget build(BuildContext context) {
    final fields = widget.paramName.map((e) {
      return FormField(
        labelText: e, 
        controller: _controllers[widget.paramName.indexOf(e)], 
        onChange: () {},
      );
    }).toList();

    void onDateChange(DateTime date) {
      setState(() {
        this.date = date;
      });
    }

    void onTimeChange(DateTime time) {
      setState(() {
        this.time = time;
      });
    }

    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        return DefaultScaffold(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DiaryAddForm(
              children: fields,
              formKey: _formKey,
              onDateChange: onDateChange,
              onTimeChange: onTimeChange,
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

              context.read<DiaryCubit>().postDiaryEntry(
                date: dateTimeToServerFormat(newDate, 0),
                syn: state.selectedDiary!.syn,
                values: _controllers.map((e) => 
                  double.parse(e.text) 
                ).toList()
              );

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
