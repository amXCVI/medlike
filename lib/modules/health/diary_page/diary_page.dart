import 'dart:io';

import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/diary_page/diary_chips.dart';
import 'package:medlike/modules/health/diary_page/diary_skeleton.dart';
import 'package:medlike/modules/health/diary_page/diary_view.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/utils/helpers/date_helpers.dart';
import 'package:auto_route/auto_route.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({
    Key? key,
    required this.title,
    required this.categoryModel
  }) : super(key: key);

  final String title;
  final DiaryCategoryModel categoryModel;

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  String grouping = 'Hour';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        void onTap(String selectedGroup, String syn) {
          final date = DateTime.now();
          DateTime dateFrom;
          DateTime dateTo = DateTime.now();

          switch(selectedGroup) {
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
            grouping: selectedGroup == 'Hour' ? 'Hour' : 'Day',
            dateFrom: dateFrom,
            dateTo: dateTo,
            syn: syn
          );

          setState(() {
            grouping = selectedGroup;
          });

        }

        Widget page; 

        if(state.getDiaryStatuses == GetDiaryStatuses.failed) {
          page = const Text('');
        } else if(state.getDiaryStatuses == GetDiaryStatuses.loading 
          || state.selectedDiary == null) {
          page = const DiarySkeleton();
        } else  {
          page = DiaryView(
            diaryModel: state.selectedDiary!,
            decimalDigits: widget.categoryModel.decimalDigits,
            measureItem: widget.categoryModel.measureItem,
            firstDate: state.dateFrom,
            lastDate: state.dateTo,
            grouping: grouping,
          );
        }
        return DefaultScaffold(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                if(state.selectedDiary != null) 
                  DiaryChips(
                    syn: state.selectedDiary!.syn,
                    onTap: onTap,
                    selectedGroup: grouping,
                  ),
                page,
              ],
            ),
          ),
          appBarTitle: widget.title,
          actionButton: FloatingActionButton.extended(
            onPressed: () {
              context.router.push(
                DiaryAddRoute(
                  title: widget.title, 
                  measureItem: widget.categoryModel.measureItem, 
                  paramName: widget.categoryModel.paramName
                )
              );
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
