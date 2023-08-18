import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/doctor_cached_avatar/doctor_avatar.dart';

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
        SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${doctorInfo.lastName ?? ''} ${(doctorInfo.firstName ?? ' ')[0]}. ${(doctorInfo.middleName ?? ' ')[0]}.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  doctorInfo.rateAsSotr != null
                      ? Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/appointments/raiting_gold_star.svg'),
                            const SizedBox(width: 6),
                            Text(doctorInfo.rateAsSotr.toString())
                          ],
                        )
                      : const SizedBox(),
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
            ],
          ),
        )
      ],
    );
  }
}