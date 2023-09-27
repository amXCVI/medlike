part of 'tour_cubit.dart';

enum TourChecked {
  event,
  eventSlidable,
  removeDiary,
  favoriteDoctor,
  removeAppointment,
  removeFile,
  calendarAppointment,
  notificationClose,
  cabinetInfo,
  gifReload,
  refundCard,
}

class TourState {
  final Map<TourChecked, bool>? tourChecked;
  final bool? fetched;

  TourState({
    this.tourChecked,
    this.fetched,
  });

  TourState copyWith({Map<TourChecked, bool>? tourChecked, bool? fetched}) {
    return TourState(
      tourChecked: tourChecked ?? this.tourChecked,
      fetched: fetched ?? this.fetched,
    );
  }
}
