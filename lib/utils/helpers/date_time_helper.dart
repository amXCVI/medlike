import 'package:intl/intl.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

/// Ф-я добавляет кол-во часов из часового пояса клиники
/// Используется в тех местах, где критично точное местное время
/// (Запись на прием, показатели здоровья)
/// Часовой пояс брать из UserSecureStorage
DateTime dateTimeToUTC(DateTime date, int timeZoneOffset) {
  return date.add(Duration(hours: timeZoneOffset));
}

/// Ф-я приводит даты к формату, принятому на сервере
/// С часовым поясом в конце и при этом время уже локальное
/// Используется в тех местах, где критично точное местное время
/// (Запись на прием, показатели здоровья)
/// Часовой пояс брать из UserSecureStorage
//? кажется, нигде не используется )
String dateTimeToServerFormat(DateTime date, int timeZoneOffset) {
  Duration duration = Duration(hours: timeZoneOffset);
  if (duration.isNegative) {
    return (DateFormat("yyyy-MM-ddTHH:mm:ss-").format(date) +
        "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
  } else {
    return (DateFormat("yyyy-MM-ddTHH:mm:ss+").format(date) +
        "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
  }
}

/// Ф-я приводит даты к формату, принятому на сервере
/// но без времени и часового пояса
String dateTimeToDate(DateTime date) {
  return DateFormat("yyyy-MM-dd").format(date);
}

/// Ф-я возвращает численное значение текущей таймзоны
/// Костыль на костыль
/// Сделал так из-за того, что не получается прямо в хелпере асинхронно получать эти значения
/// Потом в кубите не удается работать с таким хелпером
/// (((((((
Future<int> getTimeZoneOffset() async {
  String timezone =
      '${await UserSecureStorage.getField(AppConstants.timeZoneOffset)}';
  if (timezone.isNotEmpty) {
    return int.parse(timezone);
  } else {
    return int.parse(DateTime.now().timeZoneOffset.toString());
  }
}

/// Ф-я возвращает строку времени приёма
/// с таймзоной клиники в случае её отличия от
/// таймзоны МСК
String getAppointmentTime(DateTime dateTime, int timeZoneOffset,
    {String? formatSting, bool? isTimeCell}) {
  const mskTime = 3;

  int tz = DateTime.now().timeZoneOffset.inHours;
  DateTime timeOfClinic = dateTime
      .toUtc()
      .add(Duration(hours: isTimeCell != true ? timeZoneOffset : 0));

  final timeString = DateFormat(formatSting ?? 'HH:mm').format(timeOfClinic);

  if (timeZoneOffset == tz) {
    return timeString;
  } else if (timeZoneOffset == mskTime) {
    return '$timeString (МСК)';
  } else {
    final sign = timeZoneOffset - mskTime < 0 ? '-' : '+';
    return '$timeString (МСК $sign${(timeZoneOffset - mskTime).abs()})';
  }
}

/// Ф-я возвращает объект даты с прибавленной таймзоной клиники
/// Уродское решение
/// Не могу сообразить, как сделать правильно
/// 022-12-02T00:00:00+03:00 превращается в 2022-12-01 21:00:01.000Z после парсинга
/// И это неправильно. Должно быть как-то по-дпугому
DateTime getAppointmentTimeObject(DateTime dateTime, int timeZoneOffset,
    {String? formatSting, bool? isTimeCell}) {
  const mskTime = 3;

  DateTime timeOfClinic = dateTime
      .toUtc()
      .add(Duration(hours: isTimeCell != true ? timeZoneOffset : mskTime));

  return timeOfClinic;
}
