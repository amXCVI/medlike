import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/utils/esia/esia_o_auth.dart';
import 'package:oauth2_client/access_token_response.dart';

class EsiaLoginButton extends StatelessWidget {
  const EsiaLoginButton({Key? key}) : super(key: key);

  Future<void> handleTapOnEsiaLogin(BuildContext context) async {
    //clientID
    String cID = 'x';

    //clientSecret
    String cSecret = 'y';

    // OAuth2Client client = GitHubOAuth2Client(
    //     redirectUri: 'my.test.app:/oauth2redirect',
    //     customUriScheme: 'my.test.app');

    AccessTokenResponse tknResp = await client.getTokenWithAuthCodeFlow(
        clientId: cID, clientSecret: cSecret);

    print('!!!!!!: $tknResp');

    // http.Response resp = await http.get('https://api.github.com/user/repos',
    //     headers: {'Authorization': 'Bearer ' + tknResp.accessToken});
    // AccessTokenResponse tknResp = (await client.getTokenWithAuthCodeFlow(
    //   clientId: '12',
    //   enablePKCE: false,
    // ));
    //
    print(tknResp);
    if (tknResp.isExpired()) {
      var myCustomFieldVal = tknResp.getRespField('firstName');
      print(myCustomFieldVal);
    }
    // context.router.push(const EsiaLoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handleTapOnEsiaLogin(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: SvgPicture.asset('assets/icons/login/ic_gosuslugi_filled.svg'),
      ),
    );
  }
}
