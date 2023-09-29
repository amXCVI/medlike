import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/dotted_loader/dotted_loader.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late WebViewController webViewController;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        return WillPopScope(
          /// Если чел не хочет платить, разблокируем ячейку и удаляем черновик приема.
          /// Правильно было бы ячейку не разблокировать, но так нельзя (
          onWillPop: () async {
            context.read<SubscribeCubit>().unlockCell(userId: widget.userId);
            context.read<AppointmentsCubit>().deleteAppointment(
                  appointmentId: state.createdAppointmentId as String,
                  userId: widget.userId,
                  doNotShowNotification: true,
                );
            context.router.removeLast();
            return false;
          },
          child: DefaultScaffold(
              appBarTitle: 'Оплата',
              bottomNavigationBar: const SizedBox(),
              child: Stack(
                children: [
                  WebView(
                    onWebViewCreated: (WebViewController controller) {
                      setState(() {
                        webViewController = controller;
                      });
                    },
                    onPageStarted: (url) {
                      setState(() {
                        loading = true;
                      });
                    },
                    onPageFinished: (url) {
                      setState(() {
                        loading = false;
                      });
                    },
                    initialUrl: state.paymentUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                    navigationDelegate: (NavigationRequest request) {
                      if (request.url.contains("result=true")) {
                        context
                            .read<SubscribeCubit>()
                            .resetSubscribeStoryState();
                        context.router.push(AppointmentsRoute(isRefresh: true));
                        return NavigationDecision.prevent;
                      }
                      if (request.url.contains("result=false")) {
                        context.router.pop();
                        AppToast.showAppToast(
                            msg:
                                "Ошибка оплаты. Попробуйте оплатить прием позднее или наличными");
                        return NavigationDecision.prevent;
                      }
                      return NavigationDecision.navigate;
                    },
                  ),
                  !loading
                      ? const SizedBox()
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(),
                          child: const CircularLoader(
                            radius: 5,
                          ),
                        )
                ],
              )),
        );
      },
    );
  }
}
