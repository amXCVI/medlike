import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
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
    required this.paramName,
    required this.grouping
  }) : super(key: key);

  final String title;
  final List<DataItem> items;
  final int decimalDigits;
  final String measureItem;
  final List<String> paramName;
  final String syn;
  final String grouping;

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
            paramName: paramName,
            grouping: grouping,
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
    required this.paramName,
    required this.grouping
  }) : super(key: key);

  final String title;
  final DataItem item;
  final int decimalDigits;
  final String measureItem;
  final List<String> paramName;
  final String syn;
  final String grouping;

  @override
  Widget build(BuildContext context) {
    final val =
      ValueHelper.getStringFromValues(item.innerData, decimalDigits);

    final dates = ValueHelper.getPeriodTiming(item.date, grouping);
    print(dates);

    return Slidable(
        key: ValueKey(item.hashCode),
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
                date: item.date,
                syn: syn,
                updateFrom: dates[0],
                updateTo: dates[1]
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
                item.date
              ),
              style: const TextStyle(
                color: Color.fromRGBO(158, 157, 157, 1),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            trailing: SvgPicture.asset(
              'assets/icons/ic_arrow_right_calendar.svg',
              color: AppColors.lightText
            ),
            onTap: () {
              context.router.push(DiaryAddRoute(
                  title: title,
                  measureItem: measureItem,
                  decimalDigits: decimalDigits,
                  paramName: paramName,
                  initialValues: item.innerData,
                  grouping: grouping,
                  initialDate: item.date));
            },
          ),
        ));
  }
}
