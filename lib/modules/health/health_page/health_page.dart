import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/modules/health/health_page/health_list.dart';
import 'package:medlike/modules/health/health_page/health_list_skeleton.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

    void _onLoadDada(String grouping, {
      String? syn
    }) {
      context.read<DiaryCubit>().getDiaryCategoriesList(
        project: 'Zapolyarye', 
        platform: Platform.isAndroid ? 'Android' : 'IOS'
      );

      final date = DateTime.now();

      final dateFrom = getDate(date.subtract(Duration(days: date.weekday - 1)));
      final dateTo = getDate(date.add(Duration(days: DateTime.daysPerWeek - date.weekday)));

      context.read<DiaryCubit>().getDiariesList(
        project: 'Zapolyarye', 
        platform: Platform.isAndroid ? 'Android' : 'IOS',
        grouping: grouping,
        dateFrom: dateFrom,
        dateTo: dateTo,
        syn: syn
      );
    }

    _onLoadDada('Day');

    return DefaultScaffold(
      child: BlocBuilder<DiaryCubit, DiaryState>(
        builder: (context, state) {
          if (state.getDiaryCategoriesStatuses == GetDiaryCategoriesStatuses.failed
            || state.getDiaryStatuses == GetDiaryStatuses.failed
          ) {
            return const Text('');
          } else if (state.getDiaryCategoriesStatuses == GetDiaryCategoriesStatuses.success 
              && state.getDiaryStatuses == GetDiaryStatuses.success
          ) {
            return HealthList(
              diariesCategoriesList: state.diariesCategoriesList!,
              diariesItems: state.diariesList!,
              onLoadDada: _onLoadDada
            );
          } else {
            return const HealthListSkeleton();
          }
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.router.push(
              FiltersRoute()
            );
          },
          icon: SvgPicture.asset('assets/icons/app_bar/filters_icon.svg')
        )
      ],
      appBarTitle: 'Заполярье',
    );
  }
}
