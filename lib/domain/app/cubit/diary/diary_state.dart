part of 'diary_cubit.dart';

enum GetDiaryStatuses { initial, loading, success, failed }
enum GetDiaryCategoriesStatuses { initial, loading, success, failed }

class DiaryState {
  final GetDiaryStatuses? getDiaryStatuses;
  final GetDiaryCategoriesStatuses? getDiaryCategoriesStatuses;
  final List<DiaryModel>? diariesList;
  final List<DiaryCategoryModel>? diariesCategoriesList;
  final DiaryModel? selectedDiary;
  final DateTime dateFrom;
  final DateTime dateTo;

  DiaryState({
    this.getDiaryStatuses,
    this.getDiaryCategoriesStatuses,
    this.diariesList,
    this.diariesCategoriesList,
    this.selectedDiary,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) : dateFrom = dateFrom ?? date_utils.DateUtils.lastDayOfMonth(DateTime.now()),
      dateTo = dateTo ?? date_utils.DateUtils.firstDayOfMonth(DateTime.now());

  DiaryState copyWith({
    GetDiaryStatuses? getDiaryStatuses,
    GetDiaryCategoriesStatuses? getDiaryCategoriesStatuses,
    List<DiaryModel>? diariesList,
    List<DiaryCategoryModel>? diariesCategoriesList,
    DiaryModel? selectedDiary,
    String? selectedDiaryTitle,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) {
    return DiaryState(
      getDiaryStatuses: getDiaryStatuses ?? this.getDiaryStatuses,
      getDiaryCategoriesStatuses: getDiaryCategoriesStatuses ?? this.getDiaryCategoriesStatuses,
      diariesList: diariesList ?? this.diariesList,
      diariesCategoriesList: diariesCategoriesList ?? this.diariesCategoriesList,
      selectedDiary: selectedDiary ?? this.selectedDiary,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo
    );
  }
}
