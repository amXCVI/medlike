import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/clinics_list/clinics_list.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

import 'clinics_list_skeleton.dart';

@RoutePage()
class ClinicsListPage extends StatefulWidget {
  const ClinicsListPage(
      {Key? key, required this.userId, required this.isChildrenPage})
      : super(key: key);
  final String userId;
  final bool isChildrenPage;

  @override
  State<ClinicsListPage> createState() => _ClinicsListPageState();
}

class _ClinicsListPageState extends State<ClinicsListPage> {
  void _onRefreshData({bool isRefresh = false}) {
    context
        .read<SubscribeCubit>()
        .getAvailableClinicsList(widget.userId, isRefresh);
  }

  @override
  void initState() {
    super.initState();
    _onRefreshData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.isChildrenPage) {
          context.router.replace(const SubscribeProfilesListRoute());
        } else {
          context.router.replaceAll([const MainRoute()]);
        }
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Клиника',
        isChildrenPage: true,
        child: BlocBuilder<SubscribeCubit, SubscribeState>(
          builder: (context, state) {
            if (state.getAvailableClinicsStatus !=
                    GetAvailableClinicsListStatuses.success &&
                state.availableClinicsList != null) {
              _onRefreshData();
            }
            if (state.getAvailableClinicsStatus ==
                GetAvailableClinicsListStatuses.failed) {
              return const Text('');
            } else if (state.getAvailableClinicsStatus ==
                GetAvailableClinicsListStatuses.success) {
              return ClinicsList(
                availableClinicsList:
                    state.availableClinicsList as List<AvailableClinic>,
                userId: widget.userId,
                onRefreshData: _onRefreshData,
              );
            } else {
              return const ClinicsListSkeleton();
            }
          },
        ),
      ),
    );
  }
}
