import 'package:bloc/bloc.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:meta/meta.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit(this.appointmentsRepository) : super(const AppointmentsState());

  final AppointmentsRepository appointmentsRepository;

  void getAppointmentsList(bool isRefresh) async {
    if (!isRefresh &&
        state.getAppointmentsStatus == GetAppointmentsStatuses.success &&
        state.appointmentsList!.isNotEmpty) {
      return;
    }
    emit(state.copyWith(
      getAppointmentsStatus: GetAppointmentsStatuses.loading,
    ));
    try {
      final List<AppointmentModel> response;
      response = await appointmentsRepository.getAppointmentsList();
      emit(state.copyWith(
        getAppointmentsStatus: GetAppointmentsStatuses.success,
        appointmentsList: response,
      ));
    } catch (e) {
      emit(state.copyWith(
          getAppointmentsStatus: GetAppointmentsStatuses.failed));
    }
  }

}
