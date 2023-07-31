import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/schedule/reviews_widget.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';

class DoctorSubpage extends StatelessWidget {
  const DoctorSubpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
      if (state.getDoctorInfoDataStatus == GetDoctorInfoDataStatuses.failed) {
        return const Text('Ошибка загрузки');
      } else if (state.getDoctorInfoDataStatus ==
          GetDoctorInfoDataStatuses.success) {
        return ReviewsWidget(
          reviews: state.selectedDoctorFullData!.reviews,
        );
      } else {
        return const CircularLoader();
      }
    });
  }
}
