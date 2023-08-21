part of 'tour_cubit.dart';

enum TourStatuses { first, late }

class TourState {
  final TourStatuses? tourStatuses;
  final bool? isNotificationShown;
  final bool? isFavoriteShown;
  final bool? isAppointmentShown;
  final bool? isSupportShown;
  final bool? isCabinetsInfoPlaceShow;
  final bool? isNotificationCloseShown;
  final bool? isFileShown;

  TourState(
      {this.tourStatuses,
      this.isNotificationShown,
      this.isFavoriteShown,
      this.isAppointmentShown,
      this.isSupportShown,
      this.isCabinetsInfoPlaceShow,
      this.isNotificationCloseShown,
      this.isFileShown});

  TourState copyWith(
      {TourStatuses? tourStatuses,
      bool? isNotificationShown,
      bool? isFavoriteShown,
      bool? isAppointmentShown,
      bool? isSupportShown,
      bool? isCabinetsInfoPlaceShow,
      bool? isNotificationCloseShown,
      bool? isFileShown}) {
    return TourState(
      tourStatuses: tourStatuses ?? this.tourStatuses,
      isNotificationShown: isNotificationShown ?? this.isNotificationShown,
      isFavoriteShown: isFavoriteShown ?? this.isFavoriteShown,
      isAppointmentShown: isAppointmentShown ?? this.isAppointmentShown,
      isSupportShown: isSupportShown ?? this.isSupportShown,
      isCabinetsInfoPlaceShow:
          isCabinetsInfoPlaceShow ?? this.isCabinetsInfoPlaceShow,
      isNotificationCloseShown:
          isNotificationCloseShown ?? this.isNotificationCloseShown,
      isFileShown: isFileShown ?? this.isFileShown,
    );
  }
}
