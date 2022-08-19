import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/UserBirthdayAndAge/user_birthday_and_age.dart';
import 'package:medlike/widgets/circre_user_avatar/circle_user_avatar.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        UserProfile userProfile =
            state.userProfiles!.firstWhere((element) => element.id == userId);
        return Row(
          children: [
            CircleUserAvatar(
              userAvatar: userProfile.avatar,
              userId: userProfile.id,
              userName: userProfile.firstName.toString(),
              isSelected: false,
            ),
            const SizedBox(width: 24),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${userProfile.firstName} ${userProfile.lastName?[0]}.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.mainText),
                ),
                const SizedBox(height: 4),
                Text(
                  getAgeByBirthday(userProfile.birthday as DateTime),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.lightText),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
