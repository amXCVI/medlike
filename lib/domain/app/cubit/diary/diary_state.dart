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
  final List<DiaryCategoryModel>? diariesCategoriesList;
  final List<DiaryCategoryModel>? filteredDiariesCategoriesList;
  /// Вроде бы фильтры по категориям 
  final Map<String, List<String>>? filteredSyns;
  final String? userId;
  final DiaryFlatModel? selectedDiary;
  final DiaryFlatModel? periodedSelectedDiary;

  DiaryState({
    this.getDiaryStatuses,
    this.getDiaryCategoriesStatuses,
    this.diariesList,
    this.diariesCategoriesList,
    this.selectedDiary,
    this.periodedSelectedDiary,
    this.updateDiaryStatuses,
    this.pageUpdateStatuses,
    this.filteredDiariesCategoriesList,
    this.userId,
    this.filteredSyns,
    DateTime? dateFrom,
    DateTime? dateTo,
  });

  DiaryState copyWith({
    GetDiaryStatuses? getDiaryStatuses,
    GetDiaryCategoriesStatuses? getDiaryCategoriesStatuses,
    UpdateDiaryStatuses? updateDiaryStatuses,
    PageUpdateStatuses? pageUpdateStatuses,
    List<DiaryFlatModel>? diariesList,
    List<DiaryCategoryModel>? diariesCategoriesList,
    List<DiaryCategoryModel>? filteredDiariesCategoriesList,
    String? userId,
    DiaryFlatModel? selectedDiary,
    DiaryFlatModel? periodedSelectedDiary,
    String? selectedDiaryTitle,
    /// Вроде бы фильтры по категориям 
    Map<String, List<String>>? filteredSyns,
  }) {
    return DiaryState(
      getDiaryStatuses: getDiaryStatuses ?? this.getDiaryStatuses,
      getDiaryCategoriesStatuses: getDiaryCategoriesStatuses ?? this.getDiaryCategoriesStatuses,
      updateDiaryStatuses: updateDiaryStatuses ?? this.updateDiaryStatuses,
      pageUpdateStatuses: pageUpdateStatuses ?? this.pageUpdateStatuses,
      diariesList: diariesList ?? this.diariesList,
      diariesCategoriesList: diariesCategoriesList ?? this.diariesCategoriesList,
      filteredDiariesCategoriesList: filteredDiariesCategoriesList ?? this.filteredDiariesCategoriesList,
      userId: userId ?? this.userId,
      selectedDiary: selectedDiary ?? this.selectedDiary,
      periodedSelectedDiary: periodedSelectedDiary ?? this.periodedSelectedDiary,
      filteredSyns: filteredSyns ?? this.filteredSyns
    );
  }
}
