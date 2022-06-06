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
    context
        .read<SubscribeCubit>()
        .getServicesList(userId, clinicId, buildingId);
    return DefaultScaffold(
      appBarTitle: 'Услуги',
      isChildrenPage: true,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getAvailableClinicsStatus ==
              GetAvailableClinicsListStatuses.failed) {
            return const Text('');
          } else if (state.getAvailableClinicsStatus ==
              GetAvailableClinicsListStatuses.success) {
            return ServicesList(
              servicesList: state.servicesList as List<NavigationItem>,
              userId: userId,
              buildingId: buildingId,
              clinicId: clinicId,
            );
          } else {
            return const ServicesListSkeleton();
          }
        },
      ),
    );
  }
}
