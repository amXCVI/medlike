import 'package:bloc/bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/data/repository/diary_repository.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

part 'diary_state.dart';

class DiaryCubit extends Cubit<DiaryState> {
  DiaryCubit(this.diaryRepository) : super(DiaryState());

  final DiaryRepository diaryRepository;

  /// Получить список дневников
  void getDiaryCategoriesList({
    required String project,
    required String platform
  }) async {
    emit(state.copyWith(
      getDiaryCategoriesStatuses: GetDiaryCategoriesStatuses.loading,
    ));
    try {
      final List<DiaryCategoryModel> response;
      response = await diaryRepository.getDiaryCategories(
        project: project,
        platform: platform
      );
      emit(state.copyWith(
        getDiaryCategoriesStatuses: GetDiaryCategoriesStatuses.success,
        filteredDiariesCategoriesList: response.where((element) 
          => !state.filteredSyns.contains(element.synonim)).toList(),
        diariesCategoriesList: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        getDiaryCategoriesStatuses: GetDiaryCategoriesStatuses.failed)
      );
    }
  }

  /// Получить список дневников
  void getDiariesList({
    required String project,
    required String platform,
    required String grouping,
    DateTime? dateFrom,
    DateTime? dateTo, 
    String? syn
  }) async {
    emit(state.copyWith(
      getDiaryStatuses: GetDiaryStatuses.loading,
    ));
    try {
      final currentSelectedUserId =
        await UserSecureStorage.getField(AppConstants.selectedUserId);

      final List<DiaryModel> response;
      response = await diaryRepository.getDiaries(
        project: project,
        platform: platform,
        grouping: grouping,
        dateFrom: dateFrom,
        dateTo: dateTo,
        userId: currentSelectedUserId,
        synFilter: syn
      );
      if(syn != null) {
        final selectedDiary = response.firstWhere((element) =>
          element.syn == syn
        );

        emit(state.copyWith(
          getDiaryStatuses: GetDiaryStatuses.success,
          diariesList: response,
          selectedDiary: selectedDiary,
          dateFrom: dateFrom,
          dateTo: dateTo,
        ));
      } else {
        emit(state.copyWith(
          getDiaryStatuses: GetDiaryStatuses.success,
          diariesList: response,
          dateFrom: dateFrom,
          dateTo: dateTo,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getDiaryStatuses: GetDiaryStatuses.failed)
      );
    }
  }

  /// Фильтровать дневники
  void setFiltered(
    List<String> filteredSyns
  ) {
    emit(state.copyWith(
      filteredDiariesCategoriesList: state.diariesCategoriesList!.where((element) 
        => !filteredSyns.contains(element.synonim)).toList(),
      filteredSyns: filteredSyns
    ));
  } 

  /// Отправить запись
  void postDiaryEntry({
    required String date,
    required String syn,
    required List<double> values
  }) async {
    emit(state.copyWith(
      updateDiaryStatuses: UpdateDiaryStatuses.loading,
    ));

    try {
      final currentSelectedUserId =
        await UserSecureStorage.getField(AppConstants.selectedUserId);

      await diaryRepository.postDiaryEntry(
        date: date, 
        syn: syn,
        userId: currentSelectedUserId, 
        values: values
      );

      emit(state.copyWith(
        getDiaryCategoriesStatuses: GetDiaryCategoriesStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.failed,
      ));
    }
  }
}
