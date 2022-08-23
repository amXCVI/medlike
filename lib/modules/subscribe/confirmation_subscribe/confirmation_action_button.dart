import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmationActionButtonLabel extends StatelessWidget {
  const ConfirmationActionButtonLabel({Key? key}) : super(key: key);

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
          Uri.parse(url),
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
        ),
        mode: LaunchMode.inAppWebView,
      );
    } else {
      AppToast.showAppToast(msg: 'Не удалось откыть страницу оплаты');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        if (state.creatingAppointmentStatus ==
                CreatingAppointmentStatuses.success &&
            state.registerOrderStatus != RegisterOrderStatuses.loading) {
          context.read<AppointmentsCubit>().setSelectedDate(state.selectedCalendarItem!.date);
          Future.delayed(const Duration(seconds: 1), () {
            context.router.push(AppointmentsRoute(isRefresh: true));
          });
        }

        if (state.registerOrderStatus == RegisterOrderStatuses.success) {
          // _launchURL('${state.paymentUrl}');
          // return SizedBox(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: WebView(
          //     initialUrl: state.paymentUrl,
          //     javascriptMode: JavascriptMode.unrestricted,
          //     navigationDelegate: (NavigationRequest request) {
          //       print(request.url);
          //       if (request.url.contains("medlike:")) {
          //         print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          //         // launch(request.url);
          //         return NavigationDecision.prevent;
          //       } else {
          //         print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
          //         return NavigationDecision.navigate;
          //       }
          //     },
          //   ),
          // );
        }

        return state.creatingAppointmentStatus ==
                CreatingAppointmentStatuses.success
            ? SvgPicture.asset(
                'assets/icons/subscribe/success_creating_appointment_icon.svg')
            : state.creatingAppointmentStatus ==
                        CreatingAppointmentStatuses.loading ||
                    state.registerOrderStatus == RegisterOrderStatuses.loading
                ? const SizedBox(
                    width: 150,
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.white)))
                : state.creatingAppointmentStatus ==
                        CreatingAppointmentStatuses.failed
                    ? Text(
                        'Ошибочка вышла'.toUpperCase(),
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
