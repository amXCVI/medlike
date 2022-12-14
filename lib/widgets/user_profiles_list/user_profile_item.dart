import 'package:flutter/material.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/UserBirthdayAndAge/user_birthday_and_age.dart';
import 'package:medlike/widgets/user_profiles_list/user_avatar_with_uploader.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem({
    Key? key,
    required this.userProfileDate,
    required this.isSelectedItem,
    this.onLoadAvatar,
    this.isLoadingAvatar = false,
  }) : super(key: key);

  final UserProfile userProfileDate;
  final bool isSelectedItem;
  final void Function()? onLoadAvatar;
  final bool isLoadingAvatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserAvatarWithUploader(
              userProfileDate: userProfileDate,
              isSelectedItem: isSelectedItem,
              onLoadAvatar: onLoadAvatar,
              isLoadingAvatar: isLoadingAvatar,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${userProfileDate.firstName.toString()} ${userProfileDate.lastName?[0]}.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isSelectedItem
                            ? Theme.of(context).primaryColor
                            : AppColors.mainText),
                  ),
                  UserBirthdayAndAge(
                    userBirthday: userProfileDate.birthday as DateTime,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
