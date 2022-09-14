import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/main_page/appointments/appointments_widget_skeleton.dart';
import 'package:medlike/modules/main_page/appointments/not_found_appointment.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';

class AppointmentsWidget extends StatelessWidget {
  const AppointmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _onLoadDada({bool isRefresh = true}) async {
      context.read<AppointmentsCubit>().getAppointmentsList(isRefresh);
    }

    void handleTapOnAppointment(DateTime date) {
      context.read<AppointmentsCubit>().setSelectedDate(date);
      context.router.push(AppointmentsRoute());
    }

    _onLoadDada(isRefresh: true);

    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Предстоящие приемы',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            state.getAppointmentsStatus == GetAppointmentsStatuses.loading
                ? const AppointmentsWidgetSkeleton()
                : state.appointmentsList == null ||
                        state.appointmentsList!.isEmpty ||
                        state.appointmentsList!
                            .where((item) => AppointmentStatuses
                                .cancellableStatusIds
                                .contains(item.status))
                            .isEmpty
                    ? GestureDetector(
                        onTap: () {
                          handleTapOnAppointment(DateTime.now());
                        },
                        child: const NotFoundAppointment())
                    : CarouselSlider(
                        items: [
                          ...state.appointmentsList!
                              .where((item) => AppointmentStatuses
                                  .cancellableStatusIds
                                  .contains(item.status))
                              .map((appointmentItem) => GestureDetector(
                                    onTap: () {
                                      handleTapOnAppointment(
                                          appointmentItem.appointmentDateTime);
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        margin: const EdgeInsets.only(
                                            left: 4,
                                            right: 4,
                                            top: 16,
                                            bottom: 32),
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 20,
                                              offset: Offset(0, 8),
                                            ),
                                          ],
                                          color:
                                              Theme.of(context).backgroundColor,
                                        ),
                                        child: Column(
                                          children: [
                                            appointmentItem.categoryType == 1 ||
                                                    appointmentItem
                                                            .categoryType ==
                                                        0
                                                ? Text(
                                                    '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}'
                                                        .characters
                                                        .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                                '\u{200B}'))
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )
                                                : Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        ...appointmentItem
                                                            .researches
                                                            .map((e) =>
                                                                WidgetSpan(
                                                                    child: Text(
                                                                  e.name
                                                                      .characters
                                                                      .replaceAll(
                                                                          Characters(
                                                                              ''),
                                                                          Characters(
                                                                              '\u{200B}'))
                                                                      .toString(),
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                )))
                                                      ],
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                            const SizedBox(height: 6),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 15,
                                                  child: Text(appointmentItem
                                                      .doctorInfo.lastName![0]),
                                                  backgroundColor:
                                                      AppColors.mainBrand[100],
                                                ),
                                                const SizedBox(width: 8.0),
                                                Text(
                                                  '${appointmentItem.doctorInfo.lastName} ${appointmentItem.doctorInfo.firstName![0]}. ${appointmentItem.doctorInfo.middleName![0]}.',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          color: AppColors
                                                              .lightText),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                RichText(
                                                  text: WidgetSpan(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .circleBgFirst,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/icons/appointments/clock.svg'),
                                                          const SizedBox(
                                                              width: 8.0),
                                                          Text(DateFormat(
                                                                  'dd.MM.yy, HH:mm')
                                                              .format(dateTimeToUTC(
                                                                  appointmentItem
                                                                      .appointmentDateTime,
                                                                  int.parse(DateTime
                                                                          .now()
                                                                      .timeZoneOffset
                                                                      .inHours
                                                                      .toString())))),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8.0),
                                                RichText(
                                                  text: WidgetSpan(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .circleBgFirst,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/icons/appointments/profile.svg'),
                                                          const SizedBox(
                                                              width: 8.0),
                                                          Text(
                                                            appointmentItem
                                                                .patientInfo
                                                                .name
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ))
                              .toList()
                              .reversed,
                        ],
                        options: CarouselOptions(
                          viewportFraction: 0.93,
                          aspectRatio: 2.0,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: false,
                          enlargeCenterPage: false,
                        ),
                      )
          ],
        );
      },
    );
  }
}
