import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EsiaLoginPage extends StatelessWidget {
  const EsiaLoginPage({Key? key}) : super(key: key);

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      AppToast.showAppToast(msg: 'Не удалось откыть страницу $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: AppConstants.esiaOAuthPageURL,
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (NavigationRequest request) async {
        if (request.url == 'about:blank') {
          print('111111');
          print(request);
          print(request.url);
          return NavigationDecision.navigate;
        } else {
          print('2222222');
          print(request);
          print(request.url);
          _launchURL(request.url);
          return NavigationDecision.prevent;
        }
      },
      gestureNavigationEnabled: true,
    );
  }
}
