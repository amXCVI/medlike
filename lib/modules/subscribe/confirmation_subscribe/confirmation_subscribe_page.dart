import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/agreements_checker.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/appointment_info.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/confirmation_action_button.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/user_info.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/dividers/dash_divider.dart';

class ConfirmationSubscribePage extends StatefulWidget {
  const ConfirmationSubscribePage({Key? key, required this.userId})
      : super(key: key);

  final String userId;

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
    void _createNewAppointment() {
      HapticFeedback.heavyImpact();
      context.read<SubscribeCubit>().createNewAppointment(
            userId: widget.userId,
            userName: context.read<UserCubit>().getShortUserName(widget.userId),
          );
    }

    return WillPopScope(
      onWillPop: () async {
        context.read<SubscribeCubit>().unlockCell(userId: widget.userId);
        Navigator.pop(context);
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Запись на прием',
        isChildrenPage: true,
        actionButton: BlocBuilder<SubscribeCubit, SubscribeState>(
          builder: (context, state) {
            bool isDisabledButton = !isCheckedAgreements ||
                state.getAppointmentInfoStatus ==
                    GetAppointmentInfoStatuses.loading ||
                state.creatingAppointmentStatus ==
                    CreatingAppointmentStatuses.loading;
            return FloatingActionButton.extended(
                onPressed: isDisabledButton ? () {} : _createNewAppointment,
                backgroundColor: !isDisabledButton
                    ? Theme.of(context).primaryColor
                    : AppColors.lightText,
                extendedPadding: const EdgeInsets.all(15),
                label: const ConfirmationActionButtonLabel());
          },
        ),
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
            // const SizedBox(height: 24),
            // const PaymentWidget(),
            const AppointmentInfo(),
            const SizedBox(height: 24),
            const DashDivider(),
            const SizedBox(height: 24),
            AgreementsChecker(
              isChecked: isCheckedAgreements,
              setIsCheckedValue: setIsCheckedValue,
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
