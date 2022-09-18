part of 'tour_cubit.dart';

enum TourStatuses {
  first,
  late
}

class TourState {
  final TourStatuses? tourStatuses;

  TourState({
    this.tourStatuses,
  });

  TourState copyWith({
    TourStatuses? tourStatuses,
  }) {
    return TourState(
      tourStatuses: tourStatuses ?? this.tourStatuses,
    );
  }
}
