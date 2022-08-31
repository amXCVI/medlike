import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/profiles_list/profiles_list_page.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        final userList = context.read<UserCubit>().state.userProfiles!;

        if(userList.length == 1) {
          context.read<DiaryCubit>().setUserId(userList.first.id);
          context.router.pushNamed(AppRoutes.health);
        }

        return ProfilesListPage(
          title: 'Показатели здоровья',
          selectedId: state.userId,
          handleTapOnUserProfile: (userId, isChild) {
            context.read<DiaryCubit>().setUserId(userId);
            context.router.pushNamed(AppRoutes.health);
          },
        );
      }
    );
  }
}
