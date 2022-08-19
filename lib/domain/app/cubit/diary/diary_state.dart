part of 'diary_cubit.dart';

enum GetDiaryStatuses { initial, loading, success, failed }
enum GetDiaryCategoriesStatuses { initial, loading, success, failed }
enum UpdateDiaryStatuses { initial, loading, success, failed }

class DiaryState {
  final GetDiaryStatuses? getDiaryStatuses;
  final GetDiaryCategoriesStatuses? getDiaryCategoriesStatuses;
  final UpdateDiaryStatuses? updateDiaryStatuses;

  final List<DiaryModel>? diariesList;
  final List<DiaryCategoryModel>? diariesCategoriesList;
  final List<DiaryCategoryModel>? filteredDiariesCategoriesList;
  final List<String> filteredSyns;
  final DiaryModel? selectedDiary;
  final DateTime dateFrom;
  final DateTime dateTo;

  DiaryState({
    this.getDiaryStatuses,
    this.getDiaryCategoriesStatuses,
    this.diariesList,
    this.diariesCategoriesList,
    this.selectedDiary,
    this.updateDiaryStatuses,
    this.filteredDiariesCategoriesList,
    List<String>? filteredSyns,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) : dateFrom = dateFrom ?? date_utils.DateUtils.lastDayOfMonth(DateTime.now()),
      dateTo = dateTo ?? date_utils.DateUtils.firstDayOfMonth(DateTime.now()),
      filteredSyns = filteredSyns ?? [];

  DiaryState copyWith({
    GetDiaryStatuses? getDiaryStatuses,
    GetDiaryCategoriesStatuses? getDiaryCategoriesStatuses,
    UpdateDiaryStatuses? updateDiaryStatuses,
    List<DiaryModel>? diariesList,
    List<DiaryCategoryModel>? diariesCategoriesList,
    List<DiaryCategoryModel>? filteredDiariesCategoriesList,
    DiaryModel? selectedDiary,
    String? selectedDiaryTitle,
    List<String>? filteredSyns,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) {
    return DiaryState(
      getDiaryStatuses: getDiaryStatuses ?? this.getDiaryStatuses,
      getDiaryCategoriesStatuses: getDiaryCategoriesStatuses ?? this.getDiaryCategoriesStatuses,
      diariesList: diariesList ?? this.diariesList,
      diariesCategoriesList: diariesCategoriesList ?? this.diariesCategoriesList,
      filteredDiariesCategoriesList: filteredDiariesCategoriesList ?? this.filteredDiariesCategoriesList,
      selectedDiary: selectedDiary ?? this.selectedDiary,
      filteredSyns: filteredSyns ?? this.filteredSyns,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo
    );
  }
}
