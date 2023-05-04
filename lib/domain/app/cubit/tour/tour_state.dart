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


  TourState({
    this.tourStatuses,
    this.isNotificationShown,
    this.isFavoriteShown,
    this.isAppointmentShown,
    this.isSupportShown,
    this.isCabinetsInfoPlaceShow,
    this.isNotificationCloseShown
  });

  TourState copyWith({
    TourStatuses? tourStatuses,
    bool? isNotificationShown,
    bool? isFavoriteShown,
    bool? isAppointmentShown,
    bool? isSupportShown,
    bool? isCabinetsInfoPlaceShow,
    bool? isNotificationCloseShown
  }) {
    return TourState(
      tourStatuses: tourStatuses ?? this.tourStatuses,
      isNotificationShown: isNotificationShown ?? this.isNotificationShown,
      isFavoriteShown: isFavoriteShown ?? this.isFavoriteShown,
      isAppointmentShown: isAppointmentShown ?? this.isAppointmentShown,
      isSupportShown: isSupportShown ?? this.isSupportShown,
      isCabinetsInfoPlaceShow:
          isCabinetsInfoPlaceShow ?? this.isCabinetsInfoPlaceShow,
      isNotificationCloseShown:
        isNotificationCloseShown ?? this.isNotificationCloseShown
    );
  }
}

class SmartappState extends TourState {
  SmartappState() : super(
    tourStatuses: TourStatuses.late,
    isNotificationShown: true,
    isFavoriteShown: true,
    isAppointmentShown: true,
    isSupportShown: true,
    isCabinetsInfoPlaceShow: true,
    isNotificationCloseShown: true,
  );
}
