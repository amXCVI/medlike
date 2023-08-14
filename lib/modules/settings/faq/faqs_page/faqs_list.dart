import 'package:flutter/material.dart';
import 'package:medlike/data/models/faq_models/faq_models.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

import 'faq_item.dart';

class FaqsList extends StatelessWidget {
  const FaqsList({Key? key, required this.faqsList, this.onRefreshData})
      : super(key: key);

  final List<FAQItemModel> faqsList;
  final dynamic onRefreshData;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: DefaultScrollbar(
        child: ListView(
            shrinkWrap: true,
            children: faqsList
                .map((item) => FaqItem(
                      question: item.question,
                      answer: item.answer,
                    ))
                .toList()),
      ),
    );
  }
}
