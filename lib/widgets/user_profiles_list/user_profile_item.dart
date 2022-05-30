import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/utils/api/api_constants.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem({Key? key, required this.userProfileDate})
      : super(key: key);

  final UserProfile userProfileDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                  '${ApiConstants.baseUrl}/avatar/xxxhdpi/${userProfileDate.id}/${userProfileDate.avatar}'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${userProfileDate.firstName.toString()} ${userProfileDate.lastName?[0]}.'),
                Text(DateFormat('dd.MM.yyyy')
                    .format(userProfileDate.birthday as DateTime)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
