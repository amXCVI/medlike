import 'package:bloc/bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/data/repository/clinics_repository.dart';
import 'package:meta/meta.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

part 'clinics_state.dart';

class ClinicsCubit extends Cubit<ClinicsState> {
  ClinicsCubit(this.clinicsRepository) : super(const ClinicsState());

  final ClinicsRepository clinicsRepository;

  void getAllClinicsList(bool isRefresh) async {
    if (!isRefresh &&
        state.getAllClinicsListStatus == GetAllClinicsListStatuses.success &&
        state.clinicsList!.isNotEmpty) {
      return;
    }
    emit(state.copyWith(
      getAllClinicsListStatus: GetAllClinicsListStatuses.loading,
    ));
    try {
      final List<ClinicModel> response;
      response = await clinicsRepository.getAllClinicsList();
      emit(state.copyWith(
        getAllClinicsListStatus: GetAllClinicsListStatuses.success,
        clinicsList: response,
      ));

      /// Далее все строения получают адрес с широтой и долготой.
      /// И Дальше используются уже они
      /// Возможно, не самое красивое решение, сделал так из-за того, что планировал
      /// использовать сервис с ограничениями по кол-ву запросов в минуту
      final YandexGeocoder geocoder = YandexGeocoder(apiKey: AppConstants.yandexMapApiKey);
      response.forEach((clinic) => clinic.buildings.forEach((e) => {
            Future.delayed((const Duration(milliseconds: 2200)), () async {
              final GeocodeResponse geocodeFromAddress = await geocoder.getGeocode(GeocodeRequest(
                geocode: AddressGeocode(address: e.address),
                lang: Lang.ru,
              ));
              BuildingLatLngModel building = BuildingLatLngModel(
                name: e.name,
                departmentName: e.departmentName,
                address: e.address,
                id: e.id,
                buildingId: e.buildingId,
                phone: e.phone,
                workTime: e.workTime,
                latitude: geocodeFromAddress.firstPoint?.latitude ?? 47.23617,
                longitude: geocodeFromAddress.firstPoint?.longitude ?? 38.89688,
              );
              addBuildingWithAddress(building);
            })
          }));
    } catch (e) {
      emit(state.copyWith(
          getAllClinicsListStatus: GetAllClinicsListStatuses.failed));
    }
  }

  void getPriceList(String clinicId) async {
    emit(state.copyWith(
      getPriceListStatus: GetPriceListStatuses.loading,
    ));
    try {
      final List<PriceItemModel> response;
      response = await clinicsRepository.getPriceList(clinicId);
      emit(state.copyWith(
        getPriceListStatus: GetPriceListStatuses.success,
        priceList: response,
        filteredPriceList: response,
      ));
    } catch (e) {
      emit(state.copyWith(getPriceListStatus: GetPriceListStatuses.failed));
    }
  }

  void filterPriceList(String filterStr) {
    final List<PriceItemModel> filteredList;
    filteredList = state.priceList!
        .where((element) =>
            element.title.toLowerCase().contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredPriceList: filteredList,
    ));
  }

  /// Получить список промоакций для клиники
  void getPromotionsList({required String clinicId}) async {
    emit(state.copyWith(
      getPromotionsListStatus: GetPromotionsListStatuses.loading,
    ));
    try {
      final List<ClinicPromotionModel> response;
      response = await clinicsRepository.getPromotionsList(clinicId: clinicId);
      emit(state.copyWith(
        getPromotionsListStatus: GetPromotionsListStatuses.success,
        promotionsList: response,
      ));
    } catch (e) {
      emit(state.copyWith(
          getPromotionsListStatus: GetPromotionsListStatuses.failed));
    }
  }

  /// Получить список промоакций для баннера на стартовой странице
  void getMainscreenPromotionsList({bool isRefresh = false}) async {
    if (!isRefresh &&
        state.getMainscreenPromotionsListStatus ==
            GetMainscreenPromotionsListStatuses.success &&
        state.mainscreenPromotionsList!.isNotEmpty) {
      return;
    }
    emit(state.copyWith(
      getMainscreenPromotionsListStatus:
          GetMainscreenPromotionsListStatuses.loading,
    ));
    try {
      final List<MainscreenPromotionModel> response;
      response = await clinicsRepository.getMainscreenPromotionsList();
      emit(state.copyWith(
        getMainscreenPromotionsListStatus:
            GetMainscreenPromotionsListStatuses.success,
        mainscreenPromotionsList: response,
      ));
    } catch (e) {
      emit(state.copyWith(
          getMainscreenPromotionsListStatus:
              GetMainscreenPromotionsListStatuses.failed));
    }
  }

  /// Добавляет строение в списочек всех существующих строений
  /// Нужен для карты, потому что запрос адреса можно делать только раз в 2 секунды - долго
  void addBuildingWithAddress(BuildingLatLngModel building) {
    emit(state.copyWith(
        allDownloadedBuildings: state.allDownloadedBuildings != null
            ? [...?state.allDownloadedBuildings, building]
            : [building].toList()));
  }
}
