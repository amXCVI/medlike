import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class DoctorCachedAvatar extends StatelessWidget {
  const DoctorCachedAvatar(
      {Key? key,
      required this.avatarId,
      required this.isThumbnail,
      this.radius = 20})
      : super(key: key);

  final String avatarId;
  final bool isThumbnail;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        imageUrl:
            '${ApiConstants.baseUrl}/api/v1.0/doctors/image/$avatarId?isThumbnail=$isThumbnail',
        httpHeaders: {
          'Authorization':
              'Bearer ${UserSecureStorage.getField(AppConstants.accessToken)}'
        },
        width: radius * 2,
        height: radius * 2,
      ),
    );
  }
}
