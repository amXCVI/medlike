import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/navigation/router.dart';

class ConfirmationActionButtonLabel extends StatefulWidget {
  const ConfirmationActionButtonLabel({Key? key, required this.userId})
      : super(key: key);

  final String userId;

  @override
  State<ConfirmationActionButtonLabel> createState() =>
      _ConfirmationActionButtonLabelState();
}

class _ConfirmationActionButtonLabelState
    extends State<ConfirmationActionButtonLabel> {
  bool isOpenedPaymentPage = false;

  void setIsOpenedPaymentPage() {
    setState(() {
      isOpenedPaymentPage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        if (state.creatingAppointmentStatus ==
            CreatingAppointmentStatuses.finished) {}

        if (state.creatingAppointmentStatus ==
                CreatingAppointmentStatuses.finished &&
            state.selectedPayType == AppConstants.noPayedPayType) {
          Future.delayed(const Duration(seconds: 1), () {
            context.router.push(AppointmentsRoute(isRefresh: true));
          });
          Future.delayed(const Duration(seconds: 3), () {
            context.read<SubscribeCubit>().resetSubscribeStoryState();
          });
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.registerOrderStatus == RegisterOrderStatuses.success &&
              !isOpenedPaymentPage) {
            setIsOpenedPaymentPage();
            context.router.push(PaymentRoute(userId: widget.userId));
          }
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.registerOrderStatus == RegisterOrderStatuses.loading) {
            setState(() {
              isOpenedPaymentPage = false;
            });
          }
        });

        return state.creatingAppointmentStatus ==
                CreatingAppointmentStatuses.finished
            ? Lottie.asset(
                'assets/animations/check_white.json',
                width: 40,
                height: 40,
                alignment: Alignment.center,
                repeat: false,
              )
            : state.creatingAppointmentStatus ==
                        CreatingAppointmentStatuses.loading ||
                    state.registerOrderStatus ==
                        RegisterOrderStatuses.loading ||
                    state.getAppointmentInfoStatus ==
                        GetAppointmentInfoStatuses.loading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        state.getAppointmentInfoStatus ==
                                GetAppointmentInfoStatuses.loading
                            ? 'Ожидайте'
                            : 'Записаться'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      Lottie.asset('assets/animations/loader_white.json',
                          width: 40),
                    ],
                  )
                : state.creatingAppointmentStatus ==
                        CreatingAppointmentStatuses.failed
                    ? Text(
                        'Попробуйте заново'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    : SizedBox(
                        width: 150,
                        child: Text(
                          'Записаться'.toUpperCase(),
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      );
      },
    );
  }
}
