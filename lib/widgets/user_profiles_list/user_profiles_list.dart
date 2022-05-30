import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/widgets/user_profiles_list/user_profile_item.dart';

class UserProfilesList extends StatelessWidget {
  const UserProfilesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserProfiles();

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
        color: Theme.of(context).backgroundColor,
      ),
      height: 76.0,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          switch (state.getUserProfileStatus) {
            case GetUserProfilesStatusesList.initial:
              return const Center(child: CircularProgressIndicator());
            case GetUserProfilesStatusesList.failure:
              return const Text('Error loading. Sorry');
            case GetUserProfilesStatusesList.success:
              return ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: state.userProfiles!
                      .map((item) => UserProfileItem(userProfileDate: item))
                      .toList());
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}