import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';

class FavoriteDoctorButton extends StatelessWidget {
  const FavoriteDoctorButton({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.doctorId,
    required this.categoryTypeId,
    required this.isFavorite,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;
  final String doctorId;
  final int categoryTypeId;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    void _handleTapOnFavoriteDoctor() {
      String categoryType =
          CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
              .categoryType;

      if (isFavorite) {
        context.read<SubscribeCubit>().deleteDoctorFromFavoritesList(
            userId: userId, doctorId: doctorId, categoryType: categoryType);
      } else {
        context.read<SubscribeCubit>().setDoctorToFavoritesList(
              userId: userId,
              buildingId: buildingId,
              clinicId: clinicId,
              doctorId: doctorId,
              categoryType: categoryType,
            );
      }
    }

    return IconButton(
        onPressed: _handleTapOnFavoriteDoctor,
        icon: SvgPicture.asset(isFavorite
            ? 'assets/icons/app_bar/ic_heart_favorite_filled.svg'
            : 'assets/icons/app_bar/ic_heart_favorite_outlined.svg'));
  }
}
