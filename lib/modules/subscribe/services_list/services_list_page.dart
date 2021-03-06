import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/services_list/services_list.dart';
import 'package:medlike/modules/subscribe/services_list/services_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class ServicesListPage extends StatelessWidget {
  const ServicesListPage({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;

  @override
  Widget build(BuildContext context) {
    void _onRefreshData () {
      context
          .read<SubscribeCubit>()
          .getServicesList(userId, clinicId, buildingId);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: 'Услуги',
      isChildrenPage: true,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getServicesListStatus ==
              GetServicesListStatuses.failed) {
            return const Text('');
          } else if (state.getServicesListStatus ==
              GetServicesListStatuses.success) {
            return ServicesList(
              servicesList: state.servicesList as List<NavigationItem>,
              userId: userId,
              buildingId: buildingId,
              clinicId: clinicId,
              onRefreshData: _onRefreshData,
            );
          } else {
            return const ServicesListSkeleton();
          }
        },
      ),
    );
  }
}
