import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/widgets/fluttertoast/toast.dart';
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
      //! не получилось сделать с первого раза.
      //! Вроде работает, но не факт. Если приемы пропали - проблема здесь )
      DateTime firstSelectedDate = DateTime.now();
      try {
        List<AppointmentModel>? myListFiltered = state.appointmentsList
            ?.where((e) => e.status == 4 || e.status == 0)
            .toList();
        if (myListFiltered != null) {
          firstSelectedDate = myListFiltered[0].appointmentDateTime;
        }
      } catch (e) {}

      emit(state.copyWith(
        getAppointmentsStatus: GetAppointmentsStatuses.success,
        appointmentsList: response,
        filteredAppointmentsList: response,
        selectedDate: firstSelectedDate,
        //     ? firstSelectedDate
        //     : DateTime.now(),
      ));
      // filterAppointmentsList(firstSelectedDate != null
      //     ? firstSelectedDate
      //     : DateTime.now());
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
    if (state.appointmentsList == null) return;
    filteredAppointmentsList = state.appointmentsList!
        .where((element) =>
            isSameDay(element.appointmentDateTime, state.selectedDate))
        .toList();
    emit(state.copyWith(
      filteredAppointmentsList: filteredAppointmentsList,
    ));
  }

  /// Отменить прием
  void deleteAppointment({
    required String appointmentId,
    required String userId,
  }) async {
    emit(state.copyWith(
      deleteAppointmentStatus: DeleteAppointmentStatuses.loading,
    ));
    try {
      final bool response;
      response = await appointmentsRepository.deleteAppointment(
          appointmentId: appointmentId, userId: userId);

      emit(state.copyWith(
        deleteAppointmentStatus: DeleteAppointmentStatuses.success,
        appointmentsList: state.appointmentsList
            ?.map((e) => e.id != appointmentId ? e : e.copyWith(status: 2))
            .toList(),
      ));
      if (response) {
        AppToast.showAppToast(msg: 'Прием успешно отменен');
      }
      filterAppointmentsList(state.selectedDate);
    } catch (e) {
      emit(state.copyWith(
          deleteAppointmentStatus: DeleteAppointmentStatuses.failed));
    }
  }
}
