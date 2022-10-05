import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/profiles_list/profiles_list_page.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _loadData(String grouping) {
      context.read<DiaryCubit>().getDiaryCategoriesList();

      context.read<DiaryCubit>().getDiariesList(
          grouping: 'None');
    }

    void _handleTapOnUserProfile(String userId, bool isChildren) {
      context.read<DiaryCubit>().setUserId(userId);
      _loadData('None');
      if (isChildren) {
        context.router.pushNamed(AppRoutes.health);
      } else {
        context.router.replaceNamed(AppRoutes.health);
      }
    }

    return BlocBuilder<DiaryCubit, DiaryState>(builder: (context, state) {
      return ProfilesListPage(
        title: 'Показатели здоровья',
        routeName: AppRoutes.health,
        handleTapOnUserProfile: _handleTapOnUserProfile,
      );
    });
  }
}
