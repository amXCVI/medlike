import 'package:bloc/bloc.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/data/repository/medcard_repository.dart';
import 'package:meta/meta.dart';

part 'medcard_state.dart';

class MedcardCubit extends Cubit<MedcardState> {
  MedcardCubit(this.medcardRepository) : super(const MedcardState());

  final MedcardRepository medcardRepository;

  void getMedcardDocsList(
      {required bool isRefresh, required String userId}) async {
    emit(state.copyWith(
      getMedcardDocsListStatus: GetMedcardDocsListStatuses.loading,
    ));
    try {
      final List<MedcardDocsModel> response;
      response = await medcardRepository.getMedcardDocsList(userId: userId);
      emit(state.copyWith(
        getMedcardDocsListStatus: GetMedcardDocsListStatuses.success,
        medcardDocsList: response,
        filteredMedcardDocsList: response,
      ));
    } catch (e) {
      emit(state.copyWith(
          getMedcardDocsListStatus: GetMedcardDocsListStatuses.failed));
    }
  }

  void filterMedcardDocsList(String filterStr) {
    final List<MedcardDocsModel> filteredList;
    filteredList = state.medcardDocsList!
        .where((element) =>
            element.nameDoc.toLowerCase().contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredMedcardDocsList: filteredList,
    ));
  }
}
