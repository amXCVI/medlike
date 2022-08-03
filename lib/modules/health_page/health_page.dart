import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medlike/modules/health_page/health_list.dart';
import 'package:medlike/modules/health_page/health_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onLoadDada() {
      context.read<DiaryCubit>().getDiaryCategoriesList(
        project: 'Zapolyarye', 
        platform: Platform.isAndroid ? 'Android' : 'IOS'
      );
    }

    _onLoadDada();

    return DefaultScaffold(
      child: BlocBuilder<DiaryCubit, DiaryState>(
        builder: (context, state) {
          if (state.getDiaryCategoriesStatuses == GetDiaryCategoriesStatuses.failed) {
            return const Text('Error');
          } else if (state.getDiaryCategoriesStatuses ==
              GetDiaryCategoriesStatuses.success) {
            return HealthList(
              diariesCategoriesList: state.diariesCategoriesList!
            );
          } else {
            return const HealthListSkeleton();
          }
        },
      ),
      appBarTitle: 'Заполярье',
    );
  }
}
