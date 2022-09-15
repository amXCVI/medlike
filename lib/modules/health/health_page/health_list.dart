import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/health_page/health_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:collection/collection.dart';

class HealthList extends StatefulWidget {
  const HealthList({
    Key? key,
    required this.diariesCategoriesList,
    required this.diariesItems,
    required this.onLoadDada
  }) : super(key: key);

  final List<DiaryCategoryModel> diariesCategoriesList;
  final List<DiaryFlatModel> diariesItems;
  final Function onLoadDada;

  @override
  State<HealthList> createState() => _HealthListState();
}

class _HealthListState extends State<HealthList> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    DiaryFlatModel? getDiaryEntries(int index) {
      for(int i = 0; i < widget.diariesItems.length; i++) {
        if(widget.diariesItems[i].syn == widget.diariesCategoriesList[index].synonim) {
          return widget.diariesItems[i];
        }
      }

      return null;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: widget.diariesCategoriesList.length,
        itemBuilder: (ctx, index) {
          final diary = widget.diariesItems.firstWhereOrNull(
            (el) => el.syn == widget.diariesCategoriesList[index].synonim
          );

          final date = diary?.currentValue.date ?? DateTime.now();
          DateTime dateFrom = date_utils.DateUtils.firstDayOfWeek(date);
          DateTime dateTo = date_utils.DateUtils.lastDayOfWeek(date);

          return HealthItem(
            iconPath: widget.diariesCategoriesList[index].categoryImg, 
            title: widget.diariesCategoriesList[index].name,
            measureItem: widget.diariesCategoriesList[index].measureItem,
            decimalDigits: widget.diariesCategoriesList[index].decimalDigits,
            minValue: widget.diariesCategoriesList[index].minValue,
            maxValue: widget.diariesCategoriesList[index].maxValue,
            data: getDiaryEntries(index),
            firstDate: dateFrom,
            lastDate: dateTo,
            isSelected: selectedId == index,
            setSelected: (status) {
              setState(() {
                if(status) {
                  selectedId = index;
                } else {
                  selectedId = null;
                }
              });
            },
            onLoadDada: widget.onLoadDada,
            onNavigate: (String title, String syn) {
              final date = DateTime.now();
              final dates = ValueHelper.getPeriodTiming(date, '');

              context.read<DiaryCubit>().setTimePeriod(
                start: dates[0],
                end: dates[1],
                syn: syn
              );

              context.router.push(
                DiaryRoute(
                  syn: syn,
                  title: title,
                  categoryModel: widget.diariesCategoriesList[index]
                )
              );

              setState(() {
                selectedId = null;
              });
            },
          );
        }
      ),
    );
  }
}
