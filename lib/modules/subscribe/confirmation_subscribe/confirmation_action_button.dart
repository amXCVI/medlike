import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/navigation/routes_names_map.dart';

class ConfirmationActionButtonLabel extends StatelessWidget {
  const ConfirmationActionButtonLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        if (state.creatingAppointmentStatus ==
            CreatingAppointmentStatuses.success) {
          Future.delayed(const Duration(seconds: 1), () {
            context.router.navigateNamed(AppRoutes.myAppointments);
          });
        }

        return state.creatingAppointmentStatus ==
                CreatingAppointmentStatuses.success
            ? SvgPicture.asset(
                'assets/icons/subscribe/success_creating_appointment_icon.svg')
            : state.creatingAppointmentStatus ==
                    CreatingAppointmentStatuses.loading
                ? const CircularProgressIndicator(color: Colors.white)
                : state.creatingAppointmentStatus ==
                        CreatingAppointmentStatuses.failed
                    ? Text(
                        'Ошибочка вышла'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    : Text(
                        'Записаться'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall,
                      );
      },
    );
  }
}
