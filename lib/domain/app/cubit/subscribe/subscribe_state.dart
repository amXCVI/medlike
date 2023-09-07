part of 'subscribe_cubit.dart';

enum GetAvailableClinicsListStatuses { initial, loading, success, failed }

enum GetServicesListStatuses { initial, loading, success, failed }

enum GetResearchesListStatuses { initial, loading, success, failed }

enum GetSpecialisationsListStatuses { initial, loading, success, failed }

enum GetDoctorsListStatuses { initial, loading, success, failed }

enum GetCabinetsListStatuses { initial, loading, success, failed }

enum GetFavoriteDoctorsListStatuses { initial, loading, success, failed }

enum GetCalendarStatuses { initial, loading, success, failed }

enum GetTimetableCellsStatuses { initial, loading, success, failed, refunded }

enum GetAppointmentInfoStatuses { initial, loading, success, failed }

enum CheckAndLockAvailableCellStatuses { initial, loading, success, failed }

enum CreatingAppointmentStatuses {
  initial,
  loading,
  success,
  failed,
  finished,
  createdDraft
}

enum GetAvailableDoctorStatuses { initial, loading, success, failed }

enum UnlockCellStatuses { initial, loading, success, failed }

enum SetDoctorToFavoritesStatuses { initial, loading, success, failed }

enum DeleteDoctorFromFavoritesStatuses { initial, loading, success, failed }

enum RegisterOrderStatuses { initial, loading, success, failed, finished }

enum GetDoctorInfoDataStatuses { initial, loading, success, failed }

@immutable
class SubscribeState {
  final UserProfile? selectedUser;

  final GetAvailableClinicsListStatuses? getAvailableClinicsStatus;
  final List<AvailableClinic>? availableClinicsList;
  final AvailableClinic? selectedBuilding;

  final GetServicesListStatuses? getServicesListStatus;
  final List<NavigationItem>? servicesList;
  final NavigationItem? selectedService;

  final GetResearchesListStatuses? getResearchesListStatus;
  final List<Research>? researchesList;
  final List<String>? selectedResearchesIds;
  final List<Research>? filteredResearchesList;

  final GetSpecialisationsListStatuses? getSpecialisationsListStatus;
  final List<NavigationItem>? specialisationsList;
  final NavigationItem? selectedSpecialisation;
  final List<NavigationItem>? filteredSpecialisationsList;

  final GetDoctorsListStatuses? getDoctorsListStatus;
  final List<Doctor>? doctorsList;
  final AvailableDoctor? selectedDoctor;
  final bool? isAnyDoctor;
  final List<Doctor>? filteredDoctorsList;

  final GetCabinetsListStatuses? getCabinetsListStatus;
  final List<Cabinet>? cabinetsList;
  final Cabinet? selectedCabinet;
  final List<Cabinet>? filteredCabinetsList;

  final GetFavoriteDoctorsListStatuses? getFavoriteDoctorsListStatus;
  final List<FavoriteDoctor>? favoriteDoctorsList;
  final List<FavoriteDoctor>? filteredFavoriteDoctorsList;

  final GetCalendarStatuses? getCalendarStatus;
  final List<CalendarModel>? calendarList;
  final CalendarModel? selectedCalendarItem;

  final GetTimetableCellsStatuses? getTimetableCellsStatus;
  final List<TimetableCellModel>? timetableCellsList;
  final List<TimetableLogModel>? timetableLogsList;
  final TimetableCellModel? selectedTimetableCell;

  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDate;

  final GetAppointmentInfoStatuses? getAppointmentInfoStatus;
  final AppointmentInfoModel? appointmentInfoData;

  final String? createdAppointmentId;

  final CheckAndLockAvailableCellStatuses? checkAndLockAvailableCellStatus;

  final UnlockCellStatuses? unlockCellStatus;

  final CreatingAppointmentStatuses? creatingAppointmentStatus;

  final GetAvailableDoctorStatuses? getAvailableDoctorStatus;

  final SetDoctorToFavoritesStatuses? setDoctorToFavoritesStatus;

  final DeleteDoctorFromFavoritesStatuses? deleteDoctorFromFavoritesStatus;

  final String? selectedPayType;

  final RegisterOrderStatuses? registerOrderStatus;

  final String? paymentUrl;

  final GetDoctorInfoDataStatuses? getDoctorInfoDataStatus;
  final DoctorInfoDataModel? selectedDoctorFullData;

  SubscribeState({
    this.selectedUser,
    this.getAvailableClinicsStatus,
    this.availableClinicsList,
    this.selectedBuilding,
    this.getServicesListStatus,
    this.servicesList,
    this.selectedService,
    this.getResearchesListStatus,
    this.researchesList,
    this.selectedResearchesIds,
    this.filteredResearchesList,
    this.getSpecialisationsListStatus,
    this.specialisationsList,
    this.selectedSpecialisation,
    this.filteredSpecialisationsList,
    this.getDoctorsListStatus,
    this.doctorsList,
    this.selectedDoctor,
    this.isAnyDoctor,
    this.filteredDoctorsList,
    this.getCabinetsListStatus,
    this.cabinetsList,
    this.filteredCabinetsList,
    this.selectedCabinet,
    this.getFavoriteDoctorsListStatus,
    this.favoriteDoctorsList,
    this.filteredFavoriteDoctorsList,
    this.getCalendarStatus,
    this.calendarList,
    this.selectedCalendarItem,
    this.getTimetableCellsStatus,
    this.timetableCellsList,
    this.timetableLogsList,
    this.selectedTimetableCell,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? selectedDate,
    this.getAppointmentInfoStatus,
    this.appointmentInfoData,
    this.checkAndLockAvailableCellStatus,
    this.unlockCellStatus,
    this.creatingAppointmentStatus,
    this.getAvailableDoctorStatus,
    this.setDoctorToFavoritesStatus,
    this.deleteDoctorFromFavoritesStatus,
    this.selectedPayType = AppConstants.noPayedPayType,
    this.registerOrderStatus,
    this.paymentUrl,
    this.createdAppointmentId,
    this.getDoctorInfoDataStatus,
    this.selectedDoctorFullData,
  })  : endDate =
            endDate ?? date_utils.DateUtils.lastDayOfMonth(DateTime.now()),
        startDate =
            startDate ?? date_utils.DateUtils.firstDayOfMonth(DateTime.now()),
        selectedDate = selectedDate ?? DateTime.now();

  SubscribeState copyWith({
    UserProfile? selectedUser,
    GetAvailableClinicsListStatuses? getAvailableClinicsStatus,
    List<AvailableClinic>? availableClinicsList,
    AvailableClinic? selectedBuilding,
    GetServicesListStatuses? getServicesListStatus,
    List<NavigationItem>? servicesList,
    NavigationItem? selectedService,
    GetResearchesListStatuses? getResearchesListStatus,
    List<Research>? researchesList,
    List<String>? selectedResearchesIds,
    List<Research>? filteredResearchesList,
    GetSpecialisationsListStatuses? getSpecialisationsListStatus,
    List<NavigationItem>? specialisationsList,
    NavigationItem? selectedSpecialisation,
    List<NavigationItem>? filteredSpecialisationsList,
    GetDoctorsListStatuses? getDoctorsListStatus,
    List<Doctor>? doctorsList,
    ValueGetter<AvailableDoctor?>? selectedDoctor,
    bool? isAnyDoctor,
    List<Doctor>? filteredDoctorsList,
    GetCabinetsListStatuses? getCabinetsListStatus,
    List<Cabinet>? cabinetsList,
    ValueGetter<Cabinet?>? selectedCabinet,
    GetFavoriteDoctorsListStatuses? getFavoriteDoctorsListStatus,
    List<FavoriteDoctor>? favoriteDoctorsList,
    List<FavoriteDoctor>? filteredFavoriteDoctorsList,
    List<Cabinet>? filteredCabinetsList,
    GetCalendarStatuses? getCalendarStatus,
    List<CalendarModel>? calendarList,
    CalendarModel? selectedCalendarItem,
    GetTimetableCellsStatuses? getTimetableCellsStatus,
    List<TimetableCellModel>? timetableCellsList,
    List<TimetableLogModel>? timetableLogsList,
    ValueGetter<TimetableCellModel?>? selectedTimetableCell,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? selectedDate,
    GetAppointmentInfoStatuses? getAppointmentInfoStatus,
    AppointmentInfoModel? appointmentInfoData,
    CheckAndLockAvailableCellStatuses? checkAndLockAvailableCellStatus,
    CreatingAppointmentStatuses? creatingAppointmentStatus,
    GetAvailableDoctorStatuses? getAvailableDoctorStatus,
    UnlockCellStatuses? unlockCellStatus,
    SetDoctorToFavoritesStatuses? setDoctorToFavoritesStatus,
    DeleteDoctorFromFavoritesStatuses? deleteDoctorFromFavoritesStatus,
    String? selectedPayType,
    RegisterOrderStatuses? registerOrderStatus,
    String? paymentUrl,
    ValueGetter<String?>? createdAppointmentId,
    GetDoctorInfoDataStatuses? getDoctorInfoDataStatus,
    DoctorInfoDataModel? selectedDoctorFullData,
  }) {
    return SubscribeState(
      selectedUser: selectedUser ?? this.selectedUser,
      getAvailableClinicsStatus:
          getAvailableClinicsStatus ?? this.getAvailableClinicsStatus,
      availableClinicsList: availableClinicsList ?? this.availableClinicsList,
      selectedBuilding: selectedBuilding ?? this.selectedBuilding,
      getServicesListStatus:
          getServicesListStatus ?? this.getServicesListStatus,
      servicesList: servicesList ?? this.servicesList,
      selectedService: selectedService ?? this.selectedService,
      getResearchesListStatus:
          getResearchesListStatus ?? this.getResearchesListStatus,
      researchesList: researchesList ?? this.researchesList,
      selectedResearchesIds:
          selectedResearchesIds ?? this.selectedResearchesIds,
      filteredResearchesList:
          filteredResearchesList ?? this.filteredResearchesList,
      getSpecialisationsListStatus:
          getSpecialisationsListStatus ?? this.getSpecialisationsListStatus,
      specialisationsList: specialisationsList ?? this.specialisationsList,
      selectedSpecialisation:
          selectedSpecialisation ?? this.selectedSpecialisation,
      filteredSpecialisationsList:
          filteredSpecialisationsList ?? this.filteredSpecialisationsList,
      getDoctorsListStatus: getDoctorsListStatus ?? this.getDoctorsListStatus,
      doctorsList: doctorsList ?? this.doctorsList,
      isAnyDoctor: isAnyDoctor ?? this.isAnyDoctor,
      selectedDoctor:
          selectedDoctor != null ? selectedDoctor() : this.selectedDoctor,
      filteredDoctorsList: filteredDoctorsList ?? this.filteredDoctorsList,
      getCabinetsListStatus:
          getCabinetsListStatus ?? this.getCabinetsListStatus,
      cabinetsList: cabinetsList ?? this.cabinetsList,
      selectedCabinet:
          selectedCabinet != null ? selectedCabinet() : this.selectedCabinet,
      filteredCabinetsList: filteredCabinetsList ?? this.filteredCabinetsList,
      getFavoriteDoctorsListStatus:
          getFavoriteDoctorsListStatus ?? this.getFavoriteDoctorsListStatus,
      favoriteDoctorsList: favoriteDoctorsList ?? this.favoriteDoctorsList,
      filteredFavoriteDoctorsList:
          filteredFavoriteDoctorsList ?? this.filteredFavoriteDoctorsList,
      getCalendarStatus: getCalendarStatus ?? this.getCalendarStatus,
      calendarList: calendarList ?? this.calendarList,
      selectedCalendarItem: selectedCalendarItem ?? this.selectedCalendarItem,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectedDate: selectedDate ?? this.selectedDate,
      getTimetableCellsStatus:
          getTimetableCellsStatus ?? this.getTimetableCellsStatus,
      timetableCellsList: timetableCellsList ?? this.timetableCellsList,
      timetableLogsList: timetableLogsList ?? this.timetableLogsList,
      selectedTimetableCell: selectedTimetableCell != null
          ? selectedTimetableCell()
          : this.selectedTimetableCell,
      getAppointmentInfoStatus:
          getAppointmentInfoStatus ?? this.getAppointmentInfoStatus,
      appointmentInfoData: appointmentInfoData ?? this.appointmentInfoData,
      checkAndLockAvailableCellStatus: checkAndLockAvailableCellStatus ??
          this.checkAndLockAvailableCellStatus,
      creatingAppointmentStatus:
          creatingAppointmentStatus ?? this.creatingAppointmentStatus,
      getAvailableDoctorStatus:
          getAvailableDoctorStatus ?? this.getAvailableDoctorStatus,
      unlockCellStatus: unlockCellStatus ?? this.unlockCellStatus,
      setDoctorToFavoritesStatus:
          setDoctorToFavoritesStatus ?? this.setDoctorToFavoritesStatus,
      deleteDoctorFromFavoritesStatus: deleteDoctorFromFavoritesStatus ??
          this.deleteDoctorFromFavoritesStatus,
      selectedPayType: selectedPayType ?? this.selectedPayType,
      registerOrderStatus: registerOrderStatus ?? this.registerOrderStatus,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      createdAppointmentId: createdAppointmentId != null
          ? createdAppointmentId()
          : this.createdAppointmentId,
      getDoctorInfoDataStatus:
          getDoctorInfoDataStatus ?? this.getDoctorInfoDataStatus,
      selectedDoctorFullData:
          selectedDoctorFullData ?? this.selectedDoctorFullData,
    );
  }

  SubscribeState clearState() {
    return SubscribeState(
      selectedUser: null,
      getAvailableClinicsStatus: null,
      availableClinicsList: null,
      selectedBuilding: null,
      getServicesListStatus: null,
      servicesList: null,
      selectedService: null,
      getResearchesListStatus: null,
      researchesList: null,
      selectedResearchesIds: null,
      filteredResearchesList: null,
      getSpecialisationsListStatus: null,
      specialisationsList: null,
      selectedSpecialisation: null,
      filteredSpecialisationsList: null,
      getDoctorsListStatus: null,
      doctorsList: null,
      selectedDoctor: null,
      isAnyDoctor: null,
      filteredDoctorsList: null,
      getCabinetsListStatus: null,
      cabinetsList: null,
      selectedCabinet: null,
      filteredCabinetsList: null,
      getFavoriteDoctorsListStatus: null,
      favoriteDoctorsList: null,
      filteredFavoriteDoctorsList: null,
      getCalendarStatus: null,
      calendarList: null,
      selectedCalendarItem: null,
      startDate: startDate,
      endDate: endDate,
      selectedDate: selectedDate,
      getTimetableCellsStatus: null,
      timetableCellsList: null,
      timetableLogsList: null,
      selectedTimetableCell: null,
      getAppointmentInfoStatus: null,
      appointmentInfoData: null,
      checkAndLockAvailableCellStatus: null,
      creatingAppointmentStatus: null,
      getAvailableDoctorStatus: null,
      unlockCellStatus: null,
      setDoctorToFavoritesStatus: null,
      deleteDoctorFromFavoritesStatus: null,
      selectedPayType: null,
      registerOrderStatus: null,
      paymentUrl: null,
      createdAppointmentId: null,
      selectedDoctorFullData: null,
    );
  }

  List<Object?> get props => [];
}
