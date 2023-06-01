import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/appointment_item_recomendations.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/clinic_address_helper.dart';
import 'package:medlike/widgets/buttons/simple_button.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({Key? key, required this.appointmentItem})
      : super(key: key);

  final AppointmentModelWithTimeZoneOffset appointmentItem;

  @override
  Widget build(BuildContext context) {
    final title = appointmentItem.doctorInfo.specialization != null
        ? '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}'
        : CategoryTypes.getCategoryTypeByCategoryTypeId(
                appointmentItem.categoryType)
            .russianCategoryTypeName;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Название приема
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: appointmentItem.categoryType == 1 ||
                        appointmentItem.categoryType == 0
                    ? Text(title,
                        style: Theme.of(context).textTheme.titleMedium)
                    : RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: CategoryTypes
                                        .getCategoryTypeByCategoryTypeId(
                                            appointmentItem.categoryType)
                                    .russianCategoryTypeName,
                                style: Theme.of(context).textTheme.titleMedium),
                            ...appointmentItem.researches.map((e) => TextSpan(
                                text: ', ${e.name}',
                                style: Theme.of(context).textTheme.titleMedium))
                          ],
                        ),
                      ),
              ),
              SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg')
            ],
          ),
          // Доктор (аватарка, ФИО)
          appointmentItem.doctorInfo.id != null &&
                  appointmentItem.doctorInfo.id!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            child: Text(
                              appointmentItem.doctorInfo.lastName![0],
                              style: const TextStyle(fontFamily: 'AquawaxPro'),
                            ),
                            backgroundColor: AppColors.mainBrand[100],
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                              '${appointmentItem.doctorInfo.lastName} ${appointmentItem.doctorInfo.firstName![0]}. ${appointmentItem.doctorInfo.middleName![0]}.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.lightText)),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/icons/appointments/raiting_gold_star.svg'),
                          const SizedBox(width: 6),
                          const Text('4.8')
                        ],
                      ),
                    ],
                  ),
                )
              : const SizedBox(height: 15.0),
          // Адрес
          appointmentItem.clinicInfo.address != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/appointments/solid.svg'),
                    const SizedBox(width: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                          ClinicAddressHelper.getShortAddress(
                                  appointmentItem.clinicInfo.address ?? '') +
                              ', ${appointmentItem.researchPlace ?? ''}',
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                )
              : const SizedBox(),
          // Рекомендации
          AppointmentItemRecommendations(
            recommendations: appointmentItem.recommendations ?? '',
            serviceName: appointmentItem.categoryType == 1 ||
                    appointmentItem.categoryType == 0
                ? '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}'
                : '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.researches.map(
                      (e) => e.name as String,
                    ).join(', ')}',
          ),
          // Профиль пациента
          Row(children: [
            SvgPicture.asset('assets/icons/appointments/profile.svg'),
            const SizedBox(width: 8.0),
            Text(appointmentItem.patientInfo.name.toString()),
          ]),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const SizedBox(width: 8.0),
              RichText(
                text: WidgetSpan(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.circleBgFirst,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            'assets/icons/appointments/ic_rub.svg'),
                        const SizedBox(width: 8.0),
                        Text('Оплачено'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (appointmentItem.status == 4) const SizedBox(height: 14.0),
          if (appointmentItem.status == 4)
            BlocBuilder<AppointmentsCubit, AppointmentsState>(
              builder: (context, state) {
                final isDeleting = state.deleteAppointmentStatus ==
                        DeleteAppointmentStatuses.loading &&
                    state.appointmentLoadingId == appointmentItem.id;
                final isConfirming = state.putAppointmentStatus ==
                        PutAppointmentsStatuses.loading &&
                    state.appointmentLoadingId == appointmentItem.id;

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
                            appointmentId: appointmentItem.id,
                            userId: appointmentItem.patientInfo.id as String);
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
                              context
                                  .read<AppointmentsCubit>()
                                  .deleteAppointment(
                                      appointmentId: appointmentItem.id,
                                      userId: appointmentItem.patientInfo.id
                                          as String);
                            }))
                  ],
                );
              },
            )
        ],
      ),
    );
  }
}
