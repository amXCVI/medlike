import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/helpers/value_helper.dart';

class DiaryValue extends StatelessWidget {
  const DiaryValue({
    Key? key,
    required this.currentValue,
    required this.measureItem,
    required this.decimalDigits,
    required this.grouping
  }) : super(key: key);

  final CurrentValue currentValue;
  final String measureItem;
  final int decimalDigits;
  final String grouping;

  @override
  Widget build(BuildContext context) {
    final val = ValueHelper.getStringFromValues(
      currentValue.innerData, 
      decimalDigits
    );

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
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              val,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ), 
            Text(
              measureItem,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            )
          ],
        ),
        Text(
          ValueHelper.getPeriodString(currentValue.date, grouping),
          style: const TextStyle(
            color: Color.fromRGBO(158, 157, 157, 1),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        )
      ]
    );
  }
}
