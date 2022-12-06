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
  double secondsSinceMidnight;
  List<double> innerData;

  List<dynamic> get toList {
    return [
      secondsSinceMidnight,
      [
        isChangeable,
        isAbnormal
      ],
      innerData
    ];
  }
}

/// Вспомогательный тип для использования в ListView
class DataItem {
  DataItem({
    required this.isAbnormal,
    required this.isChangeable,
    required this.date,
    required this.innerData
  });

  bool isChangeable;
  bool isAbnormal;
  DateTime date;
  List<double> innerData;

  static List<DataItem> toFlat(List<DiaryItem>? items) {
    List<DataItem> result = [];

    for(int i = 0; i < (items?.length ?? 0); i++) {
      result.addAll(items![i].value.map(
        (e) => DataItem(
          isAbnormal: e.isAbnormal, 
          isChangeable: e.isChangeable, 
          date: items[i].date.add(Duration(
            seconds: e.secondsSinceMidnight.floor()
          )), 
          innerData: e.innerData
        )
      ));
    }

    return result;
  }
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
    required List<dynamic>? currentValue,
    required List<DiaryItem> values,
    required int grouping,
  }) = _Diary;

  CurrentValue? get getCurrentValue {
    if(currentValue == null) {
      return null;
    }

    return CurrentValue(
      isAbnormal: currentValue![1][1] == 1, 
      isChangeable: currentValue![1][0] == 1, 
      date: DateTime.parse(currentValue![0] as String), 
      innerData: currentValue![2] as List<dynamic>
    );
  }

  factory DiaryModel.fromJson(Map<String, dynamic> json) => _$DiaryModelFromJson(json);
}

class DiaryFlatModel {
  const DiaryFlatModel({
    required this.syn,
    required this.firstValue,
    required this.currentValue,
    required this.values,
    required this.grouping,
  });

  final String syn;
  final DateTime firstValue;
  final CurrentValue? currentValue;
  final List<DataItem> values;
  final int grouping;

  DiaryFlatModel copyWith({
    String? syn,
    DateTime? firstValue,
    CurrentValue? currentValue,
    List<DataItem>? values,
    int? grouping
  }) {
    return DiaryFlatModel(
      syn: syn ?? this.syn,
      firstValue: firstValue ?? this.firstValue,
      currentValue: currentValue ?? this.currentValue,
      values: values ?? this.values,
      grouping: grouping ?? this.grouping
    );
  }
}

@freezed
abstract class DiaryItem with _$DiaryItem {
  const DiaryItem._();

  const factory DiaryItem({
    required DateTime date,
    required List<List<dynamic>> data,
  }) = _DiaryItem;

  List<DataValue> get value {
    return data.map((e) => DataValue(
      isAbnormal: e[1][1] == 1, 
      isChangeable: e[1][0] == 1, 
      secondsSinceMidnight: e[0] as double, 
      /// Костыль чтобы пофиксить 
      ///_CastError (type 'List<dynamic>' is not a subtype of type 'List<double>' in type cast)
      innerData: List<double>.from(e[2].map((e) => e as double))
    )).toList();
  }

  factory DiaryItem.fromJson(Map<String, dynamic> json) => _$DiaryItemFromJson(json);
}
