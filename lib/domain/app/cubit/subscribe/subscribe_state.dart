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

enum CreatingAppointmentStatuses { initial, loading, success, failed }

enum GetAvailableDoctorStatuses { initial, loading, success, failed }

enum UnlockCellStatuses { initial, loading, success, failed }

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

  final GetSpecialisationsListStatuses? getSpecialisationsListStatus;
  final List<NavigationItem>? specialisationsList;
  final NavigationItem? selectedSpecialisation;
  final List<NavigationItem>? filteredSpecialisationsList;

  final GetDoctorsListStatuses? getDoctorsListStatus;
  final List<Doctor>? doctorsList;
  final Doctor? selectedDoctor;
  final List<Doctor>? filteredDoctorsList;

  final GetCabinetsListStatuses? getCabinetsListStatus;
  final List<Cabinet>? cabinetsList;
  final Cabinet? selectedCabinet;
  final List<Cabinet>? filteredCabinetsList;

  final GetFavoriteDoctorsListStatuses? getFavoriteDoctorsListStatus;
  final List<FavoriteDoctor>? favoriteDoctorsList;

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

  final CheckAndLockAvailableCellStatuses? checkAndLockAvailableCellStatus;

  final UnlockCellStatuses? unlockCellStatus;

  final CreatingAppointmentStatuses? creatingAppointmentStatus;

  final GetAvailableDoctorStatuses? getAvailableDoctorStatus;

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
    this.getSpecialisationsListStatus,
    this.specialisationsList,
    this.selectedSpecialisation,
    this.filteredSpecialisationsList,
    this.getDoctorsListStatus,
    this.doctorsList,
    this.selectedDoctor,
    this.filteredDoctorsList,
    this.getCabinetsListStatus,
    this.cabinetsList,
    this.filteredCabinetsList,
    this.selectedCabinet,
    this.getFavoriteDoctorsListStatus,
    this.favoriteDoctorsList,
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
  })  : endDate = endDate ?? DateUtils.lastDayOfMonth(DateTime.now()),
        startDate = startDate ?? DateUtils.firstDayOfMonth(DateTime.now()),
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
    GetSpecialisationsListStatuses? getSpecialisationsListStatus,
    List<NavigationItem>? specialisationsList,
    NavigationItem? selectedSpecialisation,
    List<NavigationItem>? filteredSpecialisationsList,
    GetDoctorsListStatuses? getDoctorsListStatus,
    List<Doctor>? doctorsList,
    Doctor? selectedDoctor,
    List<Doctor>? filteredDoctorsList,
    GetCabinetsListStatuses? getCabinetsListStatus,
    List<Cabinet>? cabinetsList,
    Cabinet? selectedCabinet,
    GetFavoriteDoctorsListStatuses? getFavoriteDoctorsListStatus,
    List<FavoriteDoctor>? favoriteDoctorsList,
    List<Cabinet>? filteredCabinetsList,
    GetCalendarStatuses? getCalendarStatus,
    List<CalendarModel>? calendarList,
    CalendarModel? selectedCalendarItem,
    GetTimetableCellsStatuses? getTimetableCellsStatus,
    List<TimetableCellModel>? timetableCellsList,
    List<TimetableLogModel>? timetableLogsList,
    TimetableCellModel? selectedTimetableCell,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? selectedDate,
    GetAppointmentInfoStatuses? getAppointmentInfoStatus,
    AppointmentInfoModel? appointmentInfoData,
    CheckAndLockAvailableCellStatuses? checkAndLockAvailableCellStatus,
    CreatingAppointmentStatuses? creatingAppointmentStatus,
    GetAvailableDoctorStatuses? getAvailableDoctorStatus,
    UnlockCellStatuses? unlockCellStatus,
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
      getSpecialisationsListStatus:
          getSpecialisationsListStatus ?? this.getSpecialisationsListStatus,
      specialisationsList: specialisationsList ?? this.specialisationsList,
      selectedSpecialisation:
          selectedSpecialisation ?? this.selectedSpecialisation,
      filteredSpecialisationsList:
          filteredSpecialisationsList ?? this.filteredSpecialisationsList,
      getDoctorsListStatus: getDoctorsListStatus ?? this.getDoctorsListStatus,
      doctorsList: doctorsList ?? this.doctorsList,
      selectedDoctor: selectedDoctor ?? this.selectedDoctor,
      filteredDoctorsList: filteredDoctorsList ?? this.filteredDoctorsList,
      getCabinetsListStatus:
          getCabinetsListStatus ?? this.getCabinetsListStatus,
      cabinetsList: cabinetsList ?? this.cabinetsList,
      selectedCabinet: selectedCabinet ?? this.selectedCabinet,
      filteredCabinetsList: filteredCabinetsList ?? this.filteredCabinetsList,
      getFavoriteDoctorsListStatus:
          getFavoriteDoctorsListStatus ?? this.getFavoriteDoctorsListStatus,
      favoriteDoctorsList: favoriteDoctorsList ?? this.favoriteDoctorsList,
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
      selectedTimetableCell:
          selectedTimetableCell ?? this.selectedTimetableCell,
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
    );
  }

  List<Object?> get props => [];
}
