import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/UserBirthdayAndAge/user_birthday_and_age.dart';
import 'package:medlike/widgets/circre_user_avatar/circle_user_avatar.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem(
      {Key? key, required this.userProfileDate, required this.isSelectedItem})
      : super(key: key);

  final UserProfile userProfileDate;
  final bool isSelectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelectedItem
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).backgroundColor,
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(44.0))),
              child: userProfileDate.avatar != null
                  ? CircleUserAvatar(
                      radius: 40.0,
                      userAvatar: userProfileDate.avatar,
                      userId: userProfileDate.id,
                      userName: userProfileDate.firstName as String,
                    )
                  : SvgPicture.asset(
                      'assets/icons/profile/profile_icon_without_photo.svg'),
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
