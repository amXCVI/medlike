import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/widgets/user_profiles_list/user_profile_item.dart';
import 'package:medlike/widgets/user_profiles_web/user_profiles_list_popup.dart';

class UserProfilesWeb extends StatefulWidget {
  const UserProfilesWeb({Key? key}) : super(key: key);

  @override
  State<UserProfilesWeb> createState() => _UserProfilesWebState();
}

class _UserProfilesWebState extends State<UserProfilesWeb> {
  bool isOpenedProfilesPopup = false;

  void onRefreshData(BuildContext context, {bool isRefresh = false}) {
    context.read<UserCubit>().getUserProfiles(isRefresh);
  }

  void handleTapOpenProfilesBlock() {
    setState(() {
      isOpenedProfilesPopup = !isOpenedProfilesPopup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, userState) {
      UserProfile? selectedUser = context
          .read<UserCubit>()
          .getUserProfileById(userState.selectedUserId ?? '');

      if (selectedUser == null) {
        // TODO Нужно разобраться, как сделать правильно
        // TODO выбор пользователя скорее всего придется переделывать
        onRefreshData(context);
        return const SizedBox();
      }

      return Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserProfileItem(
              userProfileDate: selectedUser,
              isSelectedItem: false,
            ),
            UserProfilesListPopup(
              userProfilesList: userState.userProfiles ?? [],
              selectedUserProfileId: selectedUser.id,
            ),
          ],
        ),
      );
    });
  }
}
