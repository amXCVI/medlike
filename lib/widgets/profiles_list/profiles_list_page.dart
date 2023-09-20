import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/subscribe/services_list/services_list_skeleton.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/profiles_list/profiles_list.dart';
import 'package:medlike/widgets/profiles_list/profiles_list_skeleton.dart';
import 'package:skeletons/skeletons.dart';

class ProfilesListPage extends StatefulWidget {
  const ProfilesListPage(
      {Key? key,
      required this.title,
      this.selectedId,
      required this.routeName,
      required this.handleTapOnUserProfile})
      : super(key: key);

  final String title;
  final String? selectedId;
  final String routeName;
  final Function(String, bool) handleTapOnUserProfile;

  @override
  State<ProfilesListPage> createState() => _ProfilesListPageState();
}

class _ProfilesListPageState extends State<ProfilesListPage> {
  void _onRefreshData({bool isRefresh = false}) async {
    //? TODO: нарушает принципы BLoC, переделать?
    final userList = await context.read<UserCubit>().getUserProfiles(isRefresh);
  }

  @override
  void initState() {
    _onRefreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: widget.title,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.getUserProfileStatus ==
              GetUserProfilesStatusesList.success) {
            if (state.userProfiles!.length == 1) {
              widget.handleTapOnUserProfile(state.userProfiles![0].id, false);
              return const SizedBox();
            }
            return ProfilesList(
              profilesList: state.userProfiles as List<UserProfile>,
              selectedUserId: widget.selectedId,
              onRefreshData: _onRefreshData,
              handleTapOnUserProfile: widget.handleTapOnUserProfile,
            );
          } else if (state.getUserProfileStatus ==
              GetUserProfilesStatusesList.failure) {
            return const Text('');
          } else {
            // return const ProfilesListSkeleton();
            return const Center(
              child: CircularLoader(
                radius: 50,
              ),
            );
          }
        },
      ),
    );
  }
}
