import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/themes/colors.dart';

class DocumentHeader extends StatelessWidget {
  const DocumentHeader({
    Key? key,
    required this.documentName,
    required this.statusStr,
    this.updatedAt,
    required this.userName,
  }) : super(key: key);

  final String documentName;
  final String statusStr;
  final DateTime? updatedAt;
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
          statusStr,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.lightText),
        ),
        const SizedBox(height: 24.0),
        Row(
          children: [
            updatedAt != null
                ? RichText(
                    text: WidgetSpan(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.circleBgFirst,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/appointments/clock.svg'),
                            const SizedBox(width: 8.0),
                            Text(DateFormat('HH:mm DD.MM.yy')
                                .format(updatedAt!)),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(width: 8.0),
            userName != null && userName.isNotEmpty
                ? RichText(
                    text: WidgetSpan(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.circleBgFirst,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/appointments/profile.svg'),
                            const SizedBox(width: 8.0),
                            Text(userName),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
