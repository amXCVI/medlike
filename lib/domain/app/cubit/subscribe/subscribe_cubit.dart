import 'package:bloc/bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/data/repository/subscribe_repository.dart';
import 'package:meta/meta.dart';

part 'subscribe_state.dart';

class SubscribeCubit extends Cubit<SubscribeState> {
  SubscribeCubit(this.subscribeRepository) : super(const SubscribeState());

  final SubscribeRepository subscribeRepository;

  /// Получает список доступных клиник для записи к врачу
  void getAvailableClinicsList(userId) async {
    emit(state.copyWith(
      getAvailableClinicsStatus: GetAvailableClinicsListStatuses.loading,
    ));
    try {
      final List<AvailableClinic> response;
      response = await subscribeRepository.getAvailableClinicsList(userId: userId);
      emit(state.copyWith(
        getAvailableClinicsStatus: GetAvailableClinicsListStatuses.success,
        availableClinicsList: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        getAvailableClinicsStatus: GetAvailableClinicsListStatuses.failed
      ));
    }
  }
}
