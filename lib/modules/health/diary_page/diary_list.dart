import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
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
              key: ValueKey(index),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      flex: 2,
                      onPressed: (ctx) {
                        context.read<DiaryCubit>().deleteDiaryEntry(
                          date: items[index].date, 
                          syn: syn
                        );
                      },
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
                onTap: () {
                  context.router.push(
                    DiaryAddRoute(
                      title: title, 
                      measureItem: measureItem,
                      decimalDigits: decimalDigits, 
                      paramName: paramName,
                      initialValues: items[index].value.innerData,
                      initialDate: items[index].date
                    )
                  );
                },
              )
            );
          } 
        )
      ),
    );
  }
}
