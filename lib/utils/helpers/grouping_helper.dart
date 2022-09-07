import 'package:medlike/data/models/diary_models/diary_models.dart';

/// Данный хелпер нужен пока приходится индикаторы на фронте 
/// предобрабатывать из-за скорости бэка, переработать логику
/// когда пофиксят скорость запросов на бэке
/// (здесь дублируем логику бэка что нехорошо)

class GroupingHelper {
  static List<double> _innerMean(List<DataItem> items) {
    double first = items.fold(0, (p, el) => p + el.innerData[0]);

    if(items[0].innerData.length == 2) {
      double second = items.fold(0, (p, el) => p + el.innerData[1]);

      return [first / items.length , second / items.length];
    } else {
      return [first / items.length];
    }
  }

  static List<double> _innerLast(List<DataItem> items) {
    double first = items[items.length - 1].innerData[0];

    if(items[0].innerData.length == 2) {
      double second = items[items.length - 1].innerData[1];

      return [first, second];
    } else {
      return [first];
    }
  }

  static bool _lastAbnormal(List<DataItem> items) {
    return items[items.length - 1].isAbnormal;
  }

  static DateTime _innerTime(List<DataItem> items) {
    return items[items.length - 1].date;
  }  

  static List<DataItem> _groupBy(List<DataItem> items, DateTime Function(DataItem item) getGroup) {
    Map<DateTime, List<DataItem>> map = {};

    for(int i = 0; i < items.length; i++) {
      if(map[getGroup(items[i])] == null) {
        map[getGroup(items[i])] = [items[i]];
      } else {
        map[getGroup(items[i])]!.add(items[i]);
      }
    }

    List<DataItem> res = [];

    map.forEach((k, v) => res.add(
      DataItem(
        isAbnormal: _lastAbnormal(v), 
        isChangeable: true, 
        date: _innerTime(v), 
        innerData: _innerLast(v)
      )
    ));

    return res;
  }

  static List<DataItem> groupByHour(List<DataItem> items) {
    return _groupBy(items, (item) => DateTime(
      item.date.year,
      item.date.month,
      item.date.day,
      item.date.hour
    ));
  }

  static List<DataItem> groupByDay(List<DataItem> items) {
    return _groupBy(items, (item) => DateTime(
      item.date.year,
      item.date.month,
      item.date.day,
    ));
  }
}
