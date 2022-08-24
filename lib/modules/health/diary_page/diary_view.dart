import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health/diary_graph/diary_graph.dart';
import 'package:medlike/modules/health/diary_graph/diary_prompt.dart';
import 'package:medlike/modules/health/diary_page/diary_list.dart';
import 'package:medlike/modules/health/diary_page/diary_value.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({
    Key? key,
    required this.title,
    required this.diaryModel,
    required this.decimalDigits,
    required this.measureItem,
    required this.firstDate,
    required this.lastDate,
    required this.grouping,
    required this.paramName,
    required this.onLoadDate
  }) : super(key: key);
  
  final String title;
  final DiaryModel diaryModel;
  final String measureItem;
  final int decimalDigits;
  final DateTime firstDate;
  final DateTime lastDate;
  final String grouping;
  final Function(bool) onLoadDate;
  final List<String> paramName;

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  bool isPrompt = false;
  int selectedId = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          if (!isPrompt) DiaryValue(
            date: widget.firstDate,
            currentValue: widget.diaryModel.getCurrentValue,
            measureItem: widget.measureItem,
            decimalDigits: widget.decimalDigits,
            grouping: widget.grouping,
          ),
          if (isPrompt) Stack(
            children: [
              Positioned(
                child: DiaryPrompt(
                  item: widget.diaryModel.values[selectedId], 
                  decimalDigits: widget.decimalDigits, 
                  measureItem: widget.measureItem
                )
              )
            ],
          ),
          DiaryGraph(
            items: widget.diaryModel.values,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            measureItem: widget.measureItem,
            decimalDigits: widget.decimalDigits,
            grouping: widget.grouping,
            onLoadDate: widget.onLoadDate,
            onSelect: (id) {
              setState(() {
                selectedId = id;
                isPrompt = true;
              });
            },
          ),
          DiaryList(
            title: widget.title,
            items: widget.diaryModel.values,
            decimalDigits: widget.decimalDigits,
            measureItem: widget.measureItem,
            syn: widget.diaryModel.syn,
            paramName: widget.paramName,
          )
        ],
      ),
    );
  }
}
