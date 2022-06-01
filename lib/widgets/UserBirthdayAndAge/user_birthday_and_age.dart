import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserBirthdayAndAge extends StatelessWidget {
  const UserBirthdayAndAge({
    Key? key,
    required this.userBirthday,
  }) : super(key: key);

  final DateTime userBirthday;

  String _getAgeByBirthday(DateTime birthday) {
    final DateTime currentDate = DateTime.now();
    final differentYears = currentDate.year - birthday.year;
    int lastDigit = differentYears;

    lastDigit %= 100;
    if (lastDigit >= 5 && lastDigit <= 20) {
      return '$differentYears лет';
    }
    lastDigit %= 10;
    if (lastDigit == 1) {
      return '$differentYears год';
    }
    if (lastDigit >= 2 && lastDigit <= 4) {
      return '$differentYears года';
    }
    return '$differentYears лет';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateFormat('dd.MM.yyyy').format(userBirthday)} (${_getAgeByBirthday(userBirthday)})',
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: Theme.of(context).highlightColor),
    );
  }
}
