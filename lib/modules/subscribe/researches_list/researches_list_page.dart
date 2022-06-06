import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/modules/subscribe/researches_list/researches_list.dart';
import 'package:medlike/modules/subscribe/researches_list/researches_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class ResearchesListPage extends StatelessWidget {
  const ResearchesListPage({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;
  final int categoryTypeId;

  @override
  Widget build(BuildContext context) {
    context.read<SubscribeCubit>().getResearchesList(
      userId,
      clinicId,
      buildingId,
      CategoryTypes()
          .getCategoryTypeByCategoryTypeId(categoryTypeId)
          .categoryType,
    );

    Widget _getScaffoldBody (state) {
      if (state.getResearchesListStatus ==
          GetResearchesListStatuses.failed) {
        return const Text('');
      } else if (state.getResearchesListStatus ==
          GetResearchesListStatuses.success) {
        return ResearchesList(
          researchesList: state.researchesList as List<Research>,
          selectedResearchesIds:
          state.selectedResearchesIds as List<String>,
        );
      } else {
        return const ResearchesListSkeleton();
      }
    }

    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        return DefaultScaffold(
          appBarTitle: CategoryTypes()
              .getCategoryTypeByCategoryTypeId(categoryTypeId)
              .russianCategoryTypeName,
          isChildrenPage: true,
          actionButton: Visibility(
            visible: state.selectedResearchesIds!.isNotEmpty ? true : false,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Далее'),
              backgroundColor: Theme
                  .of(context)
                  .primaryColor,
            ),
          ),
          child: _getScaffoldBody(state),
        );
      },
    );
  }
}
