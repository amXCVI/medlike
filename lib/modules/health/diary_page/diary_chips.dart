import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';

class DiaryChips extends StatelessWidget {
  const DiaryChips({
    Key? key,
    required this.syn,
    required this.onTap,
    required this.selectedGroup
  }) : super(key: key);

  final String syn;
  final String selectedGroup;
  final Function onTap;

  @override
    Widget build(BuildContext context) {

    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        void tap(String grouping) {
          onTap(grouping, syn);
        }

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DiaryChip(grouping: 'Hour', title: 'Час', onTap: tap, selected: selectedGroup),
              DiaryChip(grouping: 'Day', title: 'День', onTap: tap, selected: selectedGroup),
              DiaryChip(grouping: 'Week', title: 'Неделя', onTap: tap, selected: selectedGroup),
              DiaryChip(grouping: 'Month', title: 'Месяц', onTap: tap, selected: selectedGroup),
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
