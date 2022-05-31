import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/utils/api/api_constants.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem({Key? key, required this.userProfileDate})
      : super(key: key);

  final UserProfile userProfileDate;

  String _getAgeByBirthday(DateTime birthday) {
    final DateTime currentDate = DateTime.now();
    final differentYears = currentDate.year - birthday.year;
    int lastDigit = differentYears;

    lastDigit %= 100;
    if (lastDigit >= 5 && lastDigit <= 20) {
      return '$differentYears лет';
    }
    lastDigit %= 10;
    if (lastDigit == 1) {
      return '$differentYears год';
    }
    if (lastDigit >= 2 && lastDigit <= 4) {
      return '$differentYears года';
    }
    return '$differentYears лет';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            userProfileDate.avatar != null
                ? CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        '${ApiConstants.baseUrl}/avatar/xxxhdpi/${userProfileDate.id}/${userProfileDate.avatar}'),
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
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${DateFormat('dd.MM.yyyy').format(userProfileDate.birthday as DateTime)} (${_getAgeByBirthday(userProfileDate.birthday as DateTime)})',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).highlightColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
