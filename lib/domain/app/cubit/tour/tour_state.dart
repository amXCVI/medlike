part of 'tour_cubit.dart';

enum TourStatuses {
  first,
  late
}

enum TourStage {
  notification,
  favorite,
  dismiss
}

class TourState {
  final TourStatuses? tourStatuses;
  final TourStage? tourStage;

  TourState({
    this.tourStatuses,
    this.tourStage
  });

  TourState copyWith({
    TourStatuses? tourStatuses,
    TourStage? tourStage
  }) {
    return TourState(
      tourStatuses: tourStatuses ?? this.tourStatuses,
      tourStage: tourStage ?? this.tourStage
    );
  }
}
