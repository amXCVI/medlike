part of 'tour_cubit.dart';

enum TourStatuses {
  first,
  late
}

class TourState {
  final TourStatuses? tourStatuses;
  final bool? isNotificationShown;
  final bool? isFavoriteShown;
  final bool? isAppointmentShown;
  final bool? isSupportShown;

  TourState({
    this.tourStatuses,
    this.isNotificationShown,
    this.isFavoriteShown,
    this.isAppointmentShown,
    this.isSupportShown,
  });

  TourState copyWith({
    TourStatuses? tourStatuses,
    bool? isNotificationShown,
    bool? isFavoriteShown,
    bool? isAppointmentShown,
    bool? isSupportShown,
  }) {
    return TourState(
      tourStatuses: tourStatuses ?? this.tourStatuses,
      isNotificationShown: isNotificationShown ?? this.isNotificationShown,
      isFavoriteShown: isFavoriteShown ?? this.isFavoriteShown,
      isAppointmentShown: isAppointmentShown ?? this.isAppointmentShown,
      isSupportShown: isSupportShown ?? this.isSupportShown,
    );
  }
}
