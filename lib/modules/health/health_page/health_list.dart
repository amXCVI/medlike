import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/health_page/health_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/helpers/value_helper.dart';

class HealthList extends StatelessWidget {
  const HealthList({
    Key? key,
    required this.diariesCategoriesList,
    required this.diariesItems,
    required this.firstDate,
    required this.lastDate,
    required this.onLoadDada
  }) : super(key: key);

  final List<DiaryCategoryModel> diariesCategoriesList;
  final List<DiaryFlatModel> diariesItems;
  final Function onLoadDada;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  Widget build(BuildContext context) {
    DiaryFlatModel? getDiaryEntries(int index) {
      for(int i = 0; i < diariesItems.length; i++) {
        if(diariesItems[i].syn == diariesCategoriesList[index].synonim) {
          return diariesItems[i];
        }
      }

      return null;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: diariesCategoriesList.length,
        itemBuilder: (ctx, index) {
          return HealthItem(
            iconPath: diariesCategoriesList[index].categoryImg, 
            title: diariesCategoriesList[index].name,
            measureItem: diariesCategoriesList[index].measureItem,
            decimalDigits: diariesCategoriesList[index].decimalDigits,
            data: getDiaryEntries(index),
            firstDate: firstDate,
            lastDate: lastDate,
            onLoadDada: onLoadDada,
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
                  categoryModel: diariesCategoriesList[index]
                )
              );
            },
          );
        }
      ),
    );
  }
}
