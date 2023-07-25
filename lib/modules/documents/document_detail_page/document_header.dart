import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/themes/colors.dart';

class DocumentHeader extends StatelessWidget {
  const DocumentHeader({
    Key? key,
    required this.documentName,
    required this.status,
    required this.date,
    required this.userName,
  }) : super(key: key);

  final String documentName;
  final int status;
  final DateTime date;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          documentName,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: true,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.mainText),
        ),
        const SizedBox(height: 4),
        Text(
          DocumentStatuses.getStatus(status).statusName,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.lightText),
        ),
        const SizedBox(height: 24.0),
        Row(
          children: [
            RichText(
              text: WidgetSpan(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.circleBgFirst,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/appointments/clock.svg'),
                      const SizedBox(width: 8.0),
                      Text(DateFormat('HH:mm DD.MM.yy').format(date)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            RichText(
              text: WidgetSpan(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.circleBgFirst,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/appointments/profile.svg'),
                      const SizedBox(width: 8.0),
                      Text(userName),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
