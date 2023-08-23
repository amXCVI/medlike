import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/api_constants.dart';

class AppointmentsFiltersWidget extends StatelessWidget {
  const AppointmentsFiltersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleSelectFilter(
      String userId,
    ) {
      context.read<AppointmentsCubit>().setSelectedFilterId(userId);
    }

    return Container(
      color: AppColors.secondBackground,
      height: 107,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Пользователь',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(
            height: 75,
            child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
              if (state.getUserProfileStatus ==
                      GetUserProfilesStatusesList.success &&
                  state.userProfiles != null) {
                return BlocBuilder<AppointmentsCubit, AppointmentsState>(
                    builder: (context, appointmentState) {
                  return ListView(
                    padding: const EdgeInsets.all(8.0),
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      state.userProfiles!.length > 1
                          ? AppointmentFilterItem(
                              handleTapItem: handleSelectFilter,
                              id: '',
                              title: 'Все',
                              isSelected: appointmentState
                                          .selectedAppointmentFilterId ==
                                      '' ||
                                  appointmentState
                                          .selectedAppointmentFilterId ==
                                      null,
                            )
                          : const SizedBox(),
                      ...state.userProfiles!.map((e) {
                        bool isSelected =
                            appointmentState.selectedAppointmentFilterId ==
                                e.id;
                        return AppointmentFilterItem(
                          handleTapItem: handleSelectFilter,
                          id: e.id,
                          title: '${e.firstName} ${e.lastName![0]}.',
                          isSelected: isSelected,
                          avatarId: e.avatar,
                        );
                      })
                    ],
                  );
                });
              } else {
                return const SizedBox();
              }
            }),
          ),
        ],
      ),
    );
  }
}

class AppointmentFilterItem extends StatelessWidget {
  const AppointmentFilterItem({
    Key? key,
    required this.handleTapItem,
    required this.id,
    required this.title,
    required this.isSelected,
    this.avatarId,
  }) : super(key: key);

  final void Function(String) handleTapItem;
  final String id;
  final String title;
  final bool isSelected;
  final String? avatarId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, right: 8.0, bottom: 15.0, left: 8.0),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          handleTapItem(id);
        },
        child: Container(
          padding: id == ''
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
              : const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: id == ''
              ? Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isSelected ? Colors.white : AppColors.mainText,
                      ),
                )
              : Row(
                  children: [
                    avatarId != null
                        ? CircleAvatar(
                            radius: 13,
                            backgroundImage: NetworkImage(
                              '${ApiConstants.baseUrl}/avatar/xxxhdpi/$id/$avatarId',
                            ),
                          )
                        : CircleAvatar(
                            radius: 13,
                            backgroundColor: AppColors.mainBrand[100],
                            child: Text(title[0].toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                    )),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                isSelected ? Colors.white : AppColors.mainText,
                          ),
                    ),
                    const SizedBox(width: 9),
                  ],
                ),
        ),
      ),
    );
  }
}
