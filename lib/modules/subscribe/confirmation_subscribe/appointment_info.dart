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
              const AppointmentInfoSubtitle(title: 'Рекомендации'),
              state.appointmentInfoData != null
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
                children: [
                  AppointmentInfoItem(
                      title: 'Клиника', value: state.selectedBuilding!.name),
                  const SizedBox(width: 24),
                  SizedBox(
                    width: 150,
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
              state.selectedDoctor != null
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
                  AppointmentInfoItem(
                      title: 'Дата',
                      value: DateFormat("dd.MM.yyyy")
                          .format(state.selectedTimetableCell!.time)),
                  const SizedBox(width: 24),
                  SizedBox(
                    width: 140,
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
