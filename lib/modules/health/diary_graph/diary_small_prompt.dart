import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/value_helper.dart';

class DiarySmallPrompt extends StatelessWidget {
  const DiarySmallPrompt({
    Key? key,
    required this.item,
    required this.decimalDigits
  }) : super(key: key);

  final DataItem item;
  final int decimalDigits;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd MMMM", 'ru_RU');
    final val = ValueHelper.getStringFromValues(
      item.innerData, 
      decimalDigits
    );

    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.circleBgFirst
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dateFormat.format(item.date),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.mainText
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            val,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: AppColors.mainText
            ),
          )
        ],
      ),
    );
  }
}
