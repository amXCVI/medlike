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
          hours: 7
        );
        break;
      case 'Month':
        duration = Duration(
          days: mt.DateUtils.getDaysInMonth(date.year, date.month)
        );
        break;
      default:
        duration = const Duration(
          hours: 7
        );
    }

    if(!isNext) {
      duration = -duration;
    }

    DateTime newDate = date.add(duration);
    return getPeriodTiming(newDate, grouping);
  }

  static getDayString(DateTime date) {
    if(date.day == DateTime.now().day) {
      return 'Сегодня';
    } else if(date.day == DateTime.now().day - 1) {
      return 'Вчера';
    } else {
      DateFormat dateFormat = DateFormat("dd MMMM", 'ru_RU');
      return dateFormat.format(date);
    }
  }

  /// Возвращает текстовое представления периода
  /// среднего замера
  static String getPeriodString(DateTime date, String grouping) {
    switch (grouping) {
      case 'Hour':
        DateFormat dateFormat = DateFormat("hh:mm", 'ru_RU');

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
    return DateFormat('EEEE, d MMM, hh:mm').format(date); /// e.g Thursday
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

  static DiaryModel filterByPeriod({
    required DiaryModel diariesList,
    required DateTime start,
    required DateTime end,
  }) {
    final items = diariesList.values.where((f) => (
      f.date.isAfter(start) || f.date.isBefore(end)
    )).toList(); 

    return diariesList.copyWith(values: items);
  }
}
