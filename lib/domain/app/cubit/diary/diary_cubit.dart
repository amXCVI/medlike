import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/data/repository/diary_repository.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

part 'diary_state.dart';

class DiaryCubit extends Cubit<DiaryState> {
  DiaryCubit(this.diaryRepository) : super(DiaryState());

  final DiaryRepository diaryRepository;

  /// Получить список дневников
  void getDiaryCategoriesList({
    required String project,
    required String platform,
    DateTime? updateSince,
  }) async {
    emit(state.copyWith(
      getDiaryCategoriesStatuses: GetDiaryCategoriesStatuses.loading,
      getDiaryStatuses: GetDiaryStatuses.loading,
    ));
    try {
      final List<DiaryCategoryModel> response;
      response = await diaryRepository.getDiaryCategories(
        project: project,
        platform: platform,
        updateSince: updateSince
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
        if(syn != state.selectedDiary?.syn) {
          emit(state.copyWith(
            pageUpdateStatuses: PageUpdateStatuses.loading,
          ));
        }

        final selectedDiary = response.firstWhere((element) =>
          element.syn == syn
        );

        emit(state.copyWith(
          getDiaryStatuses: GetDiaryStatuses.success,
          //diariesList: response,
          /// Здесь и далее сбрасываем состояние апдейти записей
          /// Чтобы не вызвать повторения их загрузки (см. DiaryPage)
          updateDiaryStatuses: UpdateDiaryStatuses.initial,
          selectedDiary: selectedDiary,
          dateFrom: dateFrom,
          dateTo: dateTo,
          pageUpdateStatuses: PageUpdateStatuses.initial
        ));
      } else {
        emit(state.copyWith(
          getDiaryStatuses: GetDiaryStatuses.success,
          updateDiaryStatuses: UpdateDiaryStatuses.initial,
          diariesList: response,
          dateFrom: dateFrom,
          dateTo: dateTo,
          pageUpdateStatuses: PageUpdateStatuses.initial
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getDiaryStatuses: GetDiaryStatuses.failed,
        updateDiaryStatuses: UpdateDiaryStatuses.failed)
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
    required DateTime date,
    required String syn,
    required List<double> values
  }) async {
    emit(state.copyWith(
      updateDiaryStatuses: UpdateDiaryStatuses.loading,
    ));

    try {
      final currentSelectedUserId =
        await UserSecureStorage.getField(AppConstants.selectedUserId);

      final response = await diaryRepository.postDiaryEntry(
        date: date, 
        syn: syn,
        userId: currentSelectedUserId, 
        values: values
      );

      if(response) {
        AppToast.showAppToast(msg: 'Запись добавлена');
      }

      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.failed,
      ));
    }
  }

  /// Редактировать запись
  void putDiaryEntry({
    required DateTime date,
    required DateTime oldDate,
    required String syn,
    required List<double> values
  }) async {
    emit(state.copyWith(
      updateDiaryStatuses: UpdateDiaryStatuses.loading,
    ));

    try {
      final currentSelectedUserId =
        await UserSecureStorage.getField(AppConstants.selectedUserId);

      final response = await diaryRepository.putDiaryEntry(
        date: date, 
        oldDate: oldDate,
        syn: syn,
        userId: currentSelectedUserId, 
        values: values
      );

      if(response) {
        AppToast.showAppToast(msg: 'Запись обновлена');
      }

      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.failed,
      ));
    }
  }

  /// Удалить запись
  void deleteDiaryEntry({
    required DateTime date,
    required String syn,
  }) async {
    emit(state.copyWith(
      updateDiaryStatuses: UpdateDiaryStatuses.loading,
    ));

    try {
      final currentSelectedUserId =
        await UserSecureStorage.getField(AppConstants.selectedUserId);

      final response = await diaryRepository.deleteDiaryEntry(
        date: date, 
        syn: syn,
        userId: currentSelectedUserId, 
      );

      if(response) {
        AppToast.showAppToast(msg: 'Запись удалена');
      }

      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.failed,
      ));
    }
  }
}
