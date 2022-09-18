import 'package:bloc/bloc.dart';

part 'tour_state.dart';

class TourCubit extends Cubit<TourState> {
  TourCubit() : super(TourState());

  void show() {
    emit(state.copyWith(
      tourStatuses: TourStatuses.late
    ));

    emit(state.copyWith(
      tourStatuses: TourStatuses.first
    ));
  }
}
