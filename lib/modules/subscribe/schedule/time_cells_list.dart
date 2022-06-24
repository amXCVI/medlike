import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/schedule/time_cell_item.dart';

class TimeCellsList extends StatefulWidget {
  const TimeCellsList({
    Key? key,
    required this.timetableCellsList,
    this.selectedTimetableCellId = '',
  }) : super(key: key);

  final List<TimetableCellModel> timetableCellsList;
  final String selectedTimetableCellId;

  @override
  State<TimeCellsList> createState() => _TimeCellsListState();
}

class _TimeCellsListState extends State<TimeCellsList> {
  void _handleTapOnCell(TimetableCellModel selectedCell) {
    context.read<SubscribeCubit>().setSelectedTimetableCell(selectedCell);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...widget.timetableCellsList
            .map((item) => InkWell(
                  onTap: () => {_handleTapOnCell(item)},
                  child: TimeCellItem(
                    isSelected:
                        item.scheduleId == widget.selectedTimetableCellId,
                    time: item.time,
                  ),
                ))
            .toList(),
        const SizedBox(height: 20),
      ],
    );
  }
}
