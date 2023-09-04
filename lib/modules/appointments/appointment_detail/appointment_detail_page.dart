import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/appointment_detail/research_detail_page.dart';
import 'package:medlike/modules/appointments/appointment_detail/review.dart';
import 'package:medlike/modules/appointments/feedback/visibility_list.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/apply_or_cancell_appointment/apply_or_cancell_appointment.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/next_appointment_time_chip/next_appointment_time_chip.dart';

import 'appointment_detail_action_button.dart';
import 'doctor_appointment_detail_info.dart';

@RoutePage()
class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({
    Key? key,
    required this.appointmentItem,
  }) : super(key: key);

  final AppointmentModelWithTimeZoneOffset appointmentItem;

  void handleChangeReview(
      BuildContext context, AppointmentReviewModel appointmentReview) {
    context.router.push(FeedbackRoute(
      appointmentId: appointmentItem.id,
      rating: appointmentReview.rate.toInt(),
      controllerCaption: appointmentReview.caption,
      controllerVisible:
          getLabelVisibilityByValue(appointmentReview.visibility),
      controllerMessage: appointmentReview.message,
      controllerEmail: appointmentReview.email ?? '',
    ));
  }

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
              isWithDoctor: state.selectedAppointment!.doctorInfo.id != null,
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
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NextAppointmentTimeChip(
                    appointmentDateTime: appointmentItem.appointmentDateTime,
                    timeZoneOffset: appointmentItem.timeZoneOffset,
                    isBottomLabel: true,
                    isFullDateTime: true,
                  ),
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
                        SvgPicture.asset('assets/icons/appointments/solid.svg'),
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
            DoctorAppointmentDetailInfo(
              doctorInfo: appointmentItem.doctorInfo,
              appointmentReview: appointmentItem.review,
            ),
            ResearchesAppointmentDetailInfo(
              appointmentItem: appointmentItem,
              serviceName: serviceName,
            ),
            BlocBuilder<AppointmentsCubit, AppointmentsState>(
                builder: (context, state) {
              AppointmentModelWithTimeZoneOffset currentAppointment = state
                  .appointmentsList!
                  .firstWhere((element) => element.id == appointmentItem.id);
              return Column(
                children: [
                  if (currentAppointment.status == 4)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: ApplyAndCancellAppointment(
                        appointmentId: appointmentItem.id,
                        userId: appointmentItem.patientInfo.id as String,
                      ),
                    ),
                  if (currentAppointment.review != null)
                    GestureDetector(
                      onTap: () => handleChangeReview(
                          context, currentAppointment.review!),
                      child: ReviewWidget(review: currentAppointment.review!),
                    ),
                ],
              );
            }),
          ],
        )));
  }
}
