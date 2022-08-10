import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';

class DiaryChips extends StatefulWidget {
  const DiaryChips({
    Key? key,
    required this.syn,
    required this.onTap
  }) : super(key: key);

  final String syn;
  final Function onTap;

  @override
  State<DiaryChips> createState() => _DiaryChipsState();
}

class _DiaryChipsState extends State<DiaryChips> {
  String selectedGroup = 'Hour';

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        void onTap(String grouping) {
          widget.onTap(grouping, widget.syn);

          setState(() {
            selectedGroup = grouping;
          });
        }

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DiaryChip(grouping: 'Hour', title: 'Час', onTap: onTap, selected: selectedGroup),
              DiaryChip(grouping: 'Day', title: 'День', onTap: onTap, selected: selectedGroup),
              DiaryChip(grouping: 'Week', title: 'Неделя', onTap: onTap, selected: selectedGroup),
              DiaryChip(grouping: 'Month', title: 'Месяц', onTap: onTap, selected: selectedGroup),
            ],
          ),
        );
      },
    );
  }
}

class DiaryChip extends StatelessWidget {
  const DiaryChip({
    Key? key, 
    required this.title,
    required this.grouping, 
    required this.onTap,
    required this.selected
  }) : super(key: key);

  final String title;
  final String grouping;
  final Function onTap;
  final String selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(grouping),
      child: Chip(
        backgroundColor: selected == grouping ? const Color.fromRGBO(60, 148, 168, 1) : Colors.white,
        label: Text(title),
      ),
    );
  }
}
