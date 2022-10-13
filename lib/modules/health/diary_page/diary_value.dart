import 'package:flutter/material.dart';
import 'package:medlike/utils/helpers/value_helper.dart';

class DiaryValue extends StatelessWidget {
  const DiaryValue({
    Key? key,
    required this.currentValue,
    required this.measureItem,
    required this.date,
    required this.decimalDigits,
    required this.grouping
  }) : super(key: key);

  final String currentValue;
  final DateTime date;
  final String measureItem;
  final int decimalDigits;
  final String grouping;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(
          'В среднем'.toUpperCase(),
          style: const TextStyle(
            color: Color.fromRGBO(158, 157, 157, 1),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 6
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currentValue,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ), 
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  bottom: 5
                ),
                child: Text(
                  measureItem,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            ValueHelper.getPeriodString(
              date.toLocal(), 
              grouping
            ),
            style: const TextStyle(
              color: Color.fromRGBO(158, 157, 157, 1),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        )
      ]
    );
  }
}
