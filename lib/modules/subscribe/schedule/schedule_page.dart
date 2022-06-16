import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({
    Key? key,
    required this.pageTitle,
    this.pageSubtitle = '',
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    this.doctorId,
    this.specialisationId,
    this.researchIds,
    required this.categoryTypeId,
    this.cabinet,
    required this.isAny,
  }) : super(key: key);

  final String pageTitle;
  final String pageSubtitle;

  final String userId;
  final String buildingId;
  final String clinicId;
  final String? doctorId;
  final String? specialisationId;
  final List<String>? researchIds;
  final int categoryTypeId;
  final String? cabinet;
  final bool isAny;

  @override
  Widget build(BuildContext context) {
    void _getCalendarList() async {
      context.read<SubscribeCubit>().getCalendarList(
            userId: userId,
            buildingId: buildingId,
            clinicId: clinicId,
            categoryType:
                CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
                    .categoryType,
            doctorId: doctorId,
            specialisationId: specialisationId,
            cabinet: cabinet,
            researchIds: researchIds,
            isAny: isAny,
          );
    }

    _getCalendarList();

    return DefaultScaffold(
      appBarTitle: pageTitle,
      appBarSubtitle: pageSubtitle,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getCalendarStatus == GetCalendarStatuses.failed) {
            return const Text('fail');
          } else if (state.getCalendarStatus == GetCalendarStatuses.success) {
            return Text('SUCCESS');
          } else {
            return const Text('loading');
          }
        },
      ),
    );
  }
}
