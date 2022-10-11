import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/prompt/prompt_cubit.dart';
import 'package:medlike/modules/health/diary_graph/diary_graph.dart';
import 'package:medlike/modules/health/diary_graph/diary_prompt.dart';
import 'package:medlike/modules/health/diary_page/diary_list.dart';
import 'package:medlike/modules/health/diary_page/diary_value.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/context_helper.dart';
import 'package:medlike/utils/helpers/grouping_helper.dart';
import 'package:medlike/utils/helpers/value_helper.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({
    Key? key,
    required this.title,
    required this.diaryModel,
    required this.decimalDigits,
    required this.measureItem,
    required this.minValue,
    required this.maxValue,
    required this.firstDate,
    required this.lastDate,
    required this.grouping,
    required this.isPrompt,
    required this.setPrompt,
    required this.paramName,
    required this.onLoadDate,
    required this.onSubmit
  }) : super(key: key);
  
  final String title;
  final DiaryFlatModel diaryModel;
  final String measureItem;
  final int decimalDigits;
  final List<double> minValue;
  final List<double> maxValue;
  final DateTime firstDate;
  final DateTime lastDate;
  final String grouping;
  final bool isPrompt; 
  final Function setPrompt;
  final Function(bool) onLoadDate;
  final List<String> paramName;
  final Function(String, DateTime, DateTime) onSubmit;

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  bool isPrompt = false;
  int selectedId = 0;
  Offset offset = const Offset(0, 0);
  Offset? centerOffset;
  final GlobalKey _widgetKey = GlobalKey();

  String getMeasureItem(DateTime periodStart, DateTime periodEnd) {
    return ValueHelper.getMeasureItem(
      diariesList: widget.diaryModel,
      start: periodStart,
      end: periodEnd,
      decimalDigits: widget.decimalDigits
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DataItem> items = widget.diaryModel.values;
    List<DataItem> chartItems = widget.diaryModel.values;

    switch(widget.grouping) {
      case 'Hour':
        break;
      case 'Day':
      case 'Week':
        items = GroupingHelper.groupByHour(items);
        chartItems = items.map((e) => GroupingHelper.getByHour(e)).toList();
        break;
      case 'Month':
      default:
        items = GroupingHelper.groupByDay(items);
        chartItems = items.map((e) => GroupingHelper.getByDay(e)).toList();
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          BlocBuilder<PromptCubit, PromptState>(
            builder: (context, state) {
              final prompted = state.promptStatuses == PromptStatuses.selected;

              return Column(
                children: [
                  if(!prompted) DiaryValue(
                    date: widget.firstDate,
                    currentValue: getMeasureItem(widget.firstDate, widget.lastDate),
                    measureItem: widget.measureItem,
                    decimalDigits: widget.decimalDigits,
                    grouping: widget.grouping,
                  ),
                  if(prompted)  Stack(
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
                    items: chartItems,
                    firstDate: widget.firstDate,
                    lastDate: widget.lastDate,
                    measureItem: widget.measureItem,
                    decimalDigits: widget.decimalDigits,
                    grouping: widget.grouping,
                    onLoadDate: widget.onLoadDate,
                    selected: prompted ? offset.dx : null,
                    minValue: widget.minValue,
                    maxValue: widget.maxValue,
                    onSelect: (id, newOffset) {
                      Future.microtask(
                        () {
                          setState(() {
                            selectedId = id;
                            context.read<PromptCubit>().select();
                            offset = newOffset;
                          });

                          ContextHelper.getFutureSizeFromGlobalKey(
                            _widgetKey, 
                            (size) => setState(() {
                              final dw = MediaQuery.of(context).size.width - 32;
                              var w = offset.dx - size.width / 2;
                              w = w < 0 ? 0 : w;
                              w = offset.dx > dw ? dw : w;
                              if(offset.dx + size.width <= dw) {
                                centerOffset = Offset(
                                  w < 0 ? 0 : w,
                                  size.height
                                );
                              } else {
                                centerOffset = Offset(
                                  dw - size.width,
                                  size.height
                                );
                              }
                            }) 
                          );
                        }
                      );
                    },
                    onUnselect: () {
                      context.read<PromptCubit>().unselect();
                    },
                  ),
                ],
              );
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
            onSubmit: widget.onSubmit,
            minValue: widget.minValue,
            maxValue: widget.maxValue,
          )
        ],
      ),
    );
  }
}
