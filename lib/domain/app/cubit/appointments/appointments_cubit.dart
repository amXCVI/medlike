import 'package:bloc/bloc.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/utils/helpers/date_helpers.dart';
import 'package:meta/meta.dart';
import 'package:table_calendar/table_calendar.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit(this.appointmentsRepository) : super(AppointmentsState());

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
      /// когда открывается страница Мои приемы —
      /// по умолчанию выбрана ближайшая дата с приемом,
      /// который требует подтверждения
      DateTime firstSelectedDate = response
          .firstWhere((element) => element.status == 0)
          .appointmentDateTime;
      emit(state.copyWith(
        getAppointmentsStatus: GetAppointmentsStatuses.success,
        appointmentsList: response,
        filteredAppointmentsList: response,
        selectedDate: firstSelectedDate,
      ));
      filterAppointmentsList(firstSelectedDate);
    } catch (e) {
      emit(state.copyWith(
          getAppointmentsStatus: GetAppointmentsStatuses.failed));
    }
  }

  void setStartDate(DateTime startDate) {
    emit(state.copyWith(startDate: startDate));
  }

  void setEndDate(DateTime endDate) {
    emit(state.copyWith(endDate: endDate));
  }

  void setSelectedDate(DateTime selectedDate) {
    emit(state.copyWith(selectedDate: selectedDate));
    filterAppointmentsList(selectedDate);
  }

  /// Отбираем приемы по выделенному дню
  void filterAppointmentsList(DateTime selectedDate) {
    final List<AppointmentModel> filteredAppointmentsList;
    filteredAppointmentsList = state.appointmentsList!
        .where((element) =>
            isSameDay(element.appointmentDateTime, state.selectedDate))
        .toList();
    emit(state.copyWith(
      filteredAppointmentsList: filteredAppointmentsList,
    ));
  }
}
