import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/profiles_list/profiles_list_page.dart';

class MedcardProfilesListPage extends StatelessWidget {
  const MedcardProfilesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onRefreshData({bool isRefresh = false}) {
      context.read<UserCubit>().getUserProfiles(isRefresh);
    }

    void _handleTapOnUserProfile(String userId, bool isChildren) {
      context.read<UserCubit>().setSelectedUserId(userId);

      if (isChildren) {
        context.router
            .push(MedcardRoute(userId: userId, isChildrenPage: isChildren));
      } else {
        context.router
            .replace(MedcardRoute(userId: userId, isChildrenPage: isChildren));
      }
    }

    _onRefreshData();

    return ProfilesListPage(
        title: 'Медкарта',
        routeName: AppRoutes.medcard,
        handleTapOnUserProfile: _handleTapOnUserProfile);
  }
}
