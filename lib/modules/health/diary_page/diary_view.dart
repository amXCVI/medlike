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
    required this.measureItem
  }) : super(key: key);
  
  final DiaryModel diaryModel;
  final String measureItem;
  final int decimalDigits;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DiaryValue(currentValue: diaryModel.getCurrentValue),
        DiaryGraph(items: diaryModel.values),
        DiaryList(
          items: diaryModel.values,
          decimalDigits: decimalDigits,
          measureItem: measureItem,
        )
      ],
    );
  }
}
