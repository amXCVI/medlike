import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/data/models/notification_models/notification_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/widgets/buttons/simple_button.dart';
import 'package:medlike/widgets/tour_tooltip/tour_tooltip.dart';

class NotificationsWidgetView extends StatefulWidget {
  const NotificationsWidgetView({Key? key, this.appointment, this.clinic})
      : super(key: key);

  final AppointmentModel? appointment;
  final ClinicModel? clinic;

  @override
  State<NotificationsWidgetView> createState() =>
      _NotificationsWidgetViewState();
}

class _NotificationsWidgetViewState extends State<NotificationsWidgetView> {
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
    Slidable.of(context)!.openEndActionPane();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Slidable.of(context)!.close();
      context.read<TourCubit>().checkNotificationClose();
    });
  }

  @override
  Widget build(BuildContext context) {
    String getAppointmentsDesc(AppointmentModel appointmentItem) {
      final initials =
          '${appointmentItem.doctorInfo.lastName} ${appointmentItem.doctorInfo.firstName![0]}. ${appointmentItem.doctorInfo.middleName![0]}.';
      final date = getAppointmentTime(appointmentItem.appointmentDateTime,
          widget.clinic?.timeZoneOffset ?? 3,
          formatSting: 'dd.MM.yyyy, HH:mm');

      return '$initials, ${appointmentItem.researches[0].name}, $date';
    }

    return BlocBuilder<TourCubit, TourState>(
      builder: (context, state) {
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

              final title = widget.appointment != null
                  ? 'Ожидает подтверждения'
                  : notificationItem.title;
              final description = widget.appointment != null
                  ? getAppointmentsDesc(widget.appointment!)
                  : notificationItem.description;
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
                child: Slidable(
                  key: UniqueKey(),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 2,
                        onPressed: (ctx) {},
                        backgroundColor: const Color(0xFFFE4A49),
                        icon: Icons.delete,
                      ),
                    ],
                    dismissible: DismissiblePane(onDismissed: () {
                      context
                          .read<UserCubit>()
                          .updateNotificationStatus(notificationItem.id);
                    }),
                  ),
                  child: Padding(
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
                                  .replaceAll(
                                      Characters(''), Characters('\u{200B}'))
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

                                if (state.tourStatuses == TourStatuses.first &&
                                    state.isNotificationShown != true) {
                                  tooltip.show(
                                      widgetKey: _key,
                                      offset: const Offset(24, 0));
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24))),
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
                              .replaceAll(
                                  Characters(''), Characters('\u{200B}'))
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
                          appointment: widget.appointment,
                          isLoading: state.updatingNotificationStatusStatus ==
                              UpdatingNotificationStatusStatuses.loading,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}

class NotificationBottom extends StatelessWidget {
  const NotificationBottom(
      {Key? key,
      required this.notificationItem,
      this.appointment,
      required this.isLoading})
      : super(key: key);

  final NotificationModel notificationItem;
  final AppointmentModel? appointment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    void handleCleanLastNotification(String eventId) {
      context.read<UserCubit>().updateNotificationStatus(eventId);
    }

    final dateWidget = Text(
        DateFormat('dd.MM.yyyy').format(notificationItem.eventDate),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.lightText));

    if (appointment != null) {
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
                    appointmentId: appointment!.id,
                    userId: notificationItem.userId);

                context.read<AppointmentsCubit>().getAppointmentsList(true);
                handleCleanLastNotification(notificationItem.id);
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
                          appointmentId: appointment!.id,
                          userId: notificationItem.userId);

                      context
                          .read<AppointmentsCubit>()
                          .getAppointmentsList(true);
                      handleCleanLastNotification(notificationItem.id);
                    }))
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dateWidget,
      ],
    );
  }
}
