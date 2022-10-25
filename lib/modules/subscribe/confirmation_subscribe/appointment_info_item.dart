import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class AppointmentInfoItem extends StatelessWidget {
  const AppointmentInfoItem(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppointmentInfoSubtitle(title: title),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: true,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}

class AppointmentInfoSubtitle extends StatelessWidget {
  const AppointmentInfoSubtitle({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, bottom: 8.0),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontSize: 12.0, color: AppColors.lightText)),
    );
  }
}
