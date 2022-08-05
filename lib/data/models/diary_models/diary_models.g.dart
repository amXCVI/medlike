// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      synonim: json['synonim'] as String,
      name: json['name'] as String,
      minValue: (json['minValue'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      maxValue: (json['maxValue'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      minNormalValue: (json['minNormalValue'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      maxNormalValue: (json['maxNormalValue'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      categoryImg: json['categoryImg'] as String,
      filterImg: json['filterImg'] as String,
      paramCount: json['paramCount'] as int,
      order: json['order'] as int,
      measureItem: json['measureItem'] as String,
      paramName:
          (json['paramName'] as List<dynamic>).map((e) => e as String).toList(),
      values: json['values'],
      appleSynCompare: json['appleSynCompare'] as List<dynamic>,
      decimalDigits: json['decimalDigits'] as int,
      avgByMaxCount: json['avgByMaxCount'] as bool,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'synonim': instance.synonim,
      'name': instance.name,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'minNormalValue': instance.minNormalValue,
      'maxNormalValue': instance.maxNormalValue,
      'categoryImg': instance.categoryImg,
      'filterImg': instance.filterImg,
      'paramCount': instance.paramCount,
      'order': instance.order,
      'measureItem': instance.measureItem,
      'paramName': instance.paramName,
      'values': instance.values,
      'appleSynCompare': instance.appleSynCompare,
      'decimalDigits': instance.decimalDigits,
      'avgByMaxCount': instance.avgByMaxCount,
    };

_$_Diary _$$_DiaryFromJson(Map<String, dynamic> json) => _$_Diary(
      syn: json['syn'] as String,
      firstValue: DateTime.parse(json['firstValue'] as String),
      currentValue: json['currentValue'] as List<dynamic>,
      values: (json['values'] as List<dynamic>)
          .map((e) => DiaryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      grouping: json['grouping'] as int,
    );

Map<String, dynamic> _$$_DiaryToJson(_$_Diary instance) => <String, dynamic>{
      'syn': instance.syn,
      'firstValue': instance.firstValue.toIso8601String(),
      'currentValue': instance.currentValue,
      'values': instance.values,
      'grouping': instance.grouping,
    };

_$_DiaryItem _$$_DiaryItemFromJson(Map<String, dynamic> json) => _$_DiaryItem(
      date: DateTime.parse(json['date'] as String),
      data: (json['data'] as List<dynamic>)
          .map((e) => e as List<dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_DiaryItemToJson(_$_DiaryItem instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'data': instance.data,
    };
