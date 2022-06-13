import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';

class WorkTimesList extends StatelessWidget {
  const WorkTimesList({Key? key, this.workTimes}) : super(key: key);

  final List<String>? workTimes;

  @override
  Widget build(BuildContext context) {
    return workTimes!.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/clinics/ic_time_outline.svg'),
                const SizedBox(width: 18),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: workTimes!
                        .map((item) => Text(
                              item,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.lightText),
                            ))
                        .toList()),
              ],
            ),
          )
        : const SizedBox();
  }
}
