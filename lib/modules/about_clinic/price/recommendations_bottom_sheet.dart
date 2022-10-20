import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';

class RecommendationBottomSheet extends StatelessWidget {
  const RecommendationBottomSheet({Key? key, required this.serviceId})
      : super(key: key);

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12), topLeft: Radius.circular(12)),
              color: Theme.of(context).backgroundColor,
            ),
            child: BlocBuilder<ClinicsCubit, ClinicsState>(
              builder: (context, state) {
                return SizedBox(height: 100);
              },
            )),
      ]),
    );
  }
}
