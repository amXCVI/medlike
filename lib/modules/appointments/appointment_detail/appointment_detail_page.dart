import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/appointment_detail/review.dart';
import 'package:medlike/modules/appointments/appointment_item_recomendations.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/timestamp_converter.dart';
import 'package:medlike/utils/helpers/timestamp_helper.dart';
import 'package:medlike/widgets/apply_or_cancell_appointment/apply_or_cancell_appointment.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/doctor_info_card/doctor_info_card.dart';
import 'package:medlike/widgets/next_appointment_time_chip/next_appointment_time_chip.dart';
import 'package:medlike/widgets/recommendation_bottom_sheet/recommendations_bottom_sheet.dart';
import 'package:skeletons/skeletons.dart';

import 'appointment_detail_action_button.dart';

@RoutePage()
class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({
    Key? key,
    required this.appointmentItem,
  }) : super(key: key);

  final AppointmentModelWithTimeZoneOffset appointmentItem;

  @override
  Widget build(BuildContext context) {
    final title = appointmentItem.doctorInfo.specialization != null
        ? '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}'
        : CategoryTypes.getCategoryTypeByCategoryTypeId(
                appointmentItem.categoryType)
            .russianCategoryTypeName;

    final serviceName = appointmentItem.categoryType == 1 ||
            appointmentItem.categoryType == 0
        ? '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}'
        : '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.researches.map(
              (e) => e.name as String,
            ).join(', ')}';

    return DefaultScaffold(
        appBarTitle: title,
        actionButton: BlocBuilder<AppointmentsCubit, AppointmentsState>(
            builder: (context, state) {
          if (state.getAppointmentStatus == GetAppointmentStatuses.success) {
            return AppointmentDetailActionButton(
              appointmentId: state.selectedAppointment!.id,
              appointmentStatus: state.selectedAppointment!.status,
              isRated: state.selectedAppointment!.review != null,
            );
          } else {
            return const SizedBox();
          }
        }),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<AppointmentsCubit, AppointmentsState>(
                        builder: (context, state) {
                      if (state.getAppointmentStatus !=
                          GetAppointmentStatuses.success) {
                        return Expanded(
                          child: SkeletonParagraph(
                            style: SkeletonParagraphStyle(
                                lines: 1,
                                lineStyle: SkeletonLineStyle(
                                  randomLength: true,
                                  height: 20,
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ),
                        );
                      } else {
                        return NextAppointmentTimeChip(
                          appointmentDateTime: const TimestampConverter()
                              .fromJson(state
                                  .selectedAppointment!.appointmentDateTime),
                          timeZoneOffset: getTimezoneOffset(
                              state.selectedAppointment!.appointmentDateTime),
                          isBottomLabel: true,
                          isFullDateTime: true,
                        );
                      }
                    }),
                    const SizedBox(width: 8),
                    RichText(
                      text: WidgetSpan(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.circleBgFirst,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/appointments/profile.svg'),
                              const SizedBox(width: 8.0),
                              Text(appointmentItem.patientInfo.name.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              appointmentItem.clinicInfo.address != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 0, right: 16, bottom: 24, left: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/appointments/solid.svg'),
                          const SizedBox(width: 8.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text(
                                '${appointmentItem.clinicInfo.name!}, ${appointmentItem.researchPlace ?? ''} ${appointmentItem.clinicInfo.address!}',
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Услуга',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
                      builder: (context, state) {
                    if (state.getAppointmentStatus ==
                        GetAppointmentStatuses.success) {
                      return DoctorInfoCard(
                        doctorInfo: appointmentItem.doctorInfo,
                        review: state.selectedAppointment?.review,
                      );
                    } else {
                      return const SizedBox(height: 60);
                    }
                  })),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, right: 16, bottom: 24, left: 26),
                child: AppointmentItemRecommendations(
                  recommendations: appointmentItem.recommendations ?? '',
                  serviceName: serviceName,
                  maxLines: 3,
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
                        builder: (context) => RecommendationBottomSheet(
                            serviceName: serviceName,
                            recommendationsText:
                                appointmentItem.recommendations ?? ''))
                  },
                ),
              ),
              BlocBuilder<AppointmentsCubit, AppointmentsState>(
                  builder: (context, state) {
                if (state.getAppointmentStatus ==
                    GetAppointmentStatuses.success) {
                  return Column(
                    children: [
                      if (state.selectedAppointment!.status == 4)
                        ApplyAndCancellAppointment(
                          appointmentId: appointmentItem.id,
                          userId: appointmentItem.patientInfo.id as String,
                        ),
                      if (state.selectedAppointment!.review != null)
                        ReviewWidget(
                            review: state.selectedAppointment!.review!),
                    ],
                  );
                } else {
                  return SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 5,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 20,
                          borderRadius: BorderRadius.circular(8),
                        )),
                  );
                }
              }),
            ],
          ),
        ));
  }
}