import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/widgets/buttons/simple_button.dart';

class ApplyAndCancellAppointment extends StatelessWidget {
  const ApplyAndCancellAppointment(
      {Key? key, required this.appointmentId, required this.userId})
      : super(key: key);

  final String appointmentId;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        final isDeleting = state.deleteAppointmentStatus ==
                DeleteAppointmentStatuses.loading &&
            state.appointmentLoadingId == appointmentId;
        final isConfirming =
            state.putAppointmentStatus == PutAppointmentsStatuses.loading &&
                state.appointmentLoadingId == appointmentId;

        final isDisabled = isConfirming || isDeleting;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: SimpleButton(
              isPrimary: true,
              isLoading: isConfirming,
              isDisabled: isDisabled,
              labelText: 'Подтвердить',
              onTap: () {
                context.read<AppointmentsCubit>().confirmAppointment(
                      appointmentId: appointmentId,
                      userId: userId,
                    );
              },
            )),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: SimpleButton(
                    labelText: 'Отменить',
                    isLoading: isDeleting,
                    isDisabled: isDisabled,
                    onTap: () {
                      context.read<AppointmentsCubit>().deleteAppointment(
                            appointmentId: appointmentId,
                            userId: userId,
                          );
                    }))
          ],
        );
      },
    );
  }
}
