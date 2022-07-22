import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/settings/agreements/agreements_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AgreementsPage extends StatefulWidget {
  const AgreementsPage({Key? key}) : super(key: key);

  @override
  State<AgreementsPage> createState() => _AgreementsPageState();
}

class _AgreementsPageState extends State<AgreementsPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _con;

  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     AppToast.showAppToast(msg: 'Не удалось откыть файл $url');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    void _onLoadDada() {
      context.read<UserCubit>().getUserAgreementDocument(idFile: 7);
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
                    height: MediaQuery.of(context).size.height - 56,
                    child: WebView(
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller.complete(webViewController);
                        _con = webViewController;
                        _con.loadHtmlString(state.userAgreementDocument!.body);
                      },
                      //! Переделать. На Android файлы не открываются, на ios открываются,
                      //! но не в нативном просмотрщике.
                      //! С navigationDelegate все падает, не из-за возвращаемого значения
                      // navigationDelegate: (NavigationRequest request) async {
                      //   if (request.url == 'about:blank') {
                      //     return NavigationDecision.navigate;
                      //   } else {
                      //     _launchURL(request.url);
                      //     return NavigationDecision.navigate;
                      //   }
                      // },
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
