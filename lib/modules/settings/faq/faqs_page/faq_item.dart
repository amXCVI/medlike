import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/navigation/router.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({Key? key, required this.question, required this.answer})
      : super(key: key);

  final String question;
  final String answer;

  void handleTapOnQuestion(BuildContext context) {
    context.router.push(FaqItemRoute(question: question, answer: answer));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleTapOnQuestion(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/settings/ic_list_item.svg'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(question,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        softWrap: true,
                        style: Theme.of(context).textTheme.labelSmall),
                  )
                ],
              ),
            ),
            SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg')
          ],
        ),
      ),
    );
  }
}
