import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/data/models/notification_models/notification_models.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/tour_tooltip/tour_tooltip.dart';

class NotificationsWidgetView extends StatefulWidget {
  const NotificationsWidgetView({Key? key, this.clinic})
      : super(key: key);

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

              final title = notificationItem.title;
              final description = notificationItem.description;

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

                child: Slidable(
                  key: UniqueKey(),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {
                      context
                          .read<UserCubit>()
                          .updateNotificationStatus(notificationItem.id);
                    }),
                    children: [
                      SlidableAction(
                        flex: 2,
                        onPressed: (ctx) {},
                        backgroundColor: const Color(0xFFFE4A49),
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                  child: content
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
      required this.isLoading})
      : super(key: key);

  final NotificationModel notificationItem;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final dateWidget = Text(
        DateFormat('dd.MM.yyyy').format(notificationItem.eventDate),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.lightText));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dateWidget,
      ],
    );
  }
}
