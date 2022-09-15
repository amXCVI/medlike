import 'package:flutter/material.dart' as mt;
import 'package:intl/intl.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/helpers/date_helpers.dart';

class ValueHelper {
  /// Преобразует значение параметра здоровья,
  /// состоящее либо из одного или двух чисел
  /// в строку
  static String getStringFromValues(List<double> innerData, int decimalDigits) {
    if (innerData.length > 1) {
      return '${innerData[0].toStringAsFixed(decimalDigits)}/${innerData[1].toStringAsFixed(decimalDigits)}';
    } else {
      return innerData[0].toStringAsFixed(decimalDigits);
    }
  }

  static List<DateTime> getPeriodTiming(DateTime date, String grouping) {
    switch (grouping) {
      case 'Hour':
        final fromHour = date.subtract(Duration(
          minutes: date.minute,
          seconds: date.second,
          milliseconds: date.millisecond,
          microseconds: date.microsecond
        ));

        final toHour = date.add(Duration(
          hours: 1,
          minutes: -date.minute,
          seconds: -date.second,
          milliseconds: -date.millisecond,
          microseconds: -date.microsecond
        ));
        return [fromHour, toHour];
      case 'Day':
        final firstHour = date.subtract(Duration(
          hours: date.hour,
          minutes: date.minute,
          seconds: date.second,
          milliseconds: date.millisecond,
          microseconds: date.microsecond
        ));

        final lastHour = date.add(Duration(
          days: 1,
          hours: -date.hour,
          minutes: -date.minute,
          seconds: -date.second,
          milliseconds: -date.millisecond,
          microseconds: -date.microsecond
        ));

        return [firstHour, lastHour];
      case 'Week':
        final monday = DateUtils.firstDayOfWeek(date);
        final sunday =  DateUtils.lastDayOfWeek(date);

        return [monday, sunday];
      case 'Month':
        final first = DateUtils.firstDayOfMonth(date);
        final last =  DateUtils.lastDayOfMonth(date);

        return [first, last];
      default:
        /// Дублирует неделю, но отдельно на всякий случай
        final monday = DateUtils.firstDayOfWeek(date);
        final sunday =  DateUtils.lastDayOfWeek(date);

        return [monday, sunday];
    }
  }

  static List<DateTime> getAnotherPeriodTiming(DateTime date, String grouping, bool isNext) {
    Duration duration;
    
    switch (grouping) {
      case 'Hour':
        duration = const Duration(
          hours: 1
        );
        break;
      case 'Day':
        duration = const Duration(
          days: 1
        );
        break;
      case 'Week':
        duration = const Duration(
          days: 7
        );
        break;
      case 'Month':
        duration = Duration(
          days: mt.DateUtils.getDaysInMonth(date.year, date.month)
        );
        break;
      default:
        duration = const Duration(
          days: 7
        );
    }

    if(!isNext) {
      duration = -duration;
    }

    DateTime newDate = date.add(duration);
    return getPeriodTiming(newDate, grouping);
  }

  static getDayString(DateTime date) {
    final now = DateTime.now();

    if(date.month == now.month && date.year == date.year) {
      if(date.day == now.day) {
        return 'Сегодня';
      } else if(date.day == now.day - 1) {
        return 'Вчера';
      } 
    }
    DateFormat dateFormat = DateFormat("dd MMMM", 'ru_RU');
    return dateFormat.format(date);
  }

  /// Возвращает текстовое представления периода
  /// среднего замера
  static String getPeriodString(DateTime date, String grouping) {
    switch (grouping) {
      case 'Hour':
        DateFormat dateFormat = DateFormat("HH:mm", 'ru_RU');

        final fromHour = date.subtract(Duration(
          minutes: date.minute,
          seconds: date.second,
          milliseconds: date.millisecond,
          microseconds: date.microsecond
        ));

        final toHour = date.add(Duration(
          hours: 1,
          minutes: -date.minute,
          seconds: -date.second,
          milliseconds: -date.millisecond,
          microseconds: -date.microsecond
        ));

        final day = ValueHelper.getDayString(date);

        return '$day, ${dateFormat.format(fromHour)} - ${dateFormat.format(toHour)}';
      case 'Day':
        return ValueHelper.getDayString(date);
      case 'Week':
        DateFormat dateFormat = DateFormat("d MMMM", 'ru_RU');

        final monday = DateUtils.firstDayOfWeek(date);
        final sunday =  DateUtils.lastDayOfWeek(date);

        return '${dateFormat.format(monday)}-${dateFormat.format(sunday)}';
      case 'Month':
        DateFormat dateFormat = DateFormat("MMMM", 'ru_RU');

        return dateFormat.format(date);
      default:
        /// Дублирует неделю, но отдельно на всякий случай
        DateFormat dateFormat = DateFormat("d MMMM", 'ru_RU');

        final monday = DateUtils.firstDayOfWeek(date);
        final sunday =  DateUtils.lastDayOfWeek(date);

        return '${dateFormat.format(monday)}-${dateFormat.format(sunday)}';
    }
  }

  static getDateInDiaryItem(DateTime date) {
    return DateFormat('EEEE, d MMM, HH:mm').format(date); /// e.g Thursday
  }

  static String? getDatepickerString(DateTime? date, bool isDate) {
    if(date == null) {
      return null;
    }

    if(isDate) {
      return DateFormat('dd MMMM yyyy г.', 'ru_RU').format(date);
    } else {
      return DateFormat('kk:mm').format(date);
    }
  }

  static DiaryFlatModel filterByPeriod({
    required DiaryFlatModel diariesList,
    required DateTime start,
    required DateTime end,
  }) {
    return diariesList.copyWith(
      values: filterItemsByPeriod(
        items: diariesList.values,
        start: start,
        end: end
      )
    );
  }

  static List<DataItem> filterItemsByPeriod({
    required List<DataItem> items,
    required DateTime start,
    required DateTime end,
  }) {
    var perioded = items.where((f) => (
      f.date.isAfter(start) && f.date.isBefore(end)
    )).toList(); 

    perioded.sort(
      (a, b) => a.date.isAfter(b.date) ? -1 : 1
    );

    return perioded;
  }
}
