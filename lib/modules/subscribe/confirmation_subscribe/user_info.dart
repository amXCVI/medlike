import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';

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
            BlocBuilder<SubscribeCubit, SubscribeState>(
                builder: (context, subscribeState) {
              return RichText(
                text: WidgetSpan(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.circleBgFirst,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/appointments/clock.svg'),
                        const SizedBox(width: 8.0),
                        Text(DateFormat("HH:mm dd.MM.yyyy").format(
                            subscribeState.selectedTimetableCell!.time)),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(width: 8),
            RichText(
              text: WidgetSpan(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.circleBgFirst,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/appointments/profile.svg'),
                      const SizedBox(width: 8.0),
                      Text(
                          '${userProfile.firstName} ${userProfile.lastName?[0]}.'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
