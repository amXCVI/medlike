import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/themes/colors.dart';

class DiaryChips extends StatelessWidget {
  const DiaryChips({
    Key? key,
    required this.syn,
    required this.onTap,
    required this.selectedGroup
  }) : super(key: key);

  final String syn;
  final String selectedGroup;
  final Function onTap;

  @override
    Widget build(BuildContext context) {

    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        void tap(String grouping) {
          onTap(grouping, syn);
        }
        const width = 10.0;

        final list = [
          DiaryChip(grouping: 'Hour', title: 'Час', onTap: tap, selected: selectedGroup),
          const SizedBox(width: width),
          DiaryChip(grouping: 'Day', title: 'День', onTap: tap, selected: selectedGroup),
          const SizedBox(width: width),
          DiaryChip(grouping: 'Week', title: 'Неделя', onTap: tap, selected: selectedGroup),
          const SizedBox(width: width),
          DiaryChip(grouping: 'Month', title: 'Месяц', onTap: tap, selected: selectedGroup),
        ];

        if(MediaQuery.of(context).size.width <= AppConstants.smScreenWidth) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 64,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: list
            )
          );
        }

        return Container(
          width: MediaQuery.of(context).size.width,
          height: 64,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: list,
          ),
        );
      },
    );
  }
}

class DiaryChip extends StatelessWidget {
  const DiaryChip({
    Key? key, 
    required this.title,
    required this.grouping, 
    required this.onTap,
    required this.selected
  }) : super(key: key);

  final String title;
  final String grouping;
  final Function onTap;
  final String selected;

  @override
  Widget build(BuildContext context) {
    final widget = InkWell(
      onTap: () => onTap(grouping),
      child: Chip(
        backgroundColor: selected == grouping ? AppColors.mainBrandColor : AppColors.mainAppBackground,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
        elevation: 8,
        label: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selected == grouping ? AppColors.mainAppBackground : AppColors.mainText,
                fontWeight: FontWeight.w400
              ),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );

    if(MediaQuery.of(context).size.width > AppConstants.smScreenWidth) {
      return Expanded(
        child: widget
      );
    }

    return widget;
  }
}
