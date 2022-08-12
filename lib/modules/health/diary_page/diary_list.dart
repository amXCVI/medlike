import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
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

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Color.fromRGBO(158, 157, 157, 0.4),
        ),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (
          (context, index) {
            final val = ValueHelper.getStringFromValues(
              items[index].value.innerData, 
              decimalDigits
            );

            return Slidable(
              key: const ValueKey(0),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      flex: 2,
                      onPressed: (ctx) {},
                      backgroundColor: const Color(0xFFFE4A49),
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),

              child: ListTile(
                title: Text(
                  '$val $measureItem',
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  ValueHelper.getDateInDiaryItem(items[index].date),
                  style: const TextStyle(
                    color: Color.fromRGBO(158, 157, 157, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              )
            );
          } 
        )
      ),
    );
  }
}
