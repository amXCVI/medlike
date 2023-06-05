import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/settings/agreements/agreements_list_skeleton.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AgreementsList extends StatefulWidget {
  const AgreementsList({Key? key}) : super(key: key);

  @override
  State<AgreementsList> createState() => _AgreementsListState();
}

class _AgreementsListState extends State<AgreementsList> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _con;
  double? height;
  String? body;

  _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      //await launchUrl(uri);
    } else {
      AppToast.showAppToast(msg: 'Не удалось откыть файл $url');
    }
  }

  /// Запрашивается №7. Никто не знает, почему именно так и от чего это зависит
    void _onLoadDada() {
      context
          .read<UserCubit>()
          .getUserAgreementDocument(typeAgreement: 'userAgreement');
    }

  @override
  void initState() {
    super.initState();
    _onLoadDada();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.getUserAgreementDocumentStatus ==
            GetUserAgreementDocumentStatuses.failed) {
          return const Text('');
        } else if (state.getUserAgreementDocumentStatus ==
            GetUserAgreementDocumentStatuses.success) {
          return LayoutBuilder(
            /// Фикс высоты для webview
            builder: (BuildContext context, BoxConstraints constraints) {
              return ListView(
                children: [
                  SizedBox(
                      //? Задается высота для webview. Без этого не получилось сделать
                      height: constraints.maxHeight,
                      child: WebView(
                        onWebViewCreated: (WebViewController webViewController) {
                          const js = '''
                            <script>
                              var body = document.body,
                              html = document.documentElement;

                              var height = Math.max( body.scrollHeight, body.offsetHeight, 
                              html.clientHeight, html.scrollHeight, html.offsetHeight );

                              Print.postMessage(height);
                            </script>'''; 

                          _controller.complete(webViewController);
                          _con = webViewController;
                          _con.loadHtmlString(
                            body ?? (state.userAgreementDocument!.body + js)
                          );
                        },
                        javascriptMode: JavascriptMode.unrestricted,
                        javascriptChannels: {
                          JavascriptChannel(
                            name: 'Print',
                            onMessageReceived: (JavascriptMessage message) {
                              setState(() {
                                height = double.parse(message.message);
                                body = state.userAgreementDocument!.body;
                              });
                            })
                        },
                        navigationDelegate: (NavigationRequest request) async {
                          if (request.url == 'about:blank') {
                            return NavigationDecision.navigate;
                          } else {
                            _launchURL(request.url);
                            return NavigationDecision.prevent;
                          }
                        },
                        gestureNavigationEnabled: true,
                      ))
                ],
              );
            }
          );
        } else {
          return const AgreementsListSkeleton();
        }
      },
    );
  }
}
