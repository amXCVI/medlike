import 'package:flutter/material.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/utils/helpers/timestamp_converter.dart';
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

  @override
  void receive(String from, UserMediatorEvent event) {
    print(from);
    print(event);
    if (event == UserMediatorEvent.pushNotification) {
      getLastAppointment(true);
    }
  }

  Future<void> getAppointmentsList(bool isRefresh) async {
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
        appointmentsList: response
            .map((e) => AppointmentModelWithTimeZoneOffset(
                status: e.status,
                needConfirmation: e.needConfirmation,
                comment: e.comment,
                researchPlace: e.researchPlace,
                id: e.id,
                appointmentDateTime:
                    const TimestampConverter().fromJson(e.appointmentDateTime),
                timeZoneOffset: int.parse(
                    e.appointmentDateTime.split('+').last.substring(0, 2)),
                patientInfo: e.patientInfo,
                clinicInfo: e.clinicInfo,
                doctorInfo: e.doctorInfo,
                researches: e.researches,
                categoryType: e.categoryType,
                isVideo: e.isVideo,
                payType: e.payType,
                isDraft: e.isDraft,
                orderId: e.orderId,
                scheduleId: e.scheduleId,
                paymentStatus: e.paymentStatus,
                recommendations: e.recommendations))
            .toList(),
        filteredAppointmentsList: response
            .map((e) => AppointmentModelWithTimeZoneOffset(
                status: e.status,
                needConfirmation: e.needConfirmation,
                comment: e.comment,
                researchPlace: e.researchPlace,
                id: e.id,
                appointmentDateTime:
                    const TimestampConverter().fromJson(e.appointmentDateTime),
                timeZoneOffset: int.parse(
                    e.appointmentDateTime.split('+').last.substring(0, 2)),
                patientInfo: e.patientInfo,
                clinicInfo: e.clinicInfo,
                doctorInfo: e.doctorInfo,
                researches: e.researches,
                categoryType: e.categoryType,
                isVideo: e.isVideo,
                payType: e.payType,
                isDraft: e.isDraft,
                orderId: e.orderId,
                scheduleId: e.scheduleId,
                paymentStatus: e.paymentStatus,
                recommendations: e.recommendations))
            .toList(),
        confirmCounter: response.where(
          (element) => element.status == 4
        ).length
      ));
      filterAppointmentsList(state.selectedDate);
      return;
    } catch (e) {
      emit(state.copyWith(
        getAppointmentsStatus: GetAppointmentsStatuses.failed,
        appointmentsList: [],
        filteredAppointmentsList: [],
      ));
      return;
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
    final List<AppointmentModelWithTimeZoneOffset> filteredAppointmentsList;
    if (state.appointmentsList == null) return;
    filteredAppointmentsList = state.appointmentsList!
        .where((element) => isSameDay(
            element.appointmentDateTime,
            state.selectedDate))
        .toList();
    emit(state.copyWith(
      filteredAppointmentsList: filteredAppointmentsList,
    ));
  }

  /// Отбираем только будущие приемы, для экрана записи
  /// Отбираем приемы по выбранному для записи пользователю
  /// Отбираем прием по выбранной дате
  /// Итоговый список для показа на экране записи на прием
  void getAppointmentsListForSelectedDay(
      {required String userId, required DateTime selectedDate}) {
    final List<AppointmentModelWithTimeZoneOffset> filteredAppointmentsList;
    if (state.appointmentsList == null) return;
    filteredAppointmentsList = state.appointmentsList!
        .where((element) =>
            AppointmentStatuses.cancellableStatusIds.contains(element.status) &&
            element.patientInfo.id == userId &&
            isSameDay(element.appointmentDateTime, selectedDate))
        .toList();
    emit(state.copyWith(
      selectedDayAppointmentsList: filteredAppointmentsList,
    ));
  }

  /// Future<void> Для последовательного ожидания кубитов
  Future<void> getLastAppointment(bool isRefresh) async {
    if (!isRefresh &&
        state.getLastAppointmentStatus == GetLastAppointmentStatuses.success) {
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
          lastAppointment: AppointmentModelWithTimeZoneOffset(
              status: response.status,
              needConfirmation: response.needConfirmation,
              comment: response.comment,
              researchPlace: response.researchPlace,
              id: response.id,
              appointmentDateTime: const TimestampConverter()
                  .fromJson(response.appointmentDateTime),
              timeZoneOffset: int.parse(
                  response.appointmentDateTime.split('+').last.substring(0, 2)),
              patientInfo: response.patientInfo,
              clinicInfo: response.clinicInfo,
              doctorInfo: response.doctorInfo,
              researches: response.researches,
              categoryType: response.categoryType,
              isVideo: response.isVideo,
              payType: response.payType,
              isDraft: response.isDraft,
              orderId: response.orderId,
              scheduleId: response.scheduleId,
              paymentStatus: response.paymentStatus,
              recommendations: response.recommendations)));
    } catch (e) {
      clearAppointment();
      emit(state.copyWith(
          getLastAppointmentStatus: GetLastAppointmentStatuses.failed));
    }
  }

  /// Отменить прием
  Future<void> deleteAppointment({
    required String appointmentId,
    required String userId,
    bool doNotShowNotification = false,
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

      await getLastAppointment(true);
      if (response && !doNotShowNotification) {
        AppToast.showAppToast(msg: 'Прием успешно отменен');
      }
      emit(state.copyWith(
        confirmCounter: (state.confirmCounter ?? 1) - 1,
        deleteAppointmentStatus: DeleteAppointmentStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        deleteAppointmentStatus: DeleteAppointmentStatuses.failed)
      );
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

      await getLastAppointment(true);
      emit(state.copyWith(
        confirmCounter: (state.confirmCounter ?? 1) - 1,
        putAppointmentStatus: PutAppointmentsStatuses.success,
      ));
      if (response) {
        AppToast.showAppToast(msg: 'Прием успешно подтверждён');
      }

    } catch (e) {
      emit(
        state.copyWith(putAppointmentStatus: PutAppointmentsStatuses.failed)
      );
    }
  }

  /// Очистить приём
  void clearAppointment() {
    emit(state.clearAppointment());
  }
}
