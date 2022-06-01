import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/subscribe/profiles_list/profile_item.dart';

class ProfilesList extends StatelessWidget {
  const ProfilesList({
    Key? key,
    required this.profilesList,
    required this.selectedUserId,
  }) : super(key: key);

  final List<UserProfile> profilesList;
  final String selectedUserId;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: profilesList
            .map((item) => MaterialButton(
                  onPressed: () {
                    context.read<UserCubit>().setSelectedUserId(item.id);
                  },
                  child: ProfileItem(
                    userProfile: item,
                    isSelected: item.id == selectedUserId,
                  ),
                ))
            .toList());
  }
}
