import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/modules/health/diary_graph/diary_graph.dart';
import 'package:medlike/modules/health/diary_graph/diary_prompt.dart';
import 'package:medlike/modules/health/diary_page/diary_list.dart';
import 'package:medlike/modules/health/diary_page/diary_value.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/context_helper.dart';
import 'package:medlike/utils/helpers/grouping_helper.dart';

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
  final DiaryFlatModel diaryModel;
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
  Offset offset = const Offset(0, 0);
  Offset? centerOffset;
  final GlobalKey _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<DataItem> items =  widget.diaryModel.values;
    switch(widget.grouping) {
      case 'Day':
        items = GroupingHelper.groupByHour(items);
        break;
      case 'Week':
      case 'Month':
      default:
        items = GroupingHelper.groupByDay(items);
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          if (!isPrompt) DiaryValue(
            date: widget.firstDate,
            currentValue: widget.diaryModel.currentValue,
            measureItem: widget.measureItem,
            decimalDigits: widget.decimalDigits,
            grouping: widget.grouping,
          ),
          if (isPrompt) Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 88,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 0,
                left: centerOffset?.dx ?? offset.dx,
                child: DiaryPrompt(
                  key: _widgetKey,
                  item: widget.diaryModel.values[selectedId], 
                  decimalDigits: widget.decimalDigits, 
                  measureItem: widget.measureItem
                )
              ),
              Positioned(
                left: offset.dx - 1,
                bottom: 0,
                child: Container(
                  height: 28,
                  width: 1,
                  color: AppColors.mainSeparatorAlpha,
                )
              )
            ],
          ),
          DiaryGraph(
            items: items,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            measureItem: widget.measureItem,
            decimalDigits: widget.decimalDigits,
            grouping: widget.grouping,
            onLoadDate: widget.onLoadDate,
            selected: offset.dx,
            onSelect: (id, newOffset) {
              Future.microtask(
                () {
                  setState(() {
                    selectedId = id;
                    isPrompt = true;
                    offset = newOffset;
                  });

                  ContextHelper.getFutureSizeFromGlobalKey(
                    _widgetKey, 
                    (size) => setState(() {
                      final dw = MediaQuery.of(context).size.width;
                      var w = offset.dx - size.width / 2;
                      w = w < 0 ? 0 : w;
                      w = w > dw ? dw : w;
                      centerOffset = Offset(
                        w < 0 ? 0 : w,
                        size.height
                      );
                    }) 
                  );
                }
              );
            },
            onUnselect: () {
              setState(() {
                isPrompt = false;
              });
            },
          ),
          DiaryList(
            title: widget.title,
            items: items,
            decimalDigits: widget.decimalDigits,
            measureItem: widget.measureItem,
            syn: widget.diaryModel.syn,
            paramName: widget.paramName,
            grouping: widget.grouping,
          )
        ],
      ),
    );
  }
}
