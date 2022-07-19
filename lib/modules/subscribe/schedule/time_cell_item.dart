import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/themes/colors.dart';

class TimeCellItem extends StatelessWidget {
  const TimeCellItem({Key? key, required this.isSelected, required this.time})
      : super(key: key);

  final bool isSelected;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15.0),
          child: Center(
            child: Text(DateFormat("HH:mm").format(time),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isSelected ? Colors.white : AppColors.mainText)),
          ),
        ),
      ),
    );
  }
}
