import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_models.freezed.dart';
part 'diary_models.g.dart';

// TODO: заменить везде dynamic на конкретный тип

@freezed
abstract class DiaryCategoryModel with _$DiaryCategoryModel {
  const factory DiaryCategoryModel({
    required String synonim,
    required String name,
    required List<double> minValue,
    required List<double> maxValue,
    required List<double> minNormalValue,
    required List<double> maxNormalValue,
    required String categoryImg,
    required String filterImg,
    required int paramCount,
    required int order,
    required String measureItem,
    required List<String> paramName,
    required dynamic values,
    required List<dynamic> appleSynCompare,
    required int decimalDigits,
    required bool avgByMaxCount,
  }) = _Category;

  factory DiaryCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryCategoryModelFromJson(json);
}


@freezed
abstract class DiaryModel with _$DiaryModel {
  const factory DiaryModel({
    required String syn,
    required DateTime firstValue,
    required List<dynamic> currentValue,
    required List<DiaryItem> values,
    required int grouping,
  }) = _Diary;

  factory DiaryModel.fromJson(Map<String, dynamic> json) => _$DiaryModelFromJson(json);
}

@freezed
abstract class DiaryItem with _$DiaryItem {
  const factory DiaryItem({
    required DateTime date,
    required List<List<dynamic>> data,
  }) = _DiaryItem;

  factory DiaryItem.fromJson(Map<String, dynamic> json) => _$DiaryItemFromJson(json);
}
