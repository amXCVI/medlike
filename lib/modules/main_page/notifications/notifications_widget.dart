import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/notification_models/notification_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleCleanLastNotification(String eventId) {
      context.read<UserCubit>().updateNotificationStatus(eventId).then(
          (value) => context.read<UserCubit>().getLastNotReadNotification());
    }

    context.read<UserCubit>().getLastNotReadNotification();

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.lastNotification == null ||
            state.getLastNotReadEventStatus !=
                GetLastNotReadEventStatuses.success) {
          return const SizedBox();
        } else {
          NotificationModel notificationItem =
              state.lastNotification as NotificationModel;
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
                      notificationItem.title.characters
                          .replaceAll(Characters(''), Characters('\u{200B}'))
                          .toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 12.0),
                      decoration: const BoxDecoration(
                          color: AppColors.mainError,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Text(
                        (notificationItem.eventsCount).toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  notificationItem.description.characters
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd.MM.yyyy')
                          .format(notificationItem.eventDate),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.lightText),
                    ),
                    state.updatingNotificationStatusStatus ==
                            UpdatingNotificationStatusStatuses.loading
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
                                )))
                  ],
                )
              ],
            ),
          );
        }
      },
    );
  }
}
