import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/medcard/profiles_list/profiles_list.dart';
import 'package:medlike/modules/subscribe/profiles_list/profiles_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class MedcardProfilesListPage extends StatelessWidget {
  const MedcardProfilesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onRefreshData({bool isRefresh = false}) {
      context.read<UserCubit>().getUserProfiles(isRefresh);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: 'Медкарта',
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.getUserProfileStatus ==
              GetUserProfilesStatusesList.success) {
            return ProfilesList(
              profilesList: state.userProfiles as List<UserProfile>,
              selectedUserId: state.selectedUserId.toString(),
              onRefreshData: _onRefreshData,
            );
          } else if (state.getUserProfileStatus ==
              GetUserProfilesStatusesList.failure) {
            return const Text('');
          } else {
            return const ProfilesListSkeleton();
          }
        },
      ),
    );
  }
}
