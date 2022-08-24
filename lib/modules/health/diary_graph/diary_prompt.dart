import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/helpers/value_helper.dart';

class DiaryPrompt extends StatelessWidget {
  const DiaryPrompt({
    Key? key,
    required this.item,
    required this.decimalDigits,
    required this.measureItem
  }) : super(key: key);

  final DiaryItem item;
  final int decimalDigits;
  final String measureItem;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("d MMMM y", 'ru_RU');
    final val = ValueHelper.getStringFromValues(
      item.value.innerData, 
      decimalDigits
    );

    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(238, 238, 238, 1)
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  val,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 2,
                      bottom: 5
                    ),
                    child: Text(
                      measureItem,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                dateFormat.format(
                  item.date,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color.fromRGBO(158, 157, 157, 1)
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
