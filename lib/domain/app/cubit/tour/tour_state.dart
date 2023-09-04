part of 'tour_cubit.dart';

enum TourChecked {
  event,
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

  TourState({
    this.tourChecked,
  });

  TourState copyWith({
    Map<TourChecked, bool>? tourChecked,
  }) {
    return TourState(
      tourChecked: tourChecked ?? this.tourChecked,
    );
  }
}
