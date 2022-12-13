import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/widgets/buttons/simple_button.dart';
import 'package:medlike/widgets/tour_tooltip/tour_tooltip.dart';

class AppointmentConfirmView extends StatefulWidget {
  const AppointmentConfirmView(
      {Key? key, required this.appointment, this.clinic})
      : super(key: key);

  final AppointmentModelWithTimeZoneOffset appointment;
  final ClinicModel? clinic;

  @override
  State<AppointmentConfirmView> createState() => _AppointmentConfirmViewState();
}

class _AppointmentConfirmViewState extends State<AppointmentConfirmView> {
  final _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      final state = context.read<TourCubit>().state;
      if (state.tourStatuses == TourStatuses.first &&
          state.isNotificationCloseShown != true) {
        onShow(context);
      }
    });
  }

  void onShow(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      context.read<TourCubit>().checkNotificationClose();
    });
  }

  @override
  Widget build(BuildContext context) {
    String getAppointmentsDesc(
        AppointmentModelWithTimeZoneOffset appointmentItem) {
      final date = getAppointmentTime(
        appointmentItem.appointmentDateTime,
        widget.clinic?.timeZoneOffset ?? 3,
        formatSting: 'dd.MM.yyyy, HH:mm',
      );

      if (appointmentItem.doctorInfo.lastName == null) {
        return '${appointmentItem.researches[0].name}, $date';
      }

      final lastName = appointmentItem.doctorInfo.lastName ?? ' ';
      final middleName = appointmentItem.doctorInfo.middleName ?? ' ';
      final firstName = appointmentItem.doctorInfo.firstName ?? ' ';
      final initials = '$lastName ${firstName[0]}. ${middleName[0]}.';

      return '$initials, ${appointmentItem.researches.isNotEmpty ? appointmentItem.researches[0].name : ''}, $date';
    }

    return BlocBuilder<TourCubit, TourState>(
      builder: (context, tourState) {
        return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
          final eventsCount = state.lastNotification?.eventsCount ?? 1;

          const title = 'Ожидает подтверждения';

          final description = getAppointmentsDesc(widget.appointment);

          final content = Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title.characters
                          .replaceAll(Characters(''), Characters('\u{200B}'))
                          .toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    BlocBuilder<TourCubit, TourState>(
                      buildWhen: (_, state) {
                        final tooltip = TourTooltip.of(context).create(
                            'Отслеживайте события по всем своим закрепленным пользователям',
                            onDismiss: () {
                          context.read<TourCubit>().checkNotification();
                        });

                        if (tourState.tourStatuses == TourStatuses.first &&
                            state.isNotificationShown != true) {
                          tooltip.show(
                              widgetKey: _key, offset: const Offset(24, 0));
                        }

                        return true;
                      },
                      builder: (ctx, state) {
                        return Container(
                          key: _key,
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 12.0),
                          decoration: const BoxDecoration(
                              color: AppColors.mainError,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          child: Text(
                            eventsCount.toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description.characters
                      .replaceAll(Characters(''), Characters('\u{200B}'))
                      .toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.lightText),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(height: 14),
                NotificationBottom(
                  appointment: widget.appointment,
                  isLoading: state.updatingNotificationStatusStatus ==
                      UpdatingNotificationStatusStatuses.loading,
                )
              ],
            ),
          );

          return Container(
              margin: const EdgeInsets.only(
                  top: 0, left: 16.0, bottom: 32.0, right: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
                color: Theme.of(context).backgroundColor,
              ),
              child: content);
        });
      },
    );
  }
}

class NotificationBottom extends StatelessWidget {
  const NotificationBottom(
      {Key? key, required this.appointment, required this.isLoading})
      : super(key: key);

  final AppointmentModelWithTimeZoneOffset appointment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: SimpleButton(
            isPrimary: true,
            labelText: 'Подтвердить',
            onTap: () {
              context.read<AppointmentsCubit>().confirmAppointment(
                  appointmentId: appointment.id,
                  userId: appointment.patientInfo.id ?? '');

              context.read<AppointmentsCubit>().getAppointmentsList(true);
            },
          )),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: SimpleButton(
                  labelText: 'Отменить',
                  onTap: () {
                    context.read<AppointmentsCubit>().deleteAppointment(
                        appointmentId: appointment.id,
                        userId: appointment.patientInfo.id ?? '');

                    context.read<AppointmentsCubit>().getAppointmentsList(true);
                  }))
        ],
      ),
    );
  }
}
