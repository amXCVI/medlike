import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/profiles_list/profiles_list_page.dart';

class SubscribeProfilesListPage extends StatelessWidget {
  const SubscribeProfilesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTapOnUserProfile(userId) {
      context.read<UserCubit>().setSelectedUserId(userId);
      context.router.push(ClinicsListRoute(userId: userId));
    }

    void _onRefreshData({bool isRefresh = false}) {
      context.read<UserCubit>().getUserProfiles(isRefresh);
    }

    _onRefreshData();

    return ProfilesListPage(
      title: 'Запись на прием',
      routeName: 'SubscribeProfilesListRoute',
      handleTapOnUserProfile: (userId, isChild) => _handleTapOnUserProfile(userId)
    );
  }
}
