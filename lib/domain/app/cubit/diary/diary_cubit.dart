import 'package:bloc/bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/data/repository/diary_repository.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;

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
  }) async {
    emit(state.copyWith(
      getDiaryStatuses: GetDiaryStatuses.loading,
    ));
    try {
      final List<DiaryModel> response;
      response = await diaryRepository.getDiaries(
        project: project,
        platform: platform,
        grouping: grouping,
        dateFrom: dateFrom,
        dateTo: dateTo
      );
      emit(state.copyWith(
        getDiaryStatuses: GetDiaryStatuses.success,
        diariesList: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        getDiaryStatuses: GetDiaryStatuses.failed)
      );
    }
  }

}
