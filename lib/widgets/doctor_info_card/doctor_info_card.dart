import 'package:flutter/material.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/doctor_cached_avatar/doctor_avatar.dart';
import 'package:medlike/widgets/doctor_rating/doctor_rating.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({Key? key, required this.doctorInfo, this.review})
      : super(key: key);

  final DoctorInfoModel doctorInfo;
  final AppointmentReviewModel? review;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: doctorInfo.imageId != null
              ? DoctorCachedAvatar(
                  avatarId: doctorInfo.imageId!,
                  isThumbnail: true,
                )
              : CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.mainBrand[100],
                  child: Text((doctorInfo.lastName ?? ' ')[0].toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          )),
                ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '${doctorInfo.lastName ?? ''} ${(doctorInfo.firstName ?? ' ')[0]}. ${(doctorInfo.middleName ?? ' ')[0]}.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  DoctorRating(
                    rating: doctorInfo.rateAsSotr,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                doctorInfo.specialization ?? '',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: AppColors.lightText),
                maxLines: 3,
                softWrap: true,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        )
      ],
    );
  }
}
