import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/doctors_list/doctors_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

import 'doctors_list.dart';

@RoutePage()
class DoctorsListPage extends StatelessWidget {
  const DoctorsListPage({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
    required this.specialisationId,
    required this.specialisationName,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;
  final int categoryTypeId;
  final String specialisationId;
  final String specialisationName;

  @override
  Widget build(BuildContext context) {
    void _onRefreshData() async {
      context.read<SubscribeCubit>().getDoctorsList(
            userId,
            clinicId,
            buildingId,
            CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
                .categoryType,
            specialisationId,
          );
    }

    void _onFilterList(String filterStr) {
      context.read<SubscribeCubit>().filterDoctorsList(filterStr);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: specialisationName,
      isChildrenPage: true,
      isSearch: true,
      filteringFunction: _onFilterList,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getDoctorsListStatus == GetDoctorsListStatuses.failed) {
            return const Text('');
          } else if (state.getDoctorsListStatus ==
              GetDoctorsListStatuses.success) {
            return state.doctorsList!.isNotEmpty &&
                    state.filteredDoctorsList!.isEmpty
                ? const NotFoundData()
                : DoctorsList(
                    doctorsList: state.filteredDoctorsList as List<Doctor>,
                    specialisationId: specialisationId,
                    onRefreshData: _onRefreshData,
                    userId: userId,
                    clinicId: clinicId,
                    buildingId: buildingId,
                    specialisation: specialisationName,
                    categoryTypeId: categoryTypeId,
                  );
          } else {
            return const DoctorsListSkeleton();
          }
        },
      ),
    );
  }
}
