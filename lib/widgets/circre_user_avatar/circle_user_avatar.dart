import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/api_constants.dart';

class CircleUserAvatar extends StatelessWidget {
  const CircleUserAvatar({
    Key? key,
    required this.userId,
    required this.userAvatar,
    this.isSelected = false,
    this.radius = 20.0,
    required this.userName,
  }) : super(key: key);

  final String userId;
  final userAvatar;
  final String userName;
  final bool isSelected;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).backgroundColor,
        radius: radius + 4,
        child: CircleAvatar(
            backgroundColor: Theme.of(context).backgroundColor,
            radius: radius + 2,
            child: userAvatar != null
                ? CircleAvatar(
                    radius: radius,
                    backgroundImage: NetworkImage(
                        '${ApiConstants.baseUrl}/avatar/xxxhdpi/$userId/$userAvatar'),
                  )
                : CircleAvatar(
                    radius: radius,
                    backgroundColor: AppColors.mainBrand[100],
                    child: Text(userName[0],
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        )),
                  )),
      ),
    );
  }
}
