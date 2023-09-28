import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/appointment_item_recomendations.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/recommendation_bottom_sheet/recommendations_bottom_sheet.dart';

class ResearchesAppointmentDetailInfo extends StatelessWidget {
  const ResearchesAppointmentDetailInfo(
      {Key? key, required this.appointmentItem, required this.serviceName})
      : super(key: key);

  final AppointmentModelWithTimeZoneOffset appointmentItem;
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appointmentItem.researches.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Услуга',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              )
            : const SizedBox(),
        appointmentItem.researches.isNotEmpty
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.mainBrand[100],
                      child: Text(
                          appointmentItem.researches[0].name![0].toUpperCase(),
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
                                text: CategoryTypes
                                        .getCategoryTypeByCategoryTypeId(
                                            appointmentItem.categoryType)
                                    .russianCategoryTypeName,
                                style: Theme.of(context).textTheme.titleMedium),
                            ...appointmentItem.researches.map((e) => TextSpan(
                                text: ', ${e.name}',
                                style: Theme.of(context).textTheme.titleMedium))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        Padding(
          padding:
              const EdgeInsets.only(top: 0, right: 16, bottom: 24, left: 26),
          child: AppointmentItemRecommendations(
            recommendations: appointmentItem.recommendations ?? '',
            serviceName: serviceName,
            maxLines: 3,
            withOpenerArrow: true,
            onTap: () => {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  context: context,
                  isScrollControlled: true,
                  builder: (context) =>
                      BlocBuilder<AppointmentsCubit, AppointmentsState>(
                          builder: (context, state) {
                        if (state.getAppointmentStatus ==
                            GetAppointmentStatuses.success) {
                          return RecommendationBottomSheet(
                              serviceName: serviceName,
                              recommendationsText:
                                  state.selectedAppointment!.recommendations ??
                                      '');
                        } else {
                          return const SizedBox(height: 60);
                        }
                      }))
            },
          ),
        ),
      ],
    );
  }
}
