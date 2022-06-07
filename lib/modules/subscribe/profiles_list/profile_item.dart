import 'package:flutter/material.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/widgets/UserBirthdayAndAge/user_birthday_and_age.dart';
import 'package:medlike/widgets/circre_user_avatar/circle_user_avatar.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.userProfile,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final UserProfile userProfile;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(
      title: userProfile.firstName.toString(),
      customIcon: CircleUserAvatar(
        userAvatar: userProfile.avatar,
        userId: userProfile.id,
        userName: userProfile.firstName.toString(),
        isSelected: isSelected,
      ),
      isFirstSymbolForIcon: false,
      subtitle: getAgeByBirthday(userProfile.birthday as DateTime),
      isRightArrow: false,
      isSelected: isSelected,
      onTap: onTap,
    );
  }
}
