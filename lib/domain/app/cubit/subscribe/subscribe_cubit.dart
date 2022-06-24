import 'package:bloc/bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/data/repository/subscribe_repository.dart';
import 'package:medlike/utils/helpers/date_helpers.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:meta/meta.dart';

part 'subscribe_state.dart';

class SubscribeCubit extends Cubit<SubscribeState> {
  SubscribeCubit(this.subscribeRepository) : super(SubscribeState());

  final SubscribeRepository subscribeRepository;

  /// Получает список доступных клиник для записи к врачу
  void getAvailableClinicsList(String userId, bool isRefresh) async {
    if (!isRefresh &&
        state.getAvailableClinicsStatus ==
            GetAvailableClinicsListStatuses.success &&
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
        selectedResearchesIds: <String>[],
      ));
    } catch (e) {
      emit(state.copyWith(
          getResearchesListStatus: GetResearchesListStatuses.failed));
    }
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
  void setSelectedSpecialisation(NavigationItem specialisation) {
    emit(state.copyWith(
      selectedSpecialisation: specialisation,
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
      ));
    } catch (e) {
      emit(state.copyWith(
          getFavoriteDoctorsListStatus: GetFavoriteDoctorsListStatuses.failed));
    }
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
            .map((e) => DateUtils.getDateStr(e.date))
            .contains(DateUtils.getDateStr(startDate ?? state.startDate)) &&
        state.calendarList!
            .map((e) => DateUtils.getDateStr(e.date))
            .contains(DateUtils.getDateStr(endDate ?? state.endDate))) {
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
        endDate: endDate ?? state.endDate,
        startDate: startDate ?? state.startDate,
        dynamicParams: getDynamicParams(
          isAny: isAny,
          doctorId: doctorId,
          specialisationId: specialisationId,
          researchIds: researchIds,
          cabinet: cabinet,
        ),
      );
      emit(state.copyWith(
        getCalendarStatus: GetCalendarStatuses.success,

        /// Здесь даты приводятся к внутреннему формату. Добавляется таймзона (часы)
        /// Массив не перезаписывается, а конкатенируется. Чтобы при перелистывании не
        /// загружать его каждый раз заново
        calendarList: isRefresh
            ? response.map((e) {
                return e.copyWith(date: dateTimeToUTC(e.date));
              }).toList()
            : {
                ...?state.calendarList,
                ...response.map((e) {
                  return e.copyWith(date: dateTimeToUTC(e.date));
                }).toList()
              }.toList(),
      ));
    } catch (e) {
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
        timetableCellsList: response.cells,
        timetableLogsList: response.logs,
      ));
    } catch (e) {
      emit(state.copyWith(
          getTimetableCellsStatus: GetTimetableCellsStatuses.failed));
    }
  }

  void setEmptyTimetableList() {
    emit(state.copyWith(timetableCellsList: [], timetableLogsList: []));
  }

  void setSelectedTimetableCell(TimetableCellModel selectedCell) {
    emit(state.copyWith(selectedTimetableCell: selectedCell));
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
  if (researchIds == null && cabinet == null && isAny) {
    return '&SpecializationId=$specialisationId';
  }
  return '';
}
