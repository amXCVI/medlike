

import 'dart:io';

import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/utils/helpers/date_helpers.dart';

class DiaryChips extends StatefulWidget {
  const DiaryChips({
    Key? key,
    required this.syn
  }) : super(key: key);

  final String syn;

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
          final date = DateTime.now();
          DateTime dateFrom;
          DateTime dateTo = DateTime.now();

          switch(grouping) {
            case 'Hour':
              dateFrom = DateUtils.firstDayOfWeek(date);
              //dateTo = DateUtils.lastDayOfWeek(date);
              break;
            case 'Day':
              dateFrom = DateUtils.firstDayOfWeek(date);
              //dateTo = DateUtils.lastDayOfWeek(date);
              break;
            case 'Week':
              dateFrom = DateUtils.firstDayOfMonth(date);
              //dateTo = DateUtils.lastDayOfMonth(date);
              break;
            default:
              dateFrom = DateUtils.firstDayOfMonth(date);
              //dateTo = DateUtils.lastDayOfMonth(date);
          }

          context.read<DiaryCubit>().getDiariesList(
            project: 'Zapolyarye', 
            platform: Platform.isAndroid ? 'Android' : 'IOS',
            grouping: grouping == 'Hour' ? 'Hour' : 'Day',
            dateFrom: dateFrom,
            dateTo: dateTo,
            syn: widget.syn
          );

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
