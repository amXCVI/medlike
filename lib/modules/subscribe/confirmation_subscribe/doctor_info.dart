import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/appointment_recommendations.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/doctor_subtitle_helper.dart';
import 'package:medlike/widgets/doctor_info_card/doctor_info_card.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
      if (state.selectedDoctor == null || state.selectedDoctor!.id == null) {
        return const SizedBox();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Врач',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          DoctorInfoCard(
              doctorInfo: DoctorInfoModel(
            id: state.selectedDoctor?.id,
            firstName: state.selectedDoctor?.firstName,
            middleName: state.selectedDoctor?.middleName,
            lastName: state.selectedDoctor?.lastName,
            specializationId: state.selectedDoctor?.specializationId,
            specialization: DoctorSubtitleHelper.getSubtitle(
              specialization: state.selectedDoctor?.specialization ?? '',
              comment: state.selectedDoctor?.comment,
              experience: state.selectedDoctor?.experience,
            ),
            shortInfo: state.selectedDoctor?.shortinfo,
            rateAsSotr: state.selectedDoctor?.rateAsSotr,
            rateAsUser: state.selectedDoctor?.rateAsUser,
            imageId: state.selectedDoctor?.imageId,
          )),
          const SizedBox(height: 16),
          //#region Service offered by doctor

          Text(
            'Услуга',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          state.appointmentInfoData != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.mainBrand[100],
                      child: Text(
                          state.appointmentInfoData!.serviceName[0]
                              .toUpperCase(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  )),
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                        softWrap: true,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: state.appointmentInfoData!.serviceName,
                                style: Theme.of(context).textTheme.titleMedium),
                            // ...appointmentItem.researches.map((e) => TextSpan(
                            //     text: ', ${e.name}',
                            //     style: Theme.of(context).textTheme.titleMedium))
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          //# Service offered by doctor
          state.appointmentInfoData != null &&
                  state.appointmentInfoData!.recommendations != null &&
                  state.appointmentInfoData!.recommendations.isNotEmpty &&
                  (state.selectedResearchesIds == null ||
                      state.selectedResearchesIds!.isEmpty)
              ? AppointmentRecommendations(
                  recommendations: state
                      .appointmentInfoData!.recommendations[0].recommendation,
                  serviceName:
                      state.appointmentInfoData!.recommendations[0].serviceName)
              : const SizedBox(),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
