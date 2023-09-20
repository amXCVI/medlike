import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/doctor_subtitle_helper.dart';

class DoctorInfoHeader extends StatelessWidget {
  const DoctorInfoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
      String doctorName = state.selectedDoctor != null
          ? '${state.selectedDoctor!.lastName} ${state.selectedDoctor!.firstName} ${state.selectedDoctor!.middleName}'
          : '';
      num doctorRating = state.selectedDoctor != null
          ? state.selectedDoctor?.rateAsSotr ?? 0
          : 0;
      String? doctorDescription = state.selectedDoctor != null
          ? DoctorSubtitleHelper.getSubtitle(
              specialization: state.selectedDoctor?.specialization ?? '',
              comment: state.selectedDoctor?.comment,
              experience: state.selectedDoctor?.experience,
            )
          : '';

      return Padding(
        padding: const EdgeInsets.only(left: 16, top: 0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    doctorName,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500, height: 1.2),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                doctorRating > 0
                    ? Row(
                        children: [
                          SvgPicture.asset(
                              'assets/icons/appointments/raiting_gold_star.svg'),
                          const SizedBox(width: 6),
                          Text(doctorRating.toStringAsFixed(1)),
                          const SizedBox(width: 4),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(height: 4),
            doctorDescription != null && doctorDescription.isNotEmpty
                ? Text(
                    doctorDescription,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColors.lightText),
                  )
                : const SizedBox(),
          ],
        ),
      );
    });
  }
}
