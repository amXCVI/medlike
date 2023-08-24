import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/data/repository/subscribe_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/helpers/date_helpers.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

part 'subscribe_state.dart';

class SubscribeCubit extends MediatorCubit<SubscribeState, UserMediatorEvent>
    with RefreshErrorHandler<SubscribeState, UserCubit> {
  SubscribeCubit(this.subscribeRepository, mediator)
      : super(SubscribeState(), mediator);

  final SubscribeRepository subscribeRepository;

  /// Получает список доступных клиник для записи к врачу
  void getAvailableClinicsList(String userId, bool isRefresh) async {
    if (state.getAvailableClinicsStatus ==
            GetAvailableClinicsListStatuses.loading ||
        userId == state.selectedUser?.id &&
            !isRefresh &&
            state.availableClinicsList != null &&
            state.availableClinicsList!.isNotEmpty) {
      return;
    }
    emit(state.copyWith(
      getAvailableClinicsStatus: GetAvailableClinicsListStatuses.loading,
    ));
    try {
      final List<AvailableClinic> response;
      response =
          await subscribeRepository.getAvailableClinicsList(userId: userId);
      emit(state.copyWith(
        getAvailableClinicsStatus: GetAvailableClinicsListStatuses.success,
        availableClinicsList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getAvailableClinicsStatus: GetAvailableClinicsListStatuses.failed));
    }
  }

  /// Сохранить выбранное здание (building)
  void setSelectedBuilding(AvailableClinic building) {
    UserSecureStorage.setField(
        AppConstants.timeZoneOffset, building.timeZoneOffset.toString());
    emit(state.copyWith(
      selectedBuilding: building,
    ));
  }

  /// Получает список услуг, доступных для записи
  void getServicesList(userId, clinicId, buildingId) async {
    emit(state.copyWith(
      getServicesListStatus: GetServicesListStatuses.loading,
    ));
    try {
      final List<NavigationItem> response;
      response = await subscribeRepository.getServicesList(
          userId: userId, clinicId: clinicId, buildingId: buildingId);
      emit(state.copyWith(
        getServicesListStatus: GetServicesListStatuses.success,
        servicesList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getServicesListStatus: GetServicesListStatuses.failed));
    }
  }

  /// Сохранить выбранную категорию услуг
  void setSelectedService(NavigationItem service) {
    emit(state.copyWith(
      selectedService: service,
    ));
  }

  /// Получает данные по конкретной услуге
  void getResearchesList(userId, clinicId, buildingId, categoryType) async {
    emit(state.copyWith(
      getResearchesListStatus: GetResearchesListStatuses.loading,
    ));
    try {
      final List<Research> response;
      response = await subscribeRepository.getResearchesList(
          userId: userId,
          clinicId: clinicId,
          buildingId: buildingId,
          categoryType: categoryType);
      emit(state.copyWith(
        getResearchesListStatus: GetResearchesListStatuses.success,
        researchesList: response,
        filteredResearchesList: response,
        selectedResearchesIds: <String>[],
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getResearchesListStatus: GetResearchesListStatuses.failed));
    }
  }

  /// Фильтр researches
  void filterResearchesList(String filterStr) {
    final List<Research> filteredList;
    filteredList = state.researchesList!
        .where((element) =>
            element.name.toLowerCase().contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredResearchesList: filteredList,
      selectedResearchesIds: [],
    ));
  }

  /// Добавление или удаление услуг в списке выбранных
  void addOrRemoveSelectedResearchId(String researchId) {
    List<String> selectedResearchesIds =
        state.selectedResearchesIds as List<String>;
    if (state.selectedResearchesIds!.contains(researchId)) {
      selectedResearchesIds.remove(researchId);
      emit(state.copyWith(
        selectedResearchesIds: selectedResearchesIds,
      ));
    } else {
      selectedResearchesIds.add(researchId);
      emit(state.copyWith(
        selectedResearchesIds: selectedResearchesIds,
      ));
    }
  }

  /// Получает список консультаций или телемед.
  void getSpecialisationsList(
      userId, clinicId, buildingId, categoryType) async {
    emit(state.copyWith(
      getSpecialisationsListStatus: GetSpecialisationsListStatuses.loading,
    ));
    try {
      final List<NavigationItem> response;
      response = await subscribeRepository.getSpecialisationsList(
          userId: userId,
          clinicId: clinicId,
          buildingId: buildingId,
          categoryType: categoryType);
      emit(state.copyWith(
        getSpecialisationsListStatus: GetSpecialisationsListStatuses.success,
        specialisationsList: response,
        filteredSpecialisationsList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getSpecialisationsListStatus: GetSpecialisationsListStatuses.failed));
    }
  }

  /// Фильтр специализаций врача в консультациях и телемед. По названию специализации
  void filterSpecialisationsList(String filterStr) {
    final List<NavigationItem> filteredList;
    filteredList = state.specialisationsList!
        .where((element) =>
            element.name!.toLowerCase().contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredSpecialisationsList: filteredList,
    ));
  }

  /// Сохранить выбранную категорию специализацию
  /// И обнуляет список выбранных исследований
  void setSelectedSpecialisation(NavigationItem specialisation) {
    emit(state.copyWith(
      selectedSpecialisation: specialisation,
      selectedResearchesIds: [],
    ));
  }

  /// Получает список докторов для записи.
  void getDoctorsList(
    userId,
    clinicId,
    buildingId,
    categoryType,
    specialisationId,
  ) async {
    emit(state.copyWith(
      getDoctorsListStatus: GetDoctorsListStatuses.loading,
    ));
    try {
      final List<Doctor> response;
      response = await subscribeRepository.getDoctorsList(
        userId: userId,
        clinicId: clinicId,
        buildingId: buildingId,
        categoryType: categoryType,
        specialisationId: specialisationId,
      );
      emit(state.copyWith(
        getDoctorsListStatus: GetDoctorsListStatuses.success,
        doctorsList: response,
        filteredDoctorsList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(getDoctorsListStatus: GetDoctorsListStatuses.failed));
    }
  }

  /// Фильтр врачей
  void filterDoctorsList(String filterStr) {
    final List<Doctor> filteredDoctorsList;
    filteredDoctorsList = state.doctorsList!
        .where((element) =>
            '${element.lastName} ${element.middleName} ${element.middleName} ${element.specialization}'
                .toLowerCase()
                .contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredDoctorsList: filteredDoctorsList,
    ));
  }

  /// Сохранить выбранного доктора
  void setSelectedDoctor(Doctor selectedDoctor) {
    // cast Doctor to AvailableDoctor
    final availableDoctor = selectedDoctor.availableDoctor;
    emit(state.copyWith(
      isAnyDoctor: false,
      selectedDoctor: () => availableDoctor
    ));
  }

  /// Сохранить выбранного доктора
  void setAvailableDoctor(AvailableDoctor availableDoctor) {
    emit(state.copyWith(
      isAnyDoctor: true,
      selectedDoctor: () => availableDoctor
    ));
  }

  /// Получает список кабинетов и список докторов для записи на услугу
  void getResearchCabinetsList(
    userId,
    clinicId,
    buildingId,
    categoryType,
    researchIds,
  ) async {
    emit(state.copyWith(
      getCabinetsListStatus: GetCabinetsListStatuses.loading,
    ));
    try {
      final DoctorsResponseModel response;
      response = await subscribeRepository.getCabinetsList(
        userId: userId,
        clinicId: clinicId,
        buildingId: buildingId,
        categoryType: categoryType,
        researchIds: researchIds,
      );
      emit(state.copyWith(
        getCabinetsListStatus: GetCabinetsListStatuses.success,
        doctorsList: response.doctors,
        cabinetsList: response.cabinets,
        filteredDoctorsList: response.doctors,
        filteredCabinetsList: response.cabinets,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getCabinetsListStatus: GetCabinetsListStatuses.failed));
    }
  }

  /// Фильтр кабинетов
  void filterCabinetsList(String filterStr) {
    final List<Doctor> filteredDoctorsList;
    final List<Cabinet> filteredCabinetsList;
    filteredDoctorsList = state.doctorsList!
        .where((element) =>
            '${element.lastName} ${element.middleName} ${element.middleName} ${element.specialization}'
                .toLowerCase()
                .contains(filterStr.toLowerCase()))
        .toList();
    filteredCabinetsList = state.cabinetsList!
        .where((element) => element.cabinetName!
            .toLowerCase()
            .contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredDoctorsList: filteredDoctorsList,
      filteredCabinetsList: filteredCabinetsList,
    ));
  }

  /// Получение списка избранных врачей
  void getFavoritesDoctorsList(
    userId,
    buildingId,
  ) async {
    emit(state.copyWith(
      getFavoriteDoctorsListStatus: GetFavoriteDoctorsListStatuses.loading,
    ));
    try {
      final List<FavoriteDoctor> response;
      response = await subscribeRepository.getFavoriteDoctorsList(
        userId: userId,
        buildingId: buildingId,
      );
      emit(state.copyWith(
        getFavoriteDoctorsListStatus: GetFavoriteDoctorsListStatuses.success,
        favoriteDoctorsList: response,
        filteredFavoriteDoctorsList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getFavoriteDoctorsListStatus: GetFavoriteDoctorsListStatuses.failed));
    }
  }

  /// Фильтр избранных врачей
  void filterFavoritesDoctorsList(String filterStr) {
    final List<FavoriteDoctor> filteredDoctorsList;
    filteredDoctorsList = state.favoriteDoctorsList!
        .where((element) =>
            '${element.lastName} ${element.middleName} ${element.middleName} ${element.specialization}'
                .toLowerCase()
                .contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredFavoriteDoctorsList: filteredDoctorsList,
    ));
  }

  void getCalendarList({
    required bool isRefresh,
    required String userId,
    required String buildingId,
    required String clinicId,
    required String categoryType,
    required bool isAny,
    DateTime? endDate,
    DateTime? startDate,
    String? doctorId,
    String? specialisationId,
    List<String>? researchIds,
    String? cabinet,
  }) async {
    if (!isRefresh &&
        state.calendarList != null &&
        state.calendarList!.isNotEmpty &&
        state.calendarList!
            .map((e) => date_utils.DateUtils.getDateStr(e.date))
            .contains(date_utils.DateUtils.getDateStr(startDate ?? state.startDate)) &&
        state.calendarList!
            .map((e) => date_utils.DateUtils.getDateStr(e.date))
            .contains(date_utils.DateUtils.getDateStr(endDate ?? state.endDate))) {
      /// Если этот период уже содержится в массиве календаря, ничего не делаем
      return;
    }
    emit(state.copyWith(
      getCalendarStatus: GetCalendarStatuses.loading,
    ));
    try {
      final List<CalendarModel> response;
      response = await subscribeRepository.getCalendarList(
        userId: userId,
        buildingId: buildingId,
        clinicId: clinicId,
        categoryType: categoryType,
        endDate: endDate ?? state.endDate.add(const Duration(days: 7)),
        startDate: startDate ?? state.startDate.add(const Duration(days: -7)),
        dynamicParams: getDynamicParams(
          isAny: isAny,
          doctorId: doctorId,
          specialisationId: specialisationId,
          researchIds: researchIds,
          cabinet: cabinet,
        ),
      );

      int timeZoneOffset = await getTimeZoneOffset();
      emit(state.copyWith(
        getCalendarStatus: GetCalendarStatuses.success,

        /// Здесь даты приводятся к внутреннему формату. Добавляется таймзона (часы)
        /// Массив не перезаписывается, а конкатенируется. Чтобы при перелистывании не
        /// загружать его каждый раз заново
        calendarList: isRefresh
            ? response.map((e) {
                DateTime date = dateTimeToUTC(e.date, timeZoneOffset);
                return e.copyWith(date: date);
              }).toList()
            : {
                ...?state.calendarList,
                ...response.map((e) {
                  return e.copyWith(
                      date: dateTimeToUTC(e.date, timeZoneOffset));
                }).toList()
              }.toList(),
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(getCalendarStatus: GetCalendarStatuses.failed));
    }
  }

  void getTimetableList({
    required bool isRefresh,
    required String userId,
    required String buildingId,
    required String clinicId,
    required String categoryType,
    required bool isAny,
    DateTime? selectedDate,
    String? doctorId,
    String? specialisationId,
    List<String>? researchIds,
    String? cabinet,
  }) async {
    emit(state.copyWith(
      getTimetableCellsStatus: GetTimetableCellsStatuses.loading,
    ));
    try {
      final TimetableResponseModel response;
      response = await subscribeRepository.getScheduleCellsList(
        userId: userId,
        buildingId: buildingId,
        clinicId: clinicId,
        categoryType: categoryType,
        selectedDate: selectedDate ?? state.selectedDate,
        dynamicParams: getDynamicParams(
          isAny: isAny,
          doctorId: doctorId,
          specialisationId: specialisationId,
          researchIds: researchIds,
          cabinet: cabinet,
        ),
      );

      emit(state.copyWith(
        getTimetableCellsStatus: GetTimetableCellsStatuses.success,
        timetableCellsList: response.cells.map((e) {
          return e.copyWith(time: e.time);
        }).where((el) {
          /// Возможно, это ужасное решение не будет нужно
          /// если найдётя проблема наличия ячейки одновременно
          /// в cells и logs на бэкенде
          /// но мне так и не удалось отследить строгий путь появления
          return response.logs.where((log) => 
            log.date == el.time).isEmpty;
        }).toList(),
        timetableLogsList: response.logs,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getTimetableCellsStatus: GetTimetableCellsStatuses.failed));
    }
  }

  void setEmptyTimetableList() {
    emit(state.copyWith(timetableCellsList: [], timetableLogsList: []));
  }

  void setSelectedTimetableCell(TimetableCellModel selectedCell) {
    emit(state.copyWith(selectedTimetableCell: () => selectedCell));
  }

  void setSelectedCalendarItem(CalendarModel date) {
    emit(state.copyWith(selectedCalendarItem: date));
  }

  void setStartDate(DateTime startDate) {
    emit(state.copyWith(startDate: startDate));
  }

  void setEndDate(DateTime endDate) {
    emit(state.copyWith(endDate: endDate));
  }

  void setSelectedDate(DateTime selectedDate) {
    emit(state.copyWith(selectedDate: selectedDate));
  }

  void getAppointmentInfoData({
    required String scheduleId,
    required String userId,
    required List<String> researchIds,
    required DateTime appointmentDate,
  }) async {
    emit(state.copyWith(
      getAppointmentInfoStatus: GetAppointmentInfoStatuses.loading,
    ));
    try {
      final AppointmentInfoModel response;
      response = (await subscribeRepository.getAppointmentInfo(
        userId: userId,
        scheduleId: scheduleId,
        researchIds: researchIds,
        appointmentDate: appointmentDate,
      ));
      emit(state.copyWith(
        getAppointmentInfoStatus: GetAppointmentInfoStatuses.success,
        appointmentInfoData: response,
        //! Если выключается оплата картой -- раскомментировать !//
        // selectedPayType: AppConstants.noPayedPayType,
        //! Пока убрана оплата картой. При включении функционала раскомментировать !//
        selectedPayType: response.payType,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getAppointmentInfoStatus: GetAppointmentInfoStatuses.failed));
    }
  }

  void checkAndLockAvailableCell({
    required String scheduleId,
    required String userId,
    required String clinicId,
    required DateTime appointmentDate,
  }) async {
    emit(state.copyWith(
      checkAndLockAvailableCellStatus:
          CheckAndLockAvailableCellStatuses.loading,
    ));
    try {
      await subscribeRepository.checkAndLockAvailableCell(
        userId: userId,
        scheduleId: scheduleId,
        clinicId: clinicId,
        appointmentDate: appointmentDate,
      );
      emit(state.copyWith(
        checkAndLockAvailableCellStatus:
            CheckAndLockAvailableCellStatuses.success,
        timetableCellsList: state.timetableCellsList
            ?.where((element) => element.scheduleId != scheduleId)
            .toList(),
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          checkAndLockAvailableCellStatus:
              CheckAndLockAvailableCellStatuses.failed));
    }
  }

  void syncUnlockCell() {
    emit(state.copyWith(
      unlockCellStatus: UnlockCellStatuses.loading,
      getTimetableCellsStatus: GetTimetableCellsStatuses.refunded,
    ));
  }

  /// разблокируем ячейку
  Future<void> unlockCell({
    required String userId,
  }) async {
    emit(state.copyWith(
      unlockCellStatus: UnlockCellStatuses.loading,
    ));
    try {
      await subscribeRepository.unlockCell(
        userId: userId,
        scheduleId: state.selectedTimetableCell!.scheduleId,
      );
      emit(state.copyWith(
        unlockCellStatus: UnlockCellStatuses.success,

        /// обнуляю загруженные данные по текущему дню
        /// актуально при возврате со страницы подтверждения приема
        timetableCellsList: [],
        getTimetableCellsStatus: GetTimetableCellsStatuses.refunded,
        selectedTimetableCell: () => null,
        createdAppointmentId: () => null,
      ));
    } catch (e) {
      emit(state.copyWith(unlockCellStatus: UnlockCellStatuses.failed));
    }
  }

  void createNewAppointment({
    required String userId,
    required String userName,
    required int timezoneHours,
  }) async {
    if (state.creatingAppointmentStatus ==
        CreatingAppointmentStatuses.success) {
      return;
    }

    emit(state.copyWith(
      creatingAppointmentStatus: CreatingAppointmentStatuses.loading,
    ));

    final time = state.selectedTimetableCell?.time as DateTime;

    try {
      dynamic data = {
        'AppointmentDateTime': dateTimeToServerFormat(time, timezoneHours),
        'ClinicInfo': {
          'Id': state.selectedBuilding?.id,
          'Name': state.selectedBuilding?.name,
          'Address': state.selectedBuilding?.address
        },
        'PatientInfo': {'Id': userId, 'Name': userName},
        'DoctorInfo':
            state.selectedDoctor != null
            && state.selectedDoctor!.id.isNotEmpty
                ? {
                    'Id': state.selectedDoctor?.id,
                    'FirstName': state.selectedDoctor?.firstName,
                    'MiddleName': state.selectedDoctor?.middleName,
                    'LastName': state.selectedDoctor?.lastName,
                    'SpecializationId': state.selectedDoctor?.specializationId,
                    'Specialization': state.selectedDoctor?.specialization,
                    'CabinetName': state.selectedTimetableCell?.cabinetName
                  }
                : {},
        'Researches': state.selectedResearchesIds != null &&
                state.selectedResearchesIds!.isNotEmpty
            ? state.selectedResearchesIds
                ?.map((e) => {
                      'Id': state.researchesList
                          ?.firstWhere((element) => element.id == e)
                          .id,
                      'Name': state.researchesList
                          ?.firstWhere((element) => element.id == e)
                          .name
                    })
                .toList()
            : [],
        'CategoryType': state.selectedService?.categoryType,
        'Price': state.appointmentInfoData?.price,
        'PayType': state.selectedPayType,
        'ScheduleId': state.selectedTimetableCell?.scheduleId,
        'isDraft':
            state.selectedPayType == AppConstants.noPayedPayType ? false : true,
      };

      CreateNewAppointmentResponseModel response =
          await subscribeRepository.createNewAppointment(data: data);
      emit(state.copyWith(
        createdAppointmentId: () => response.result,
        creatingAppointmentStatus: CreatingAppointmentStatuses.success,
      ));
      if (state.selectedPayType == AppConstants.cardPayType) {
        registerOrder(
            userId: userId, appointmentIds: [response.result].toList());
        emit(state.copyWith(
          creatingAppointmentStatus: CreatingAppointmentStatuses.createdDraft,
        ));
      } else {
        emit(state.copyWith(
          creatingAppointmentStatus: CreatingAppointmentStatuses.finished,
        ));
      }
    } catch (e) {
      addError(e);
      emit(state.copyWith(
        creatingAppointmentStatus: CreatingAppointmentStatuses.failed,
      ));
      Future.delayed(const Duration(seconds: 8), () {
        emit(state.copyWith(
            creatingAppointmentStatus: CreatingAppointmentStatuses.initial));
      });
    }
  }

  /// Обнуление стейта с записью. Прием создан, переходим в Мои приемы
  void resetSubscribeStoryState() {
    /// похоже, null в стейт поместить нельзя. С доктором не сработало
    /// хотя ошибок нет в линтере.
    emit(state.clearState());
    // emit(state.copyWith(
    //   creatingAppointmentStatus: CreatingAppointmentStatuses.initial,
    //   selectedUser: null,
    //   selectedDoctor: const Doctor(
    //     id: '',
    //     lastName: '',
    //     firstName: '',
    //     middleName: '',
    //     specializationId: '',
    //     specialization: '',
    //     price: 0,
    //     categoryType: -1,
    //     isFavorite: false,
    //     categories: [],
    //   ),
    //   selectedBuilding: null,
    //   selectedCabinet: null,
    //   selectedCalendarItem: null,
    //   selectedResearchesIds: [],
    //   selectedService: null,
    //   selectedSpecialisation: null,
    //   selectedTimetableCell: null,
    //   selectedDate: DateTime.now(),
    //   appointmentInfoData: null,
    //   researchesList: [],
    //   filteredResearchesList: [],
    //   specialisationsList: [],
    //   filteredSpecialisationsList: [],
    //   doctorsList: [],
    //   filteredDoctorsList: [],
    //   cabinetsList: [],
    //   filteredCabinetsList: [],
    //   calendarList: [],
    //   timetableCellsList: [],
    //   timetableLogsList: [],
    //   selectedPayType: null,
    //   paymentUrl: null,
    //   createdAppointmentId: null,
    // ));
  }

  /// Регистрация заказа (в сбере???)
  Future<void> registerOrder({
    required String userId,
    required List<String> appointmentIds,
  }) async {
    emit(state.copyWith(
      registerOrderStatus: RegisterOrderStatuses.loading,
    ));
    try {
      final RegisterOrderResponseModel response;
      response = await subscribeRepository.registerOrder(
        userId: userId,
        appointmentIds: appointmentIds,
      );
      emit(state.copyWith(
        registerOrderStatus: RegisterOrderStatuses.success,
        paymentUrl: response.paymentUrl,
      ));
      Future.delayed(const Duration(seconds: 2), () {
        emit(
            state.copyWith(registerOrderStatus: RegisterOrderStatuses.initial));
      });
    } catch (e) {
      emit(state.copyWith(registerOrderStatus: RegisterOrderStatuses.failed));
    }
  }

  void getAvailableDoctor({
    required String scheduleId,
    required String clinicId,
  }) async {
    emit(state.copyWith(
      getAvailableDoctorStatus: GetAvailableDoctorStatuses.loading,
    ));
    try {
      final AvailableDoctor response;
      response = await subscribeRepository.getAvailableDoctor(
        scheduleId: scheduleId,
        clinicId: clinicId,
      );
      emit(state.copyWith(
        getAvailableDoctorStatus: GetAvailableDoctorStatuses.success,
        isAnyDoctor: true,
        selectedDoctor: () => response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getAvailableDoctorStatus: GetAvailableDoctorStatuses.failed));
    }
  }

  void clearSelectedDoctor() async {
    emit(state.copyWith(
      isAnyDoctor: false,
      selectedDoctor: () => null
    ));
  }

  /// Добавляет доктора в избранных
  void setDoctorToFavoritesList({
    required String userId,
    required String buildingId,
    required String clinicId,
    required String doctorId,
    required String categoryType,
  }) async {
    emit(state.copyWith(
      setDoctorToFavoritesStatus: SetDoctorToFavoritesStatuses.loading,
    ));
    try {
      await subscribeRepository.setDoctorToFavorites(
        userId: userId,
        clinicId: clinicId,
        buildingId: buildingId,
        doctorId: doctorId,
        categoryType: categoryType,
      );
      emit(
        state.copyWith(
          setDoctorToFavoritesStatus: SetDoctorToFavoritesStatuses.success,
          selectedDoctor: () => state.selectedDoctor?.copyWith(isFavorite: true),
          filteredDoctorsList: state.filteredDoctorsList
              ?.map((e) => e.id != doctorId ? e : e.copyWith(isFavorite: true))
              .toList(),
        ),
      );
      AppToast.showAppToast(msg: 'Врач добавлен в избранные');
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          setDoctorToFavoritesStatus: SetDoctorToFavoritesStatuses.failed));
    }
  }

  /// Удаляет доктора из избранных
  void deleteDoctorFromFavoritesList({
    required String userId,
    required String doctorId,
    required String categoryType,
  }) async {
    emit(state.copyWith(
      deleteDoctorFromFavoritesStatus:
          DeleteDoctorFromFavoritesStatuses.loading,
    ));
    try {
      await subscribeRepository.deleteDoctorFromFavorites(
        userId: userId,
        doctorId: doctorId,
        categoryType: categoryType,
      );
      emit(state.copyWith(
        deleteDoctorFromFavoritesStatus:
            DeleteDoctorFromFavoritesStatuses.success,
        selectedDoctor: () => state.selectedDoctor?.copyWith(isFavorite: false),
        filteredDoctorsList: state.filteredDoctorsList
            ?.map((e) => e.id != doctorId ? e : e.copyWith(isFavorite: false))
            .toList(),
        favoriteDoctorsList:
            state.favoriteDoctorsList?.where((e) => e.id != doctorId).toList(),
        filteredFavoriteDoctorsList:
            state.favoriteDoctorsList?.where((e) => e.id != doctorId).toList(),
      ));
      AppToast.showAppToast(msg: 'Врач удален из избранного');
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          deleteDoctorFromFavoritesStatus:
              DeleteDoctorFromFavoritesStatuses.failed));
    }
  }

  /// Задать новое значение PayType. Способ оплаты
  void setPayType({
    required String payType,
  }) async {
    emit(state.copyWith(
      selectedPayType: payType,
    ));
  }

  /// Получение аватарки врача по id
  Future<File> getDoctorAvatarById(
      {required String avatarId, required bool isThumbnail}) async {
    try {
      File file = await DefaultCacheManager().getSingleFile(
        '${ApiConstants.baseUrl}/api/v1.0/doctors/image/$avatarId?isThumbnail=$isThumbnail',
        key: avatarId,
        headers: {
          'Authorization':
              'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
        },
      );
      return file;
    } catch (err) {
      rethrow;
    }
  }

  /// Получение полной информации о враче
  Future<void> getDoctorInfo({
    required String doctorId,
    required int categoryTypeId,
  }) async {
    // if (state.selectedDoctorFullData != null &&
    //     state.selectedDoctorFullData!.id == doctorId) {
    //   return;
    // }
    emit(state.copyWith(
      getDoctorInfoDataStatus: GetDoctorInfoDataStatuses.loading,
    ));
    try {
      DoctorInfoDataModel response =
          await subscribeRepository.getDoctorInfoData(
        doctorId: doctorId,
        categoryTypeId: categoryTypeId,
      );
      emit(state.copyWith(
        getDoctorInfoDataStatus: GetDoctorInfoDataStatuses.success,
        selectedDoctorFullData: response,
      ));
      return;
    } catch (e) {
      emit(state.copyWith(
          getDoctorInfoDataStatus: GetDoctorInfoDataStatuses.failed));
      rethrow;
    }
  }
}

String getDynamicParams({
  required bool isAny,
  String? doctorId,
  String? specialisationId,
  List<String>? researchIds,
  String? cabinet,
}) {
  if (doctorId != null && specialisationId != null && !isAny) {
    return '&doctorId=$doctorId';
  }
  if (researchIds != null &&
      researchIds.isNotEmpty &&
      cabinet == null &&
      isAny) {
    return '&ResearchIds=${researchIds.join('&ResearchIds=')}';
  }
  if (researchIds != null && researchIds.isNotEmpty && cabinet != null) {
    return '&ResearchIds=${researchIds.join('&ResearchIds=')}&Cabinet=$cabinet';
  }
  if (researchIds != null &&
      researchIds.isNotEmpty &&
      doctorId != null &&
      !isAny) {
    return '&ResearchIds=${researchIds.join('&ResearchIds=')}&DoctorId=$doctorId';
  }
  // Избранные
  if (doctorId != null && specialisationId == null && !isAny) {
    return '&doctorId=$doctorId';
  }
  if (researchIds == null && cabinet == null && isAny) {
    return '&SpecializationId=$specialisationId';
  }
  return '';
}
