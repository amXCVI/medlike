import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/value_helper.dart';
import 'package:auto_route/auto_route.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({
    Key? key,
    required this.title,
    required this.items,
    required this.decimalDigits,
    required this.measureItem,
    required this.syn,
    required this.paramName
  }) : super(key: key);

  final String title;
  final List<DiaryItem> items;
  final int decimalDigits;
  final String measureItem;
  final List<String> paramName;
  final String syn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...items.map((e) => 
          DiaryTile(
            title: title, 
            item: items[items.indexOf(e)], 
            decimalDigits: decimalDigits, 
            measureItem: measureItem, 
            syn: syn, 
            paramName: paramName
          )
        ).toList()
      ],
    );   
  }
}

class DiaryTile extends StatelessWidget {
  const DiaryTile({
    Key? key,
    required this.title,
    required this.item,
    required this.decimalDigits,
    required this.measureItem,
    required this.syn,
    required this.paramName
  }) : super(key: key);

  final String title;
  final DiaryItem item;
  final int decimalDigits;
  final String measureItem;
  final List<String> paramName;
  final String syn;

  @override
  Widget build(BuildContext context) {
    final val =
      ValueHelper.getStringFromValues(item.value.innerData, decimalDigits);

    return Slidable(
        key: ValueKey(item.value.hashCode),
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
          dismissible: DismissiblePane(onDismissed: () {
            context
              .read<DiaryCubit>()
              .deleteDiaryEntry(
                date: item.date.add(
                  Duration(seconds: item.value.secondsSinceMidnight.floor()
                )), 
                syn: syn
              );
          }),
        ),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom:  BorderSide(
                width: 1, 
                color: AppColors.mainSeparatorAlpha
              ), 
            )
          ),
          child: ListTile(
            title: Text(
              '$val $measureItem',
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              ValueHelper.getDateInDiaryItem(
                item.date.add(Duration(
                  seconds: item.value.secondsSinceMidnight.floor()
                ))
              ),
              style: const TextStyle(
                color: Color.fromRGBO(158, 157, 157, 1),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            onTap: () {
              context.router.push(DiaryAddRoute(
                  title: title,
                  measureItem: measureItem,
                  decimalDigits: decimalDigits,
                  paramName: paramName,
                  initialValues: item.value.innerData,
                  initialDate: item.date.add(
                    Duration(seconds: item.value.secondsSinceMidnight.floor()
                  )) ));
            },
          ),
        ));
  }
}
