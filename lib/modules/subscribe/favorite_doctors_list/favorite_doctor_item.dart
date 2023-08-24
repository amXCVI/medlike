import 'package:flutter/material.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/utils/helpers/doctor_subtitle_helper.dart';
import 'package:medlike/widgets/doctor_cached_avatar/doctor_avatar.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class FavoriteDoctorItem extends StatelessWidget {
  const FavoriteDoctorItem(
      {Key? key, required this.doctorItem, required this.onTap})
      : super(key: key);

  final FavoriteDoctor doctorItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    String subtitle = DoctorSubtitleHelper.getSubtitle(
      specialization: doctorItem.specialization,
      comment: doctorItem.comment,
      experience: doctorItem.experience,
    );

    return SubscribeRowItem(
      title:
          '${doctorItem.lastName.toString()} ${doctorItem.firstName[0]}. ${doctorItem.middleName[0]}.',
      subtitle:
          '${CategoryTypes.getCategoryTypeByCategoryTypeId(doctorItem.categoryType).russianCategoryTypeName} | $subtitle',
      onTap: onTap,
      rating: doctorItem.rateAsUser,
      isFirstSymbolForIcon: doctorItem.imageId == null,
      customIcon: DoctorCachedAvatar(
        avatarId: doctorItem.imageId!,
        isThumbnail: true,
      ),
    );
  }
}
