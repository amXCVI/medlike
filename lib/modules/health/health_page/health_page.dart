import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter_svg/svg.dart';
import 'package:medlike/modules/health/health_page/health_list.dart';
import 'package:medlike/modules/health/health_page/health_list_skeleton.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/helpers/date_helpers.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final dateFrom = DateUtils.firstDayOfWeek(date);
    final dateTo = DateUtils.lastDayOfWeek(date);

    void _onLoadDada(String grouping, {
      String? syn
    }) {
      context.read<DiaryCubit>().getDiaryCategoriesList(
        project: 'Zapolyarye', 
        platform: Platform.isAndroid ? 'Android' : 'IOS'
      );

      context.read<DiaryCubit>().getDiariesList(
        project: 'Zapolyarye', 
        platform: Platform.isAndroid ? 'Android' : 'IOS',
        grouping: grouping,
        //dateFrom: dateFrom,
        //dateTo: dateTo,
        syn: syn
      );
    }

    _onLoadDada('Hour');

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
              diariesCategoriesList: state.filteredDiariesCategoriesList!,
              diariesItems: state.diariesList ?? [],
              firstDate: dateFrom,
              lastDate: dateTo,
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
              const FiltersRoute()
            );
          },
          icon: SvgPicture.asset('assets/icons/app_bar/filters_icon.svg')
        )
      ],
      appBarTitle: 'Заполярье',
    );
  }
}
