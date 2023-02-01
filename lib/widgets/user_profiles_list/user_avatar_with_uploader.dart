import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/widgets/circre_user_avatar/circle_user_avatar.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';

class UserAvatarWithUploader extends StatelessWidget {
  const UserAvatarWithUploader({
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
    return GestureDetector(
      // onTap: onLoadAvatar,
      child: Container(
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
        child: isLoadingAvatar
            ? const CircularLoader()
            : userProfileDate.avatar != null
                ? CircleUserAvatar(
                    radius: 40.0,
                    userAvatar: userProfileDate.avatar,
                    userId: userProfileDate.id,
                    userName: userProfileDate.firstName as String,
                  )
                : SvgPicture.asset(
                    'assets/icons/profile/profile_icon_without_photo.svg'),
      ),
    );
  }
}
