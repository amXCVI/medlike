import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/constants/notications_types.dart';
import 'package:medlike/constants/tour_tooltip.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/data/models/notification_models/notification_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/animation/animate_slidable.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/slidable/slidable_widget.dart';
import 'package:medlike/widgets/tour_tooltip/tour_tooltip.dart';

class NotificationsWidgetView extends StatefulWidget {
  const NotificationsWidgetView({Key? key, this.clinic}) : super(key: key);

  final ClinicModel? clinic;

  @override
  State<NotificationsWidgetView> createState() =>
      _NotificationsWidgetViewState();
}

class _NotificationsWidgetViewState extends State<NotificationsWidgetView> {
  final _key = GlobalKey();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void showTour() async => Future.delayed(const Duration(seconds: 0), () {
        TourCubit tc = context.read<TourCubit>();
        if (!(tc.state.tourChecked?[TourChecked.event] ?? false)) {
          TourTooltip.of(context).create(TourTooltips.resultEvent, _key,
              onDismiss: () {
            tc.checkItem(TourChecked.event);
          });
        }
      });

  // void showTour()  async => Future.delayed( const Duration(second: 1),){

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourState>(
        builder: (context, tourState) => tourState.fetched ?? false
            ? BlocBuilder<UserCubit, UserState>(
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    title.characters
                                        .replaceAll(Characters(''),
                                            Characters('\u{200B}'))
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (isLoading)
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  if (isLoading)
                                    Lottie.asset(
                                        'assets/animations/loader.json',
                                        width: 15,
                                        height: 15),
                                ],
                              ),

                              //#endregion
                              Container(
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
                              ),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        child: Material(
                          child: InkWell(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                switch (notificationItem.eventType) {
                                  case (NotificationsTypes.newMedcardEventPdf):
                                  case (NotificationsTypes.newMedcardEventJson):
                                    await context
                                        .read<MedcardCubit>()
                                        .downloadAndOpenPdfFileByUrl(
                                          fileUrl:
                                              '${ApiConstants.baseUrl}/api/v1.0/profile/mdoc/result/pdf?PrescId=${notificationItem.entityId}',
                                          fileName:
                                              notificationItem.description,
                                          fileId: notificationItem.entityId!,
                                        );
                                    break;
                                  case (NotificationsTypes.appointmentCanceled):
                                  case (NotificationsTypes
                                        .appointmentScheduled):
                                  case (NotificationsTypes
                                        .appointmentCompleted):
                                    context.router.push(AppointmentsRoute());
                                    break;
                                }

                                await context
                                    .read<UserCubit>()
                                    .updateNotificationStatus(
                                        notificationItem.id);
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: SlidableWidget(
                                  onDissmis: () {
                                    context
                                        .read<UserCubit>()
                                        .updateNotificationStatus(
                                            notificationItem.id);
                                  },
                                  dissmisText: "Удалить уведомление",
                                  childWidget: content,
                                  previewOnSutisfy: () async {
                                    TourCubit tc = context.read<TourCubit>();
                                    return !(tc.state.tourChecked?[
                                            TourChecked.eventSlidable] ??
                                        false);
                                  }(),
                                  afterPreviewAction: () {
                                    showTour();
                                    context
                                        .read<TourCubit>()
                                        .checkItem(TourChecked.eventSlidable);
                                  })),
                        ),
                      ),
                    );
                  }
                },
              )
            : const SizedBox());
  }
}

class NotificationBottom extends StatelessWidget {
  const NotificationBottom(
      {Key? key, required this.notificationItem, required this.isLoading})
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
