import 'package:flutter/material.dart';

class DaysOfWeek extends StatelessWidget {
  const DaysOfWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'].map((e) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(e),
              ))
        ],
      ),
    );
  }
}
