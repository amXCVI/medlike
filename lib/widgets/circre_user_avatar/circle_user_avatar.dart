import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CircleUserAvatar extends StatelessWidget {
  const CircleUserAvatar({
    Key? key,
    required this.userId,
    required this.userAvatar,
    this.isSelected = false,
    this.radius = 20.0,
    this.review = false,
    required this.userName,
  }) : super(key: key);

  final String userId;
  final bool review;
  final String? userAvatar;
  final String userName;
  final bool isSelected;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircleAvatar(
            backgroundColor: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.background,
            radius: radius + 4,
            child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
                radius: radius + 2,
                child: userAvatar != null
                    ? CircleAvatar(
                        radius: radius,
                        backgroundImage: NetworkImage(
                          '${ApiConstants.baseUrl}/avatar/xxxhdpi/$userId/$userAvatar',
                        ),
                        onBackgroundImageError: (exception, stackTrace) {
                          Sentry.captureException(exception,
                              stackTrace: stackTrace);
                        },
                      )
                    : !review
                        ? CircleAvatar(
                            radius: radius,
                            backgroundColor: Colors.transparent,
                            child: Text(userName[0].toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500)))
                        : CircleAvatar(
                            radius: radius,
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                                "assets/icons/appointments/profile.svg"),
                          ))));
  }
}
