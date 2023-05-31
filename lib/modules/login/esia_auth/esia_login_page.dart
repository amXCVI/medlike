import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EsiaLoginPage extends StatelessWidget {
  const EsiaLoginPage({Key? key}) : super(key: key);

  final String authorizationUrl = AppConstants.esiaOAuthPageURL;

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: authorizationUrl.toString(),
      navigationDelegate: (navReq) {
        print('navReq: $navReq');
        // print(navReq.url);
        if (navReq.url.contains('signin-oidc')) {
          // responseUrl = Uri.parse(navReq.url);
          print('navReq.url: ${navReq.url}');
          Uri.parse(navReq.url).queryParameters.forEach((k, v) {
            print('key: $k - value: $v');
          });
          return NavigationDecision.navigate;
          // return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    );
  }
}
