import 'dart:io';

import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/diary_page/diary_chips.dart';
import 'package:medlike/modules/health/diary_page/diary_nodata.dart';
import 'package:medlike/modules/health/diary_page/diary_skeleton.dart';
import 'package:medlike/modules/health/diary_page/diary_view.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
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
  String grouping = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiaryCubit, DiaryState>(
      listener: (context, state) {
        if(state.selectedDiary != null 
          && state.selectedDiary!.values.isNotEmpty && grouping == ''
        ) {
            final last = state.selectedDiary!.values.last;
            final dates = ValueHelper.getPeriodTiming(last.date, 'Week');

            context.read<DiaryCubit>().getDiariesList(
              project: 'Zapolyarye', 
              platform: Platform.isAndroid ? 'Android' : 'IOS',
              grouping: 'None',
              dateFrom: dates[0],
              dateTo: dates[1],
              syn: state.selectedDiary!.syn
            );

            setState(() {
              grouping = 'Load';
            });
        }

        if(state.pageUpdateStatuses == PageUpdateStatuses.loading) {
          setState(() {
            grouping = '';
          });
        }

        if(state.updateDiaryStatuses == UpdateDiaryStatuses.success) {
          final date = DateTime.now().toUtc(); /// Попробавать везде
          final dates = ValueHelper.getPeriodTiming(date, grouping);

          context.read<DiaryCubit>().getDiariesList(
            project: 'Zapolyarye', 
            platform: Platform.isAndroid ? 'Android' : 'IOS',
            grouping: 'None',
            dateFrom: dates[0],
            dateTo: dates[1],
            syn: state.selectedDiary!.syn
          );
        }
      },
      builder: (context, state) {
        void onTap(String selectedGroup, String syn) {
          final date = DateTime.now();
          final dates = ValueHelper.getPeriodTiming(date, selectedGroup);

          context.read<DiaryCubit>().getDiariesList(
            project: 'Zapolyarye', 
            platform: Platform.isAndroid ? 'Android' : 'IOS',
            grouping: 'None',
            dateFrom: dates[0],
            dateTo: dates[1],
            syn: syn
          );

          setState(() {
            grouping = selectedGroup;
          });

        }

        void onLoadDate(bool isRight) {
          final dates = ValueHelper.getAnotherPeriodTiming(state.dateFrom, grouping, isRight);

          context.read<DiaryCubit>().getDiariesList(
            project: 'Zapolyarye', 
            platform: Platform.isAndroid ? 'Android' : 'IOS',
            grouping: 'None',
            dateFrom: dates[0],
            dateTo: dates[1],
            syn: state.selectedDiary!.syn
          );
        }

        Widget page; 

        if(state.getDiaryStatuses == GetDiaryStatuses.failed) {
          page = const Text('');
        } else if(state.getDiaryStatuses == GetDiaryStatuses.loading 
          || state.selectedDiary == null) {
          page = const DiarySkeleton();
        } else if(state.selectedDiary!.values.isEmpty && grouping == '') {
          page = const DiaryNodata();
        } else {
          page = DiaryView(
            title: widget.title,
            diaryModel: state.selectedDiary!,
            decimalDigits: widget.categoryModel.decimalDigits,
            measureItem: widget.categoryModel.measureItem,
            firstDate: state.dateFrom,
            lastDate: state.dateTo,
            grouping: grouping,
            paramName: widget.categoryModel.paramName,
            onLoadDate: onLoadDate
          );
        }
        return DefaultScaffold(
          isChildrenPage: true,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                if(state.selectedDiary != null
                  && !(state.selectedDiary!.values.isEmpty && grouping == '')
                ) 
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
                  decimalDigits: widget.categoryModel.decimalDigits, 
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
