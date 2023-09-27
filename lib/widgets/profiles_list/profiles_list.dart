import 'package:flutter/material.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/widgets/profiles_list/profile_item.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class ProfilesList extends StatefulWidget {
  const ProfilesList(
      {Key? key,
      required this.profilesList,
      this.selectedUserId,
      this.onRefreshData,
      required this.handleTapOnUserProfile})
      : super(key: key);

  final List<UserProfile> profilesList;
  final String? selectedUserId;
  final dynamic onRefreshData;
  final Function(String, bool) handleTapOnUserProfile;

  @override
  State<ProfilesList> createState() => _ProfilesListState();
}

class _ProfilesListState extends State<ProfilesList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// TODO: переделать в Stateless
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
                        widget.handleTapOnUserProfile(item.id, true);
                      },
                    ))
                .toList()),
      ),
    );
  }
}
