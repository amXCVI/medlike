import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class ActiveFiltersView extends StatelessWidget {
  const ActiveFiltersView(
      {super.key, required this.filter, required this.display});
  final String filter;
  final bool display;

  @override
  Widget build(BuildContext context) => display
      ? Container(
          width: MediaQuery.of(context).size.width,
          color: AppColors.secondBackground,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 18, right: 18, bottom: 38, left: 18),
            child: Text.rich(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
              TextSpan(children: [
                const TextSpan(text: "Выбраны: "),
                TextSpan(
                    text: filter,
                    style: TextStyle(color: Theme.of(context).primaryColor))
              ]),
            ),
          ),
        )
      : const SizedBox();
}
