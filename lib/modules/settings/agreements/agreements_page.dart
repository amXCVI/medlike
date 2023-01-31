import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/settings/agreements/agreements_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AgreementsPage extends StatefulWidget {
  const AgreementsPage({Key? key, this.isAppointmentAgreements = false})
      : super(key: key);

  final bool isAppointmentAgreements;

  @override
  State<AgreementsPage> createState() => _AgreementsPageState();
}

class _AgreementsPageState extends State<AgreementsPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _con;
  double? height;
  String? body;

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      AppToast.showAppToast(msg: 'Не удалось откыть файл $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    void _onLoadDada() {
      context.read<UserCubit>().getUserAgreementDocument(
            typeAgreement: widget.isAppointmentAgreements
                ? 'AppointmentAgreement'
                : 'AllAgreement',
          );
    }

    _onLoadDada();

    return DefaultScaffold(
      appBarTitle: 'Документы',
      isChildrenPage: true,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.getUserAgreementDocumentStatus ==
              GetUserAgreementDocumentStatuses.failed) {
            return const Text('');
          } else if (state.getUserAgreementDocumentStatus ==
              GetUserAgreementDocumentStatuses.success) {
            return ListView(
              children: [
                SizedBox(
                    //? Задается высота для webview. Без этого не получилось сделать
                    height: height ?? MediaQuery.of(context).size.height,
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

                        if(body != null) {
                          Sentry.captureMessage("Body ${body}");
                        }

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
                              Sentry.captureMessage("Javasc ${message.message}");
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
          } else {
            return const AgreementsListSkeleton();
          }
        },
      ),
    );
  }
}
