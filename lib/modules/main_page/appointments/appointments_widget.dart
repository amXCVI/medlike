import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/main_page/appointments/appointment_item_card.dart';
import 'package:medlike/modules/main_page/appointments/appointments_widget_skeleton.dart';
import 'package:medlike/modules/main_page/appointments/not_found_appointment.dart';
import 'package:medlike/navigation/router.gr.dart';

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
                              .map((appointmentItem) => AppointmentItemCard(
                                    appointmentItem: appointmentItem,
                                    handleTapOnAppointment:
                                        handleTapOnAppointment,
                                  ))
                              .toList()
                              .reversed,
                        ],
                        options: CarouselOptions(
                          height: 176,
                          viewportFraction: 0.93,
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
