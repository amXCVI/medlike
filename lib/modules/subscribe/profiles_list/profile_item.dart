import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/UserBirthdayAndAge/user_birthday_and_age.dart';
import 'package:medlike/widgets/circre_user_avatar/circle_user_avatar.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.userProfile,
    this.isSelected = false,
  }) : super(key: key);

  final UserProfile userProfile;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleUserAvatar(
                    userAvatar: userProfile.avatar,
                    userId: userProfile.id,
                    userName: userProfile.firstName.toString(),
                    isSelected: isSelected,
                  ),
                  const SizedBox(width: 24.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userProfile.firstName.toString(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : AppColors.mainText),
                      ),
                      UserBirthdayAndAge(
                          userBirthday: userProfile.birthday as DateTime),
                    ],
                  ),
                ],
              ),
              isSelected
                  ? SvgPicture.asset('assets/icons/profile/checked_icon.svg')
                  : const Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
