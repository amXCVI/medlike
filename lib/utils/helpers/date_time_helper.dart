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
/// таймзоны МСК +03:00
String getAppointmentTime(DateTime dateTime, int timeZoneOffset) {
  final timeString = DateFormat('HH:mm').format(
    dateTimeToUTC(
      dateTime,
      int.parse(
        DateTime.now()
          .timeZoneOffset
          .inHours
          .toString()
        )
      )
    );

  if(timeZoneOffset == 3) {
    return timeString;
  } else {
    final sign = timeZoneOffset < 0 ? '-' : '+' ;
    return '$timeString (МСК $sign$timeZoneOffset)';
  }
}
