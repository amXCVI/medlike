import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list.dart';
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';

class SpecialisationsListPage extends StatelessWidget {
  const SpecialisationsListPage({
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
    void _onRefreshData() async {
      context.read<SubscribeCubit>().getSpecialisationsList(
            userId,
            clinicId,
            buildingId,
            CategoryTypes()
                .getCategoryTypeByCategoryTypeId(categoryTypeId)
                .categoryType,
          );
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: CategoryTypes()
          .getCategoryTypeByCategoryTypeId(categoryTypeId)
          .russianCategoryTypeName,
      isChildrenPage: true,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getSpecialisationsListStatus ==
              GetSpecialisationsListStatuses.failed) {
            return const Text('');
          } else if (state.getSpecialisationsListStatus ==
              GetSpecialisationsListStatuses.success) {
            return SpecialisationsList(
              specialisationsList:
                  state.specialisationsList as List<NavigationItem>,
              onRefreshData: _onRefreshData,
              userId: userId,
              clinicId: clinicId,
              buildingId: buildingId,
                categoryTypeId: categoryTypeId,
            );
          } else {
            return const SpecialisationsListSkeleton();
          }
        },
      ),
    );
  }
}
