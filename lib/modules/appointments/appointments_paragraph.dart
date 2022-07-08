import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/appointment_item.dart';

class AppointmentsParagraph extends StatelessWidget {
  const AppointmentsParagraph({
    Key? key,
    required this.statusItem,
    required this.appointmentsList,
  }) : super(key: key);

  final StatusItem statusItem;
  final List<AppointmentModel> appointmentsList;

  @override
  Widget build(BuildContext context) {
    void _deleteAppointment(String appointmentId, String userId) {
      HapticFeedback.vibrate();
      context
          .read<AppointmentsCubit>()
          .deleteAppointment(appointmentId: appointmentId, userId: userId);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          appointmentsList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 27.0, bottom: 5.0, left: 16.0, right: 16.0),
                  child: Text(
                    statusItem.paragraphName,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                )
              : const SizedBox(),
          ...appointmentsList
              .map((item) => AppointmentStatuses.cancellableStatusIds
                      .contains(item.status)
                  ? Slidable(
                      key: UniqueKey(),
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        dismissible: DismissiblePane(
                          onDismissed: () {
                            _deleteAppointment(
                                item.id, item.patientInfo.id as String);
                          },
                        ),
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: InkWell(
                                onTap: () {
                                  _deleteAppointment(
                                      item.id, item.patientInfo.id as String);
                                },
                                child: Container(
                                  // width: 100,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 34.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                    color: Theme.of(context).errorColor,
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/appointments/ic_delete_appointment.svg'),
                                        const SizedBox(width: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      child: AppointmentItem(
                        appointmentItem: item,
                      ),
                    )
                  : AppointmentItem(
                      appointmentItem: item,
                    ))
              .toList(),
        ],
      ),
    );
  }
}
