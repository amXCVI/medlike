import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/subscribe/profiles_list/profile_item.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class ProfilesList extends StatefulWidget {
  const ProfilesList({
    Key? key,
    required this.profilesList,
    required this.selectedUserId,
    this.onRefreshData,
  }) : super(key: key);

  final List<UserProfile> profilesList;
  final String selectedUserId;
  final dynamic onRefreshData;

  @override
  State<ProfilesList> createState() => _ProfilesListState();
}

class _ProfilesListState extends State<ProfilesList> {
  void _handleTapOnUserProfile(userId) {
    context.read<UserCubit>().setSelectedUserId(userId);
    context.router.push(ClinicsListRoute(userId: userId));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => widget.onRefreshData(isRefresh: true),
      child: DefaultScrollbar(
        child: ListView(
            shrinkWrap: true,
            children: widget.profilesList
                .map((item) => ProfileItem(
                      userProfile: item,
                      isSelected: item.id == widget.selectedUserId,
                      onTap: () {
                        _handleTapOnUserProfile(item.id);
                      },
                    ))
                .toList()),
      ),
    );
  }
}
