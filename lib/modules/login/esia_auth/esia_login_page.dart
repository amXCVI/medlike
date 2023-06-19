import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class EsiaLoginPage extends StatefulWidget {
  const EsiaLoginPage({Key? key}) : super(key: key);

  @override
  State<EsiaLoginPage> createState() => _EsiaLoginPageState();
}

class _EsiaLoginPageState extends State<EsiaLoginPage> {
  final String authorizationUrl = AppConstants.esiaOAuthPageURL;

  late bool isHideWebView = false;
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    Future<bool> checkIsAcceptedUserAgreements() async {
      bool res = await context.read<UserCubit>().checkUserAgreements();
      if (!res) {
        context.router.replaceAll([AuthUserAgreementsRoute()]);
      } else {
        context.router.navigateNamed(AppRoutes.loginPinCodeCreate);
      }
      return res;
    }

    void _authenticateWithEsiaToken({required String esiaToken}) async {
      await context.read<UserCubit>().esiaAuth(esiaToken).then((esiaAuthRes) {
        if (esiaAuthRes!.isUserExists) {
          // Если чел уже зарегистриррован в системе
          checkIsAcceptedUserAgreements();
        } else {
          context.router.replaceAll([
            EsiaRegisterRoute(
              firstName: esiaAuthRes.registrationModel!.firstName,
              lastName: esiaAuthRes.registrationModel!.lastName,
              middleName: esiaAuthRes.registrationModel!.middleName,
              phoneNumber: esiaAuthRes.registrationModel!.phoneNumber,
              snils: esiaAuthRes.registrationModel!.snils,
              sex: esiaAuthRes.registrationModel!.sex,
              birthday: esiaAuthRes.registrationModel!.birthday,
            )
          ]);
        }
      });
    }

    // Получаю токен со страницы webView
    // Не уверен, что решение адекватное. Скорее наоборот
    // Бэкендеры утверждают, что класть токен в url - плохой тон, поэтому так
    void _getAuthEsiaTokenFromHTMLPage() async {
      String docu = await _webViewController
          .evaluateJavascript('document.documentElement.innerHTML') as String;
      var dom = parse(docu);
      String? esiaToken = dom.getElementById('esia')?.text;
      print('esiaToken: $esiaToken');
      if (esiaToken != null && esiaToken.isNotEmpty) {
        _authenticateWithEsiaToken(esiaToken: esiaToken);
      }
    }

    return DefaultScaffold(
      appBarTitle: '',
      bottomNavigationBar: const SizedBox(),
      child: Stack(children: [
        WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: authorizationUrl.toString(),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          onPageFinished: (finish) {
            _getAuthEsiaTokenFromHTMLPage();
          },
          onProgress: (i) {
            setState(() {
              isHideWebView = true;
            });
          },
          navigationDelegate: (navReq) async {
            if (navReq.url.contains('status')) {
              setState(() {
                isHideWebView = true;
              });
            } else {
              setState(() {
                isHideWebView = false;
              });
            }
            return NavigationDecision.navigate;
          },
        ),
        isHideWebView
            ? Container(
                color: AppColors.secondBackground,
                child: const Center(child: CircularLoader(radius: 50)))
            : const SizedBox()
      ]),
    );
  }
}
