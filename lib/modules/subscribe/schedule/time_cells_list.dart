import 'package:flutter/material.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/modules/subscribe/schedule/time_cell_item.dart';
import 'package:medlike/themes/colors.dart';

class TimeCellsList extends StatefulWidget {
  const TimeCellsList({
    Key? key,
    required this.timetableCellsList,
    this.selectedTimetableCellId = '',
    required this.handleTapOnCell,
    this.timezoneHours
  }) : super(key: key);

  final List<TimetableCellModel> timetableCellsList;
  final String selectedTimetableCellId;
  final int? timezoneHours;
  final void Function(TimetableCellModel selectedCell) handleTapOnCell;

  @override
  State<TimeCellsList> createState() => _TimeCellsListState();
}

class _TimeCellsListState extends State<TimeCellsList> {
  @override
  Widget build(BuildContext context) {
    final notification = 
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          'Указан часовой пояс клиники',
          style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: AppColors.lightText),
          textAlign: TextAlign.center,
        ),
      );

    return widget.timetableCellsList.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Выберите время приема',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              if(widget.timezoneHours != DateTime.now().timeZoneOffset.inHours) notification,
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2.2,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 11.0),
                children: [
                  ...widget.timetableCellsList
                      .map((item) => InkWell(
                            onTap: () => {widget.handleTapOnCell(item)},
                            child: TimeCellItem(
                              isSelected: item.scheduleId ==
                                  widget.selectedTimetableCellId,
                              time: item.time,
                            ),
                          ))
                      .toList(),
                ],
              ),
            ],
          )
        : const SizedBox();
  }
}
