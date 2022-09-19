import 'package:bloc/bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

part 'tour_state.dart';

class TourCubit extends Cubit<TourState> {
  TourCubit() : super(TourState());

  void checkNotification() {
    emit(state.copyWith(
      isNotificationShown: true,
    ));
  }

  void checkAppointment() {
    emit(state.copyWith(
      isAppointmentShown: true,
    ));
  }

  void checkFavorite() {
    emit(state.copyWith(
      isFavoriteShown: true,
    ));
  }

  void checkSupport() {
    emit(state.copyWith(
      isSupportShown: true,
    ));
  }

  void fetchStatus() async {
    String? demoTourStatus =
      await UserSecureStorage.getField(AppConstants.demoTourStatus);
    
    if(demoTourStatus == null) {
      setStatus(TourStatuses.first);
    } else {
      setStatus(TourStatuses.late);
    }
  }

  void setStatus(TourStatuses status) {
    emit(state.copyWith(
      tourStatuses: status,
    ));
  }
}
