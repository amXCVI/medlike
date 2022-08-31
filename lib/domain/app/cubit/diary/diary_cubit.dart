import 'package:bloc/bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/data/repository/diary_repository.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/utils/helpers/value_helper.dart';
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
      //updateDiaryStatuses: UpdateDiaryStatuses.loading
    ));
    try {
      final date = DateTime.now();
      final startDate = dateFrom ?? date.subtract(const Duration(
        days: 365
      ));
      final endDate = dateTo ?? date.add(const Duration(
        days: 365
      ));
      
      final currentSelectedUserId =
        await UserSecureStorage.getField(AppConstants.selectedUserId);

      final List<DiaryModel> response;
      response = await diaryRepository.getDiaries(
        project: project,
        platform: platform,
        grouping: grouping,
        dateFrom: startDate,
        dateTo: endDate,
        userId: currentSelectedUserId,
        synFilter: syn
      );

      final flatResponse = response.map((e) => DiaryFlatModel(
        syn: e.syn, 
        firstValue: e.firstValue, 
        currentValue: e.getCurrentValue, 
        values: DataItem.toFlat(e.values), 
        grouping: e.grouping)
      ).toList();
      
      final perioded = flatResponse.map((el) => (
        ValueHelper.filterByPeriod(
          diariesList: el, 
          start: date_utils.DateUtils.firstDayOfWeek(date), 
          end: date_utils.DateUtils.lastDayOfWeek(date)
        )
      )).toList();
      
      emit(state.copyWith(
        getDiaryStatuses: GetDiaryStatuses.success,
        //updateDiaryStatuses: UpdateDiaryStatuses.initial,
        diariesList: flatResponse,
        weekDiariesList: perioded,
        dateFrom: date_utils.DateUtils.firstDayOfWeek(date),
        dateTo: date_utils.DateUtils.lastDayOfWeek(date),
        pageUpdateStatuses: PageUpdateStatuses.initial
      ));
    } catch (e) {
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
      periodedSelectedDiary: ValueHelper.filterByPeriod(
        diariesList: selectedDiary, 
        start: start, 
        end: end
      ),
      dateFrom: start,
      dateTo: end
    ));
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
    required List<double> values,
    DateTime? updateFrom,
    DateTime? updateTo
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

      DataItem val = DataItem(
        date: date,
        isAbnormal: false,
        isChangeable: true,
        innerData: values
      );

      List<DataItem> items = [...state.selectedDiary!.values];
      items.add(val);

      emit(state.copyWith(
        selectedDiary: state.selectedDiary!.copyWith(
          values: items
        )
      ));
      
      if(updateFrom != null && updateTo != null) {
        setTimePeriod(
          start: updateFrom,
          end: updateTo,
          syn: state.selectedDiary!.syn
        );
      }

      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.success
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
    required List<double> values,
    DateTime? updateFrom,
    DateTime? updateTo
  }) async {
    emit(state.copyWith(
      updateDiaryStatuses: UpdateDiaryStatuses.loading,
      getDiaryStatuses: GetDiaryStatuses.loading
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

      final items = state.selectedDiary!.values.map((el) {
        if(el.date != oldDate) {
          return el;
        }
        return DataItem(
          date: date,
          isAbnormal: false,
          isChangeable: true,
          innerData: values
        );
      }).toList();

      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.success,
        selectedDiary: state.selectedDiary!.copyWith(
          values: items
        )
      ));

      if(updateFrom != null && updateTo != null) {
        setTimePeriod(
          start: updateFrom,
          end: updateTo,
          syn: state.selectedDiary!.syn
        );
      }
    } catch (e) {
      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.failed,
        getDiaryStatuses: GetDiaryStatuses.success /// Убираем статус загрузки на предыдущий
      ));
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

      final items = state.selectedDiary!.values.where((el) =>
        el.date != date
      ).toList();

      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.success,
        selectedDiary: state.selectedDiary!.copyWith(
          values: items
        )
      ));

      if(updateFrom != null && updateTo != null) {
        setTimePeriod(
          start: updateFrom,
          end: updateTo,
          syn: state.selectedDiary!.syn
        );
      }
    } catch (e) {
      emit(state.copyWith(
        updateDiaryStatuses: UpdateDiaryStatuses.failed,
        getDiaryStatuses: GetDiaryStatuses.success /// Убираем статус загрузки на предыдущий
      ));
    }
  }
}
