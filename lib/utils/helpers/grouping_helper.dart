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
        isAbnormal: false, 
        isChangeable: true, 
        date: k, 
        innerData: _innerMean(v)
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
