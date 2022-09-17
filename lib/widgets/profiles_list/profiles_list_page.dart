import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/profiles_list/profiles_list.dart';
import 'package:medlike/widgets/profiles_list/profiles_list_skeleton.dart';

class ProfilesListPage extends StatelessWidget {
  const ProfilesListPage({
    Key? key,
    required this.title,
    this.selectedId,
    required this.handleTapOnUserProfile
  }) : super(key: key);

  final String title;
  final String? selectedId;
  final Function(String, bool) handleTapOnUserProfile;

  @override
  Widget build(BuildContext context) {
    void _onRefreshData({bool isRefresh = false}) {
      context.read<UserCubit>().getUserProfiles(isRefresh);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: title,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.getUserProfileStatus ==
              GetUserProfilesStatusesList.success) {
            return ProfilesList(
              profilesList: state.userProfiles as List<UserProfile>,
              selectedUserId: selectedId,
              onRefreshData: _onRefreshData,
              handleTapOnUserProfile: handleTapOnUserProfile
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
