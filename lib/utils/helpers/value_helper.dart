import 'package:intl/intl.dart';
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

        return 'Сегодня, ${dateFormat.format(fromHour)} - ${dateFormat.format(toHour)}';
      case 'Day':
        return 'Сегодня';
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
}
