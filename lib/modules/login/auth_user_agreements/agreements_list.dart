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

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      AppToast.showAppToast(msg: 'Не удалось откыть файл $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Запрашивается №7. Никто не знает, почему именно так и от чего это зависит
    void _onLoadDada() {
      context
          .read<UserCubit>()
          .getUserAgreementDocument(idFile: 7, typeAgreement: 'AllAgreement');
    }

    _onLoadDada();

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state.getUserAgreementDocumentStatus ==
            GetUserAgreementDocumentStatuses.failed) {
          return const Text('');
        } else if (state.getUserAgreementDocumentStatus ==
            GetUserAgreementDocumentStatuses.success) {
          return ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                  //? Задается высота для webview. Без этого не получилось сделать
                  height: MediaQuery.of(context).size.height,
                  child: WebView(
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                      _con = webViewController;
                      _con.loadHtmlString(state.userAgreementDocument!.body);
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
    );
  }
}
