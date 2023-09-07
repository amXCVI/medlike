import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class ActiveFiltersView extends StatelessWidget {
  const ActiveFiltersView(
      {super.key, required this.displayedFilters, required this.display});
  final Map<String, String> displayedFilters;
  final bool display;

  List<TextSpan> displayedFiltesAsList(BuildContext ctx) {
    List<TextSpan> texts = <TextSpan>[];
    displayedFilters.forEach((key, value) {
      texts.add(TextSpan(text: "$key: "));
      texts.add(TextSpan(
          text: value, style: TextStyle(color: Theme.of(ctx).primaryColor)));
    });

    return texts;
  }

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
                const TextSpan(text: "Выбраны "),
                ...displayedFiltesAsList(context)
              ]),
            ),
          ),
        )
      : const SizedBox();
}
