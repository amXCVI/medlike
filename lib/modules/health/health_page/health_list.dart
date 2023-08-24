import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/domain/app/cubit/prompt/prompt_cubit.dart';
import 'package:medlike/modules/health/health_page/health_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:collection/collection.dart';

class HealthList extends StatelessWidget {
  const HealthList(
      {Key? key,
      required this.diariesCategoriesList,
      required this.diariesItems})
      : super(key: key);

  final List<DiaryCategoryModel> diariesCategoriesList;
  final List<DiaryFlatModel> diariesItems;

  @override
  Widget build(BuildContext context) {
    DiaryFlatModel? getDiaryEntries(
        int index, DateTime periodStart, DateTime periodEnd) {
      for (int i = 0; i < diariesItems.length; i++) {
        if (diariesItems[i].syn == diariesCategoriesList[index].synonim) {
          return ValueHelper.filterByPeriod(
              diariesList: diariesItems[i], start: periodStart, end: periodEnd);
        }
      }

      return null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
          itemCount: diariesCategoriesList.length,
          itemBuilder: (ctx, index) {
            final diary = diariesItems.firstWhereOrNull(
                (el) => el.syn == diariesCategoriesList[index].synonim);

            final date = diary?.currentValue?.date ?? DateTime.now();
            DateTime dateFrom = date_utils.DateUtils.firstDayOfWeek(date);
            DateTime dateTo = date_utils.DateUtils.lastDayOfWeekWithHours(date);

            return HealthItem(
              iconPath: diariesCategoriesList[index].categoryImg,
              title: diariesCategoriesList[index].name,
              measureItem: diariesCategoriesList[index].measureItem,
              decimalDigits: diariesCategoriesList[index].decimalDigits,
              minValue: diariesCategoriesList[index].minValue,
              maxValue: diariesCategoriesList[index].maxValue,
              data: getDiaryEntries(index, dateFrom, dateTo),
              firstDate: dateFrom,
              lastDate: dateTo,
              index: index,
              setSelected: (status) {
                context.read<PromptCubit>().select(selectedId: index);
              },
              onNavigate: (String title, String syn) {
                final date = DateTime.now();
                final dates = ValueHelper.getPeriodTiming(date, '');

                context
                    .read<DiaryCubit>()
                    .setTimePeriod(start: dates[0], end: dates[1], syn: syn);

                context.router.push(DiaryRoute(
                    syn: syn,
                    title: title,
                    categoryModel: diariesCategoriesList[index]));

                context.read<PromptCubit>().unselect();
              },
            );
          }),
    );
  }
}
