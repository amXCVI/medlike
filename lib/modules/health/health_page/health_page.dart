import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/profiles_list/profiles_list_page.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userIds = context.read<UserCubit>().state.userProfiles?.map((e) => e.id).toList();

    void _loadData(String grouping) {
      context.read<DiaryCubit>().getDiaryCategoriesList(
        userIds: userIds ?? []
      );

      context.read<DiaryCubit>().getDiariesList(grouping: 'None');
    }

    void _handleTapOnUserProfile(String userId, bool isChildren) {
      context.read<DiaryCubit>().setUserId(userId);
      _loadData('None');
      if (isChildren) {
        context.router.push(CardsRoute(isChildrenPage: true));
      } else {
        context.router.replace(CardsRoute(isChildrenPage: false));
      }
    }

    return BlocBuilder<DiaryCubit, DiaryState>(builder: (context, state) {
      return WillPopScope(
        onWillPop: () async {
          context.router.replaceAll([const MainRoute()]);
          return false;
        },
        child: ProfilesListPage(
          title: 'Показатели здоровья',
          routeName: AppRoutes.healthProfilesMain,
          handleTapOnUserProfile: _handleTapOnUserProfile,
        ),
      );
    });
  }
}
