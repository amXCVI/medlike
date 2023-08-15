import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/agreements_checker.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/appointment_info.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/confirmation_action_button.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/payment_widget.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/user_info.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/dividers/dash_divider.dart';

class ConfirmationSubscribePage extends StatefulWidget {
  const ConfirmationSubscribePage(
      {Key? key, required this.userId, required this.timeZoneHours})
      : super(key: key);

  final String userId;
  final int timeZoneHours;

  @override
  State<ConfirmationSubscribePage> createState() =>
      _ConfirmationSubscribePageState();
}

class _ConfirmationSubscribePageState extends State<ConfirmationSubscribePage> {
  late bool isCheckedAgreements = false;

  void setIsCheckedValue(bool value) {
    setState(() {
      isCheckedAgreements = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _createNewAppointment(
        String selectedPayType, String? createdAppointmentId) async {
      HapticFeedback.heavyImpact();

      /// Если оплата картой
      if (selectedPayType == AppConstants.cardPayType) {
        context.read<SubscribeCubit>().createNewAppointment(
            userId: widget.userId,
            userName: context.read<UserCubit>().getShortUserName(widget.userId),
            timezoneHours: widget.timeZoneHours);
        return;

        /// Оплата наличкой в кассе
      } else {
        context.read<SubscribeCubit>().createNewAppointment(
            userId: widget.userId,
            userName: context.read<UserCubit>().getShortUserName(widget.userId),
            timezoneHours: widget.timeZoneHours);
      }
    }

    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        bool isDisabledButton = !isCheckedAgreements ||
          state.getAppointmentInfoStatus ==
              GetAppointmentInfoStatuses.loading ||
          state.creatingAppointmentStatus ==
              CreatingAppointmentStatuses.loading ||
          state.registerOrderStatus == RegisterOrderStatuses.loading;

        return WillPopScope(
          onWillPop: () async {
            context.read<SubscribeCubit>().unlockCell(userId: widget.userId);
            if (state.isAnyDoctor == true) {
              context.read<SubscribeCubit>().clearSelectedDoctor();
            }
            Navigator.pop(context);
            return false;
          },
          child: DefaultScaffold(
            appBarTitle: 'Запись на прием',
            isChildrenPage: true,
            actionButton: SizedBox(
                  width: 200,
                  child: AnimatedFractionallySizedBox(
                    duration: const Duration(milliseconds: 500),
                    widthFactor: state.creatingAppointmentStatus ==
                            CreatingAppointmentStatuses.finished
                        ? 0.25
                        : 1,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        isDisabledButton
                            ? {}
                            : _createNewAppointment(
                                state.selectedPayType!,
                                state.createdAppointmentId,
                              );
                      },
                      backgroundColor: !isDisabledButton
                          ? Theme.of(context).primaryColor
                          : AppColors.lightText,
                      extendedPadding: const EdgeInsets.all(15),
                      label:
                          ConfirmationActionButtonLabel(userId: widget.userId),
                    ),
                  ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 20),
                  UserInfo(userId: widget.userId),
                  const SizedBox(height: 19),
                  const DashDivider(),

                  /// Карточки с выбором способа оплаты.
                  /// Не работает оплата картой, поэтому закомментировано
                  /// Раскомментировать в кубите
                  /// получение информации о приеме
                  const SizedBox(height: 24),
                  const PaymentWidget(),
                  const AppointmentInfo(),
                  const SizedBox(height: 24),
                  const DashDivider(),
                  const SizedBox(height: 24),
                  AgreementsChecker(
                    isChecked: isCheckedAgreements,
                    setIsCheckedValue: setIsCheckedValue,
                  ),
                  const SizedBox(width: 15),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
