import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/doctors_list/doctors_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

import 'doctors_list.dart';

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
            CategoryTypes()
                .getCategoryTypeByCategoryTypeId(categoryTypeId)
                .categoryType,
            specialisationId,
          );
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: specialisationName,
      isChildrenPage: true,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getDoctorsListStatus == GetDoctorsListStatuses.failed) {
            return const Text('fail');
          } else if (state.getDoctorsListStatus ==
              GetDoctorsListStatuses.success) {
            return DoctorsList(
              doctorsList: state.doctorsList as List<Doctor>,
              specialisationId: specialisationId,
              onRefreshData: _onRefreshData,
            );
          } else {
            return const DoctorsListSkeleton();
          }
        },
      ),
    );
  }
}
