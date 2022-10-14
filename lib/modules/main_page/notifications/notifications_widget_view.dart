import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/data/models/notification_models/notification_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/widgets/buttons/simple_button.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/tour_tooltip/tour_tooltip.dart';

class NotificationsWidgetView extends StatelessWidget {
  NotificationsWidgetView({
    Key? key,
    this.appointment,
    this.clinic
  }) : super(key: key);

  final _key = GlobalKey();
  final AppointmentModel? appointment;
  final ClinicModel? clinic;

  @override
  Widget build(BuildContext context) {
    String getAppointmentsDesc(AppointmentModel appointmentItem) {
      final initials = '${appointmentItem.doctorInfo.lastName} ${appointmentItem.doctorInfo.firstName![0]}. ${appointmentItem.doctorInfo.middleName![0]}.';
      final date = getAppointmentTime(
        appointmentItem.appointmentDateTime, 
        clinic?.timeZoneOffset ?? 3,
        formatSting: 'dd.MM.yyyy, HH:mm' 
      );

      return '$initials, ${appointmentItem.researches[0].name}, $date';
    }

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.isLastNotificationShow == null ||
          state.isLastNotificationShow == false ||
            state.getLastNotReadEventStatus !=
                GetLastNotReadEventStatuses.success) {
          return const SizedBox();
        } else {
          NotificationModel notificationItem =
              state.lastNotification as NotificationModel;

          final title = appointment != null ? 'Ожидает подтверждения' : notificationItem.title;
          final description = appointment != null ? getAppointmentsDesc(appointment!) : notificationItem.description;
          return Container(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16.0, bottom: 4.0, right: 16.0),
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
                          }
                        );

                        if(state.tourStatuses == TourStatuses.first
                          && state.isNotificationShown != true) {
                          tooltip.show(
                            widgetKey: _key,
                            offset: const Offset(24, 0)
                          );
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
                            (notificationItem.eventsCount).toString(),
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
                  notificationItem: notificationItem,
                  appointment: appointment,
                  isLoading: state.updatingNotificationStatusStatus ==
                    UpdatingNotificationStatusStatuses.loading,
                )
              ],
            ),
          );
        }
      },
    );
  }
}

class NotificationBottom extends StatelessWidget {
  const NotificationBottom({
    Key? key,
    required this.notificationItem,
    this.appointment,
    required this.isLoading
  }) : super(key: key);

  final NotificationModel notificationItem;
  final AppointmentModel? appointment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    void handleCleanLastNotification(String eventId) {
      context.read<UserCubit>().updateNotificationStatus(eventId).then(
          (value) => context.read<UserCubit>().getLastNotReadNotification());
    }

    final dateWidget = Text(
      DateFormat('dd.MM.yyyy')
          .format(notificationItem.eventDate),
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: AppColors.lightText)
    );

    if(appointment != null) {
      return 
        Padding(
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
                      appointmentId: appointment!.id, 
                      userId: notificationItem.userId
                    );

                    context.read<AppointmentsCubit>().getAppointmentsList(true);
                    handleCleanLastNotification(notificationItem.id);
                  },
                )
              ),
              const SizedBox(width: 12,),
              Expanded(
                child: SimpleButton(
                  labelText: 'Отменить', 
                  onTap: () {
                    context.read<AppointmentsCubit>().deleteAppointment(
                      appointmentId: appointment!.id, 
                      userId: notificationItem.userId
                    );

                    context.read<AppointmentsCubit>().getAppointmentsList(true);
                    handleCleanLastNotification(notificationItem.id);
                  }
                )
              )
            ],
          ),
        );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dateWidget,
          isLoading
            ? const CircularLoader(radius: 10)
            : TextButton(
                onPressed: () {
                  handleCleanLastNotification(notificationItem.id);
                },
                child: Text('ОЧИСТИТЬ'.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      height: 1,
                    )
                  )
                )
      ],
    );
  }
}