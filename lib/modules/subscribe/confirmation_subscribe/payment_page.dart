import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        return DefaultScaffold(
          appBarTitle: 'Оплата',
          bottomNavigationBar: const SizedBox(),
          child: kIsWeb
              ? IframeScreen(
                  src: state.paymentUrl as String,
                )
              : WebView(
                  onWebViewCreated: (WebViewController controller) {
                    setState(() {
                      webViewController = controller;
                    });
                  },
                  initialUrl: state.paymentUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.contains("result=true")) {
                      context.read<SubscribeCubit>().resetSubscribeStoryState();
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
            child: WebView(
              onWebViewCreated: (WebViewController controller) {
                setState(() {
                  webViewController = controller;
                });
              },
              initialUrl: state.paymentUrl,
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains("result=true")) {
                  context.read<SubscribeCubit>().resetSubscribeStoryState();
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
          ),
        );
      },
    );
  }
}

class IframeScreen extends StatefulWidget {
  const IframeScreen({super.key, required this.src});

  final String src;

  @override
  _IframeScreenState createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  late Widget _iframeWidget;

  final IFrameElement _iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    _iframeElement.src = widget.src;

    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _iframeWidget,
    );
  }
}
