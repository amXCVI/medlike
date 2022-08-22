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
    required this.onRefreshData,
  }) : super(key: key);

  final StatusItem statusItem;
  final List<AppointmentModel> appointmentsList;
  final Function onRefreshData;

  @override
  Widget build(BuildContext context) {
    void _deleteAppointment(String appointmentId, String userId) {
      HapticFeedback.lightImpact();
      context
          .read<AppointmentsCubit>()
          .deleteAppointment(appointmentId: appointmentId, userId: userId);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          appointmentsList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 27.0, bottom: 5.0, left: 6.0, right: 16.0),
                  child: Text(
                    statusItem.paragraphName,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.left,
                  ),
                )
              : const SizedBox(),
          ...appointmentsList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: AppointmentStatuses.cancellableStatusIds
                              .contains(item.status)
                          ? Slidable(
                              key: UniqueKey(),
                              endActionPane: ActionPane(
                                motion: const BehindMotion(),
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    _deleteAppointment(
                                        item.id, item.patientInfo.id as String);
                                  },
                                ),
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        _deleteAppointment(item.id,
                                            item.patientInfo.id as String);
                                      },
                                      child: Container(
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const SizedBox(width: 20.0),
                                              SvgPicture.asset(
                                                  'assets/icons/appointments/ic_delete_appointment.svg'),
                                              const SizedBox(width: 20.0),
                                              // Text(
                                              //   'Отменить прием',
                                              //   style: Theme.of(context)
                                              //       .textTheme
                                              //       .labelSmall
                                              //       ?.copyWith(
                                              //           color: Colors.white),
                                              // ),
                                            ],
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
                            )),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
