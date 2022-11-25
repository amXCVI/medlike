import 'package:flutter/material.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:meta/meta.dart';
import 'package:table_calendar/table_calendar.dart';

part 'appointments_state.dart';

class AppointmentsCubit
    extends MediatorCubit<AppointmentsState, UserMediatorEvent>
    with RefreshErrorHandler<AppointmentsState, UserCubit> {
  AppointmentsCubit(this.appointmentsRepository, mediator)
      : super(AppointmentsState(), mediator) {
    mediator.register(this);
  }

  final AppointmentsRepository appointmentsRepository;

  void getAppointmentsList(bool isRefresh) async {
    if (state.getAppointmentsStatus == GetAppointmentsStatuses.loading ||
        (!isRefresh &&
            state.getAppointmentsStatus == GetAppointmentsStatuses.success &&
            state.appointmentsList!.isNotEmpty)) {
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
        filteredAppointmentsList: response,
      ));
      filterAppointmentsList(state.selectedDate);
    } catch (e) {
      emit(state.copyWith(
        getAppointmentsStatus: GetAppointmentsStatuses.failed,
        appointmentsList: [],
        filteredAppointmentsList: [],
      ));
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

  /// Future<void> Для последовательного ожидания кубитов
  Future<void> getLastAppointment(bool isRefresh) async {
    if (!isRefresh &&
        state.getLastAppointmentStatus == GetLastAppointmentStatuses.success &&
        state.lastAppointment != null) {
      return;
    }
    emit(state.copyWith(
      getLastAppointmentStatus: GetLastAppointmentStatuses.loading,
    ));

    try {
      final AppointmentModel response;
      response = await appointmentsRepository.getLastAppointment();

      emit(state.copyWith(
          getLastAppointmentStatus: GetLastAppointmentStatuses.success,
          lastAppointment: response));
    } catch (e) {
      emit(state.copyWith(
          getLastAppointmentStatus: GetLastAppointmentStatuses.failed));
    }
  }

  /// Отменить прием
  void deleteAppointment({
    required String appointmentId,
    required String userId,
  }) async {
    emit(state.copyWith(
      deleteAppointmentStatus: DeleteAppointmentStatuses.loading,
      appointmentsList: state.appointmentsList
          ?.map((e) => e.id != appointmentId ? e : e.copyWith(status: 2))
          .toList(),
    ));

    filterAppointmentsList(state.selectedDate);
    try {
      final bool response;
      response = await appointmentsRepository.deleteAppointment(
          appointmentId: appointmentId, userId: userId);

      emit(state.copyWith(
        deleteAppointmentStatus: DeleteAppointmentStatuses.success,
      ));
      if (response) {
        AppToast.showAppToast(msg: 'Прием успешно отменен');
      }
    } catch (e) {
      emit(state.copyWith(
          deleteAppointmentStatus: DeleteAppointmentStatuses.failed));
    }
  }

  /// Подтвердить приём
  void confirmAppointment({
    required String appointmentId,
    required String userId,
  }) async {
    emit(state.copyWith(
      putAppointmentStatus: PutAppointmentsStatuses.loading,
      appointmentsList: state.appointmentsList
          ?.map((e) => e.id != appointmentId ? e : e.copyWith(status: 0))
          .toList(),
    ));

    filterAppointmentsList(state.selectedDate);
    try {
      final bool response;
      response = await appointmentsRepository.confirmAppointment(
          appointmentId: appointmentId, userId: userId);

      emit(state.copyWith(
        putAppointmentStatus: PutAppointmentsStatuses.success,
      ));
      if (response) {
        AppToast.showAppToast(msg: 'Прием успешно подтверждён');
      }
    } catch (e) {
      emit(
          state.copyWith(putAppointmentStatus: PutAppointmentsStatuses.failed));
    }
  }
}
