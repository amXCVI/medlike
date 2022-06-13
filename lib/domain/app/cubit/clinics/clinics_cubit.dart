import 'package:bloc/bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/data/repository/clinics_repository.dart';
import 'package:meta/meta.dart';

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
}
