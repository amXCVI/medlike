import 'package:flutter/material.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/utils/helpers/timestamp_converter.dart';
import 'package:medlike/utils/helpers/timestamp_helper.dart';
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

      final appointmentsList = response
          .map((e) => AppointmentModelWithTimeZoneOffset(
                status: e.status,
                needConfirmation: e.needConfirmation,
                comment: e.comment,
                researchPlace: e.researchPlace,
                id: e.id,
                appointmentDateTime:
                    const TimestampConverter().fromJson(e.appointmentDateTime),
                timeZoneOffset: getTimezoneOffset(e.appointmentDateTime),
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
                recommendations: e.recommendations,
                items: e.items,
                checkURI: e.checkURI,
                review: e.review,
                cabinetInfo: e.cabinetInfo,
              ))
          .toList();

      final awaitedAppointments = response
          .where((e) =>
              AppointmentStatuses().getStatus(e.status).statusName == 'Ожидает')
          .toList();

      emit(state.copyWith(
          getAppointmentsStatus: GetAppointmentsStatuses.success,
          appointmentsList: appointmentsList,
          filteredAppointmentsList: appointmentsList,
          confirmCounter: awaitedAppointments
              .where((e) =>
                  isDifferenceIn24h(DateTime.parse(e.appointmentDateTime)))
              .length));
      emit(state.copyWith(
          getAppointmentsStatus: GetAppointmentsStatuses.success,
          appointmentsList: response
              .map((e) => AppointmentModelWithTimeZoneOffset(
                    status: e.status,
                    needConfirmation: e.needConfirmation,
                    comment: e.comment,
                    researchPlace: e.researchPlace,
                    id: e.id,
                    appointmentDateTime: const TimestampConverter()
                        .fromJson(e.appointmentDateTime),
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
                    recommendations: e.recommendations,
                    items: e.items,
                    checkURI: e.checkURI,
                    review: e.review,
                    cabinetInfo: e.cabinetInfo,
                  ))
              .toList(),
          filteredAppointmentsList: response
              .map((e) => AppointmentModelWithTimeZoneOffset(
                    status: e.status,
                    needConfirmation: e.needConfirmation,
                    comment: e.comment,
                    researchPlace: e.researchPlace,
                    id: e.id,
                    appointmentDateTime: const TimestampConverter()
                        .fromJson(e.appointmentDateTime),
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
                    recommendations: e.recommendations,
                    items: e.items,
                    checkURI: e.checkURI,
                    review: e.review,
                    cabinetInfo: e.cabinetInfo,
                  ))
              .toList(),
          confirmCounter: response.where((e) {
            final diff = const TimestampConverter()
                .fromJson(e.appointmentDateTime)
                .difference(DateTime.now());
            return e.status == 4 && diff.inHours < 24 && diff.inHours >= 0;
          }).length));
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
  void filterAppointmentsList(DateTime selectedDate,
      {List<AppointmentModelWithTimeZoneOffset>? appointmentsList}) {
    final List<AppointmentModelWithTimeZoneOffset> filteredAppointmentsList;
    final list = appointmentsList ?? state.appointmentsList;

    if (list == null) return;
    filteredAppointmentsList = list
        .where((element) =>
            isSameDay(element.appointmentDateTime, state.selectedDate))
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
            timeZoneOffset: getTimezoneOffset(response.appointmentDateTime),
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
            recommendations: response.recommendations,
            items: response.items,
            checkURI: response.checkURI,
            review: response.review,
            cabinetInfo: response.cabinetInfo,
          )));
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
    final list = state.appointmentsList
        ?.map((e) => e.id != appointmentId ? e : e.copyWith(status: 2))
        .toList();

    emit(state.copyWith(
        deleteAppointmentStatus: DeleteAppointmentStatuses.loading,
        appointmentsList: list,
        appointmentLoadingId: appointmentId));

    try {
      final bool response;
      response = await appointmentsRepository.deleteAppointment(
          appointmentId: appointmentId, userId: userId);

      await getLastAppointment(true);
      if (response && !doNotShowNotification) {
        AppToast.showAppToast(msg: 'Прием успешно отменен');
      }

      filterAppointmentsList(state.selectedDate, appointmentsList: list);

      emit(state.copyWith(
        confirmCounter: (state.confirmCounter ?? 2) - 1,
        deleteAppointmentStatus: DeleteAppointmentStatuses.success,
      ));
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
    final list = state.appointmentsList
        ?.map((e) => e.id != appointmentId ? e : e.copyWith(status: 0))
        .toList();

    emit(state.copyWith(
        putAppointmentStatus: PutAppointmentsStatuses.loading,
        appointmentsList: list,
        appointmentLoadingId: appointmentId));

    try {
      final bool response;
      response = await appointmentsRepository.confirmAppointment(
          appointmentId: appointmentId, userId: userId);

      await getLastAppointment(true);
      if (response) {
        AppToast.showAppToast(msg: 'Прием успешно подтверждён');
      }

      filterAppointmentsList(state.selectedDate, appointmentsList: list);

      emit(state.copyWith(
        confirmCounter: (state.confirmCounter ?? 2) - 1,
        putAppointmentStatus: PutAppointmentsStatuses.success,
      ));
    } catch (e) {
      emit(
          state.copyWith(putAppointmentStatus: PutAppointmentsStatuses.failed));
    }
  }

  /// Очистить приём
  void clearAppointment() {
    emit(state.clearAppointment());
  }

  /// Получить прием по id
  Future<AppointmentModel> getAppointmentById({
    required String appointmentId,
    required String userId,
  }) async {
    emit(state.copyWith(
      getAppointmentStatus: GetAppointmentStatuses.loading,
    ));

    try {
      final AppointmentModel response;
      response = await appointmentsRepository.getAppointmentById(
        appointmentId: appointmentId,
        userId: userId,
      );

      emit(state.copyWith(
        getAppointmentStatus: GetAppointmentStatuses.success,
        selectedAppointment: response,
      ));

      return response;
    } catch (e) {
      clearAppointment();
      emit(state.copyWith(
        getAppointmentStatus: GetAppointmentStatuses.failed,
      ));
      rethrow;
    }
  }

  /// Отправить отзыв
  Future<bool> saveAppointmentReview({
    required String appointmentId,
    required String reviewVisibility,
    required String caption,
    required String message,
    required String email,
    required int rate,
  }) async {
    emit(state.copyWith(
      sendAppointmentReviewStatus: SendAppointmentReviewStatuses.loading,
    ));

    try {
      await appointmentsRepository.saveAppointmentRate(
        appointmentId: appointmentId,
        reviewVisibility: reviewVisibility,
        caption: caption,
        message: message,
        email: email,
        rate: rate,
      );

      List<AppointmentModelWithTimeZoneOffset>? appointmentsListWithNewRating =
          state.appointmentsList
              ?.map((e) => e.id == appointmentId
                  ? e.copyWith(
                      doctorInfo: e.doctorInfo.copyWith(
                        rateAsUser: rate,
                        rateAsSotr: rate,
                      ),
                      review: AppointmentReviewModel(
                        rate: rate,
                        caption: caption,
                        message: message,
                        visibility: int.parse(reviewVisibility),
                        email: email,
                      ))
                  : e)
              .toList();

      emit(state.copyWith(
          sendAppointmentReviewStatus: SendAppointmentReviewStatuses.success,
          appointmentsList: appointmentsListWithNewRating,
          selectedAppointment: state.selectedAppointment!.copyWith(
            doctorInfo: state.selectedAppointment!.doctorInfo.copyWith(
              rateAsUser:
                  state.selectedAppointment!.doctorInfo.rateAsUser ?? rate,
            ),
            review: AppointmentReviewModel(
              rate: rate,
              caption: caption,
              message: message,
              visibility: int.parse(reviewVisibility),
              email: email,
            ),
          )));

      Future.delayed(const Duration(seconds: 2), () {
        emit(
          state.copyWith(
            sendAppointmentReviewStatus: SendAppointmentReviewStatuses.initial,
          ),
        );
      });
      return true;
    } catch (e) {
      print(e);
      clearAppointment();
      emit(state.copyWith(
        sendAppointmentReviewStatus: SendAppointmentReviewStatuses.failed,
      ));
      return false;
    }
  }

  void setRatingToSelectedAppointment(num rate) {
    try {
      if (state.selectedAppointment!.doctorInfo.rateAsUser == null) {
        emit(state.copyWith(
          selectedAppointment:
              state.selectedAppointment!.copyWith.doctorInfo(rateAsUser: rate),
        ));
      }
    } catch (err) {
      print(err);
    }
  }
}
