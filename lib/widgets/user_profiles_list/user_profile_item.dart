import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/widgets/UserBirthdayAndAge/user_birthday_and_age.dart';
import 'package:medlike/widgets/circre_user_avatar/circle_user_avatar.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem({Key? key, required this.userProfileDate})
      : super(key: key);

  final UserProfile userProfileDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            userProfileDate.avatar != null
                ? CircleUserAvatar(
                    radius: 40.0,
                    userAvatar: userProfileDate.avatar,
                    userId: userProfileDate.id,
                    userName: userProfileDate.firstName as String,
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: SvgPicture.asset(
                        'assets/icons/profile/profile_icon_without_photo.svg'),
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${userProfileDate.firstName.toString()} ${userProfileDate.lastName?[0]}.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                UserBirthdayAndAge(
                  userBirthday: userProfileDate.birthday as DateTime,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
