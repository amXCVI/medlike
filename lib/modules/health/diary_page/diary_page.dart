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
    required this.categoryModel,
    required this.syn
  }) : super(key: key);

  final String title;
  final DiaryCategoryModel categoryModel;
  final String syn;

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  String grouping = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        void onTap(String selectedGroup, String syn) {
          final date = DateTime.now().toUtc();
          final dates = ValueHelper.getPeriodTiming(date, selectedGroup);

          context.read<DiaryCubit>().setTimePeriod(
            start: dates[0],
            end: dates[1],
            syn: syn
          );

          setState(() {
            grouping = selectedGroup;
          });

        }

        void onLoadDate(bool isRight) {
          final dates = ValueHelper.getAnotherPeriodTiming(state.dateFrom, grouping, isRight);

          context.read<DiaryCubit>().setTimePeriod(
            start: dates[0],
            end: dates[1],
            syn: state.selectedDiary!.syn
          );
        }

        Widget page; 

        if(state.updateDiaryStatuses == UpdateDiaryStatuses.failed) {
          page = const Text('Failed');
        } else if(state.updateDiaryStatuses == UpdateDiaryStatuses.loading 
          || state.periodedSelectedDiary == null) {
          page = const DiarySkeleton();
        } else if(state.periodedSelectedDiary!.values.isEmpty && grouping == '') {
          page = const DiaryNodata();
        } else {
          page = DiaryView(
            title: widget.title,
            diaryModel: state.periodedSelectedDiary!,
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
                  paramName: widget.categoryModel.paramName,
                  grouping: grouping
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
