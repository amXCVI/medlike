import 'package:flutter/material.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:intl/intl.dart';
import 'package:medlike/utils/helpers/value_helper.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({
    Key? key,
    required this.items,
    required this.decimalDigits,
    required this.measureItem
  }) : super(key: key);

  final List<DiaryItem> items;
  final int decimalDigits;
  final String measureItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (
        (context, index) {
          DateFormat dateFormat = DateFormat("EE, d M, h/m", 'ru_RU');
          final val = ValueHelper.getStringFromValues(
            items[index].value.innerData, 
            decimalDigits
          );

          return ListTile(
            title: Text(
              '$val $measureItem'
            ),
            subtitle: Text(
              dateFormat.format(items[index].date)
            ),
          );
        } 
      )
    );
  }
}
