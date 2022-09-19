import 'package:bloc/bloc.dart';

part 'tour_state.dart';

class TourCubit extends Cubit<TourState> {
  TourCubit() : super(TourState());

  void show(TourStage stage) {
    emit(state.copyWith(
      tourStage: stage,
      tourStatuses: TourStatuses.first
    ));
  }
}
