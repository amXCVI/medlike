import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/modules/appointments/appointment_item.dart';


class AppointmentsParagraph extends StatelessWidget {
  const AppointmentsParagraph({
    Key? key,
    required this.statusItem,
    required this.appointmentsList,
    required this.clinicsList,
    required this.onRefreshData,
  }) : super(key: key);

  final StatusItem statusItem;
  final List<AppointmentModel> appointmentsList;
  final List<ClinicModel> clinicsList;
  final Function onRefreshData;

  ClinicModel? getClinic(AppointmentModel item) {
    for(var clinic in clinicsList) {
      if(clinic.id == item.clinicInfo.id) {
        return clinic;
      }
    }
    return null;
  }

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
                              child: SliderChild(
                                item: item,
                                getClinic: getClinic, 
                                index: appointmentsList.indexOf(item)
                              )
                            )
                          : AppointmentItem(
                              appointmentItem: item,
                              clinic: getClinic(item)!
                            )),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class SliderChild extends StatefulWidget {
  const SliderChild({
    Key? key,
    required this.item,
    required this.getClinic,
    required this.index
  }) : super(key: key);

  final AppointmentModel item;
  final ClinicModel? Function(AppointmentModel) getClinic; 
  final int index;

  @override
  State<SliderChild> createState() => _SliderChildState();
}

class _SliderChildState extends State<SliderChild> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        final state = context.read<TourCubit>().state;
        if(state.tourStatuses == TourStatuses.first
          && state.isAppointmentShown != true
          && widget.index == 0
        ) {
          onShow(context);
        }
      }
    );
  }

  void onShow(BuildContext context) {
    Slidable.of(context)!.openEndActionPane();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Slidable.of(context)!.close();
      context.read<TourCubit>().checkAppointment();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourState>(
      buildWhen: (_, state) {
        
        return true;
      },
      builder: (context, state) {
        return AppointmentItem(
          appointmentItem: widget.item,
          clinic: widget.getClinic(widget.item)!,
        );
      }
    );
  }
}
