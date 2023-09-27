import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:skeletons/skeletons.dart';

class HealthValue extends StatelessWidget {
  const HealthValue(
      {Key? key,
      required this.measureItem,
      required this.decimalDigits,
      this.data})
      : super(key: key);

  final String measureItem;
  final int decimalDigits;
  final DiaryFlatModel? data;

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'ru_RU';
    var format = DateFormat.MMMMd('ru');
    var fhour = DateFormat('HH:mm', 'ru');

    String getTime(DateTime time) {
      time = dateTimeToUTC(time, DateTime.now().timeZoneOffset.inHours);
      if (time.day == DateTime.now().day) {
        return 'Сегодня, ${fhour.format(time)}';
      }

      return '${format.format(time)}, ${fhour.format(time)}';
    }

    return SizedBox(
      width: 135,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          data?.currentValue == null
              ? const Text(
                  '–',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Color.fromRGBO(158, 157, 157, 1),
                  ),
                )
              : RowData(
                  innerData: data!.currentValue!.innerData,
                  measureItem: measureItem,
                  decimalDigits: decimalDigits),
          const SizedBox(height: 2),
          Text(
            data?.currentValue == null
                ? 'Нет данных'
                : getTime(data!.currentValue!.date),
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(158, 157, 157, 1),
            ),
          )
        ],
      ),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData(
      {Key? key,
      required this.innerData,
      required this.measureItem,
      required this.decimalDigits})
      : super(key: key);

  final List<double> innerData;
  final String measureItem;
  final int decimalDigits;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(ValueHelper.getStringFromValues(innerData, decimalDigits),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(width: 5),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(measureItem,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
          ),
        )
      ],
    );
  }
}
