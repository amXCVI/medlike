import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_models.freezed.dart';
part 'diary_models.g.dart';

// Вспомогательный тип
class DataValue {
  DataValue({
    required this.isAbnormal,
    required this.isChangeable,
    required this.secondsSinceMidnight,
    required this.innerData
  });

  bool isChangeable;
  bool isAbnormal;
  int secondsSinceMidnight;
  List<double> innerData;
}

// Вспомогательный тип
class CurrentValue {
  CurrentValue({
    required this.date,
    required this.isAbnormal,
    required this.isChangeable,
    required List<dynamic> innerData
  }) {
    // Костыль чтобы пофиксить 
    //_CastError (type 'List<dynamic>' is not a subtype of type 'List<double>' in type cast)
    this.innerData = innerData.map((e) => e as double).toList();
  }

  DateTime date;
  bool isChangeable;
  bool isAbnormal;
  late List<double> innerData;
}

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
  const DiaryModel._();

  const factory DiaryModel({
    required String syn,
    required DateTime firstValue,
    required List<dynamic> currentValue,
    required List<DiaryItem> values,
    required int grouping,
  }) = _Diary;

  CurrentValue get getCurrentValue {
    return CurrentValue(
      isAbnormal: currentValue[1][1] == 1, 
      isChangeable: currentValue[1][0] == 1, 
      date: DateTime.parse(currentValue[0] as String), 
      innerData: currentValue[2] as List<dynamic>
    );
  }

  factory DiaryModel.fromJson(Map<String, dynamic> json) => _$DiaryModelFromJson(json);
}

@freezed
abstract class DiaryItem with _$DiaryItem {
  const DiaryItem._();

  const factory DiaryItem({
    required DateTime date,
    required List<List<dynamic>> data,
  }) = _DiaryItem;

  DataValue get value {
    return DataValue(
      isAbnormal: data[1][1] == 1, 
      isChangeable: data[1][0] == 1, 
      secondsSinceMidnight: data[0] as int, 
      innerData: data[2] as List<double>
    );
  }

  factory DiaryItem.fromJson(Map<String, dynamic> json) => _$DiaryItemFromJson(json);
}
