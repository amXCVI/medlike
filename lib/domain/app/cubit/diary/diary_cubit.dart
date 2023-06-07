import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/data/repository/diary_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/utils/helpers/health_filters_helper.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
//import 'package:medlike/widgets/fluttertoast/toast.dart';

part 'diary_state.dart';

class DiaryCubit extends MediatorCubit<DiaryState, UserMediatorEvent>
  with RefreshErrorHandler<DiaryState, UserCubit> {
  DiaryCubit(this.diaryRepository, mediator) : super(DiaryState(), mediator) {
    mediator.register(this);
  }

  final DiaryRepository diaryRepository;

  @override
  void receive(String from, UserMediatorEvent event) {
    if (event == UserMediatorEvent.logout) {
      HealthFiltersHelper.cleanFilters();
      emit(state.copyWith(
        filteredSyns: {}
      ));
    }
  }

  /// Получить список дневников
  void getDiaryCategoriesList({
    DateTime? updateSince,
    required List<String> userIds
  }) async {
    emit(state.copyWith(
      getDiaryCategoriesStatuses: GetDiaryCategoriesStatuses.loading,
      getDiaryStatuses: GetDiaryStatuses.loading,
    ));
    try {
      final List<DiaryCategoryModel> response;
      response = await diaryRepository.getDiaryCategories(
        updateSince: updateSince
      );
      Map<String, List<String>>? filters;

      if(state.filteredSyns == null) {
        /// Получить фильтры из HealtFiltersHelper
        filters = await HealthFiltersHelper.loadFilters(userIds);

        emit(state.copyWith(
          filteredSyns: filters
        ));
      } else {
        filters = state.filteredSyns;
      }

      final filredSyns = filters?[state.userId] ?? [];

      emit(state.copyWith(
        getDiaryCategoriesStatuses: GetDiaryCategoriesStatuses.success,
        filteredDiariesCategoriesList: response.where((element) 
          => !filredSyns.contains(element.synonim)).toList(),
        diariesCategoriesList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
        getDiaryCategoriesStatuses: GetDiaryCategoriesStatuses.failed)
      );
    }
  }

  /// Получить список дневников
  void getDiariesList({
    required String grouping,
    DateTime? dateFrom,
    DateTime? dateTo, 
    String? syn
  }) async {
    emit(state.copyWith(
      getDiaryStatuses: GetDiaryStatuses.loading,
      //updateDiaryStatuses: UpdateDiaryStatuses.loading
    ));
    try {
      final date = DateTime.now();
      final startDate = date.subtract(const Duration(
        days: 365
      ));
      final endDate = date.add(const Duration(
        days: 365
      ));

      final List<DiaryModel> response;
      response = await diaryRepository.getDiaries(
        grouping: grouping,
        dateFrom: startDate,
        dateTo: endDate,
        userId: state.userId,
        //synFilter: syn
      );

      final flatResponse = response.map((e) => DiaryFlatModel(
        syn: e.syn, 
        firstValue: e.firstValue, 
        currentValue: e.getCurrentValue, 
        values: DataItem.toFlat(e.values), 
        grouping: e.grouping)
      ).toList();
      
      emit(state.copyWith(
        getDiaryStatuses: GetDiaryStatuses.success,
        //updateDiaryStatuses: UpdateDiaryStatuses.initial,
        diariesList: flatResponse,
        pageUpdateStatuses: PageUpdateStatuses.initial
      ));

      if(syn != null) {
        setTimePeriod(
          start: dateFrom!, 
          end: dateTo!, 
          syn: syn
        );
      }
    } catch (e) {
      addError(e);
      emit(state.copyWith(
        getDiaryStatuses: GetDiaryStatuses.failed,
        updateDiaryStatuses: UpdateDiaryStatuses.failed)
      );
    }
  }

  void setTimePeriod({
    required DateTime start,
    required DateTime end,
    required String syn
  }) {
    final selectedDiary = state.diariesList!.firstWhere((element) =>
      element.syn == syn
    );

    emit(state.copyWith(
      selectedDiary: selectedDiary,
      updateDiaryStatuses: UpdateDiaryStatuses.success,
      periodedSelectedDiary: ValueHelper.filterByPeriod(
        diariesList: selectedDiary, 
        start: start, 
        end: end
      ),
      //dateFrom: start,
      //dateTo: end
    ));
  }

  /// Фильтровать дневники
  void setFiltered({
    required String userId,
    required List<String> userFilteredSyns
  }) {
    final filteredSyns = state.filteredSyns;
    filteredSyns?[userId] = userFilteredSyns;

    HealthFiltersHelper.setFilters(
      filteredSyns ?? {}
    );

    emit(state.copyWith(
      filteredDiariesCategoriesList: state.diariesCategoriesList!.where((element) 
        => !userFilteredSyns.contains(element.synonim)).toList(),
      filteredSyns: filteredSyns
    ));
  } 

  /// Отправить запись
  void postDiaryEntry({
    required DateTime date,
    required String syn,
    required List<double> values,
    DateTime? updateFrom,
    DateTime? updateTo
  }) async {
    emit(state.copyWith(
      updateDiaryStatuses: UpdateDiaryStatuses.loading,
    ));

    try {
      final response = await diaryRepository.postDiaryEntry(
        date: date, 
        syn: syn,
        userId: state.userId, 
        values: values
      );

      if(response) {
        if(updateFrom != null && updateTo != null) {
          getDiariesList(
            grouping: 'None',
            dateFrom: updateFrom,
            dateTo: updateTo,
            syn: syn
          );
        }

        //AppToast.showAppToast(msg: 'Запись добавлена');
      }

    } catch (e) {
      getDiariesList(
        grouping: 'None',
        dateFrom: updateFrom,
        dateTo: updateTo ,
        syn: syn
      );
    }
  }

  /// Редактировать запись
  void putDiaryEntry({
    required DateTime date,
    required DateTime oldDate,
    required String syn,
    required List<double> values,
    DateTime? updateFrom,
    DateTime? updateTo
  }) async {
    emit(state.copyWith(
      updateDiaryStatuses: UpdateDiaryStatuses.loading,
      getDiaryStatuses: GetDiaryStatuses.loading
    ));

    try {
      final response = await diaryRepository.putDiaryEntry(
        date: date, 
        oldDate: oldDate,
        syn: syn,
        userId: state.userId, 
        values: values
      );

      if(response) {
        if(updateFrom != null && updateTo != null) {
          getDiariesList(
            grouping: 'None',
            dateFrom: updateFrom,
            dateTo: updateTo ,
            syn: syn
          );
        }

        //AppToast.showAppToast(msg: 'Запись отредактирована');
      }
    } catch (e) {
      /* В случае ошибки пытаемся получить показатели */

      getDiariesList(
        grouping: 'None',
        dateFrom: updateFrom,
        dateTo: updateTo ,
        syn: syn
      );
    }
  }

  /// Удалить запись
  void deleteDiaryEntry({
    required DateTime date,
    required String syn,
    DateTime? updateFrom,
    DateTime? updateTo
  }) async {
    emit(state.copyWith(
      updateDiaryStatuses: UpdateDiaryStatuses.loading,
      getDiaryStatuses :GetDiaryStatuses.loading
    ));

    try {
      final response = await diaryRepository.deleteDiaryEntry(
        date: date, 
        syn: syn,
        userId: state.userId, 
      );

      if(response) {
        if(updateFrom != null && updateTo != null) {
          getDiariesList(
            grouping: 'None',
            dateFrom: updateFrom,
            dateTo: updateTo ,
            syn: syn
          );
        }

        //AppToast.showAppToast(msg: 'Запись удалена');
      }
    } catch (e) {
      getDiariesList(
        grouping: 'None',
        dateFrom: updateFrom,
        dateTo: updateTo ,
        syn: syn
      );
    }
  }

  void setUserId(String userId) {
    emit(state.copyWith(
      userId: userId
    ));
  }
}
