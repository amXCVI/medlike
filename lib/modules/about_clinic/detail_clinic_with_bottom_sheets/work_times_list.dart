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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/clinics/ic_doc_oval.svg'),
                const SizedBox(width: 16),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Режим работы'),
                      const SizedBox(height: 3),
                      ...workTimes!
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  item,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColors.lightText),
                                ),
                              ))
                          .toList()
                    ]),
              ],
            ),
          )
        : const SizedBox();
  }
}
