import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/clinics_list/clinics_list.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

import 'clinics_list_skeleton.dart';

class ClinicsListPage extends StatelessWidget {
  const ClinicsListPage({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  Widget build(BuildContext context) {
    void _onRefreshData({bool isRefresh = false}) {
      context
          .read<SubscribeCubit>()
          .getAvailableClinicsList(userId, isRefresh);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: 'Клиника',
      isChildrenPage: true,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getAvailableClinicsStatus ==
              GetAvailableClinicsListStatuses.failed) {
            return const Text('');
          } else if (state.getAvailableClinicsStatus ==
              GetAvailableClinicsListStatuses.success) {
            return ClinicsList(
              availableClinicsList:
                  state.availableClinicsList as List<AvailableClinic>,
              userId: userId,
              onRefreshData: _onRefreshData,
            );
          } else {
            return const ClinicsListSkeleton();
          }
        },
      ),
    );
  }
}
