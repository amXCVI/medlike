part of 'diary_cubit.dart';

enum GetDiaryStatuses { initial, loading, success, failed }
enum GetDiaryCategoriesStatuses { initial, loading, success, failed }
enum UpdateDiaryStatuses { initial, loading, success, failed }
enum PageUpdateStatuses { initial, loading }

class DiaryState {
  final GetDiaryStatuses? getDiaryStatuses;
  final GetDiaryCategoriesStatuses? getDiaryCategoriesStatuses;
  final UpdateDiaryStatuses? updateDiaryStatuses;
  final PageUpdateStatuses? pageUpdateStatuses;

  final List<DiaryFlatModel>? diariesList;
  final List<DiaryFlatModel>? weekDiariesList;
  final List<DiaryCategoryModel>? diariesCategoriesList;
  final List<DiaryCategoryModel>? filteredDiariesCategoriesList;
  final List<String> filteredSyns;
  final String? userId;
  final DiaryFlatModel? selectedDiary;
  final DiaryFlatModel? periodedSelectedDiary;
  final DateTime dateFrom;
  final DateTime dateTo;

  DiaryState({
    this.getDiaryStatuses,
    this.getDiaryCategoriesStatuses,
    this.diariesList,
    this.weekDiariesList,
    this.diariesCategoriesList,
    this.selectedDiary,
    this.periodedSelectedDiary,
    this.updateDiaryStatuses,
    this.pageUpdateStatuses,
    this.filteredDiariesCategoriesList,
    this.userId,
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
    PageUpdateStatuses? pageUpdateStatuses,
    List<DiaryFlatModel>? diariesList,
    List<DiaryFlatModel>? weekDiariesList,
    List<DiaryCategoryModel>? diariesCategoriesList,
    List<DiaryCategoryModel>? filteredDiariesCategoriesList,
    String? userId,
    DiaryFlatModel? selectedDiary,
    DiaryFlatModel? periodedSelectedDiary,
    String? selectedDiaryTitle,
    List<String>? filteredSyns,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) {
    return DiaryState(
      getDiaryStatuses: getDiaryStatuses ?? this.getDiaryStatuses,
      getDiaryCategoriesStatuses: getDiaryCategoriesStatuses ?? this.getDiaryCategoriesStatuses,
      updateDiaryStatuses: updateDiaryStatuses ?? this.updateDiaryStatuses,
      pageUpdateStatuses: pageUpdateStatuses ?? this.pageUpdateStatuses,
      diariesList: diariesList ?? this.diariesList,
      weekDiariesList: weekDiariesList ?? this.weekDiariesList,
      diariesCategoriesList: diariesCategoriesList ?? this.diariesCategoriesList,
      filteredDiariesCategoriesList: filteredDiariesCategoriesList ?? this.filteredDiariesCategoriesList,
      userId: userId ?? this.userId,
      selectedDiary: selectedDiary ?? this.selectedDiary,
      periodedSelectedDiary: periodedSelectedDiary ?? this.periodedSelectedDiary,
      filteredSyns: filteredSyns ?? this.filteredSyns,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo
    );
  }
}
