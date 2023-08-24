import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/faq_models/faq_models.dart';
import 'package:medlike/domain/app/cubit/faq/faq_cubit.dart';
import 'package:medlike/modules/settings/faq/faqs_page/faqs_list.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

import 'faqs_skeleton.dart';

@RoutePage()
class FaqsPage extends StatelessWidget {
  const FaqsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onRefreshData({bool isRefresh = false}) {
      context.read<FAQCubit>().getFAQItemsList(isRefresh: isRefresh);
    }

    onRefreshData();

    return DefaultScaffold(
      appBarTitle: 'Часто задаваемые вопросы',
      child: BlocBuilder<FAQCubit, FAQState>(
        builder: (context, state) {
          if (state.getFAQItemsListStatus != GetFAQItemsListStatuses.success &&
              state.faqsList != null) {
            onRefreshData();
          }
          if (state.getFAQItemsListStatus == GetFAQItemsListStatuses.failed) {
            return const Text('Error load data');
          } else if (state.getFAQItemsListStatus ==
              GetFAQItemsListStatuses.success) {
            return FaqsList(
              faqsList: state.faqsList as List<FAQItemModel>,
              onRefreshData: onRefreshData,
            );
          } else {
            return const FaqsListSkeleton();
          }
        },
      ),
    );
  }
}
