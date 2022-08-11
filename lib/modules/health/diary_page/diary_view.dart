import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health/diary_page/diary_graph.dart';
import 'package:medlike/modules/health/diary_page/diary_list.dart';
import 'package:medlike/modules/health/diary_page/diary_value.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({
    Key? key,
    required this.diaryModel,
    required this.decimalDigits,
    required this.measureItem,
    required this.firstDate,
    required this.lastDate,
    required this.grouping
  }) : super(key: key);
  
  final DiaryModel diaryModel;
  final String measureItem;
  final int decimalDigits;
  final DateTime firstDate;
  final DateTime lastDate;
  final String grouping; 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          DiaryValue(
            currentValue: diaryModel.getCurrentValue,
            measureItem: measureItem,
            decimalDigits: decimalDigits,
            grouping: grouping,
          ),
          DiaryGraph(
            items: diaryModel.values,
            firstDate: firstDate,
            lastDate: lastDate,
            measureItem: measureItem,
            decimalDigits: decimalDigits,
          ),
          DiaryList(
            items: diaryModel.values,
            decimalDigits: decimalDigits,
            measureItem: measureItem,
          )
        ],
      ),
    );
  }
}
