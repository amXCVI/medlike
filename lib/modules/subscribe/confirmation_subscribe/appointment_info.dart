import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/appointment_info_item.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/appointment_recommendations.dart';
import 'package:medlike/utils/helpers/clinic_address_helper.dart';

class AppointmentInfo extends StatelessWidget {
  const AppointmentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.appointmentInfoData != null &&
                      state.getAppointmentInfoStatus !=
                          GetAppointmentInfoStatuses.loading &&
                      state.appointmentInfoData!.recommendations.isNotEmpty
                  ? const AppointmentInfoSubtitle(title: 'Рекомендации')
                  : const SizedBox(),
              state.appointmentInfoData != null &&
                      state.getAppointmentInfoStatus !=
                          GetAppointmentInfoStatuses.loading
                  ? AppointmentRecommendations(
                      recommendations: state
                          .appointmentInfoData!.recommendations
                          .asMap()
                          .map((index, item) => MapEntry(
                              index, '${index + 1}. ${item.recommendation}'))
                          .values
                          .toList()
                          .map((e) => e)
                          .toString())
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: AppointmentInfoItem(
                        title: 'Клиника', value: state.selectedBuilding!.name),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: AppointmentInfoItem(
                        title: 'Кабинет',
                        value: state.selectedTimetableCell!.cabinetName),
                  )
                ],
              ),
              AppointmentInfoItem(
                  title: 'Адрес',
                  value: ClinicAddressHelper.getShortAddress(
                      state.selectedBuilding!.address)),
              state.selectedDoctor != null &&
                      state.selectedDoctor!.id.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppointmentInfoItem(
                            title: 'ФИО врача',
                            value:
                                '${state.selectedDoctor!.lastName} ${state.selectedDoctor!.firstName} ${state.selectedDoctor!.middleName}'),
                        AppointmentInfoItem(
                            title: 'Специализация',
                            value: state.selectedDoctor!.specialization),
                      ],
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: AppointmentInfoItem(
                        title: 'Дата',
                        value: DateFormat("dd.MM.yyyy")
                            .format(state.selectedTimetableCell!.time)),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: AppointmentInfoItem(
                        title: 'Время',
                        value: DateFormat("HH:mm")
                            .format(state.selectedTimetableCell!.time)),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
