import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class NotFoundData extends StatelessWidget {
  const NotFoundData({Key? key, this.text = 'Нет результатов поиска'})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 65),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.lightText),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
