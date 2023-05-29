import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';

class MyOAuth2Client extends OAuth2Client {
  MyOAuth2Client({required String redirectUri, required String customUriScheme})
      : super(
            authorizeUrl:
                'https://tgn.medotrade.ru:23340/MedLike/Env04/esia/login', //Your service's authorization url
            tokenUrl:
                'https://tgn.medotrade.ru:23340/MedLike/Env04/api/v1.0/auth/token-esia', //Your service access token url
            redirectUri: redirectUri,
            customUriScheme: customUriScheme);
}

//Instantiate an OAuth2Client...
MyOAuth2Client client = MyOAuth2Client(
  customUriScheme:
      'my.test.app', //Must correspond to the AndroidManifest's "android:scheme" attribute
  redirectUri:
      'my.test.app:/oauth2redirect', //Can be any URI, but the scheme part must correspond to the customeUriScheme
);

//Then, instantiate the helper passing the previously instantiated client
OAuth2Helper oauth2Helper = OAuth2Helper(
  client,
  grantType: OAuth2Helper.authorizationCode,
  clientId: 'your_client_id',
  clientSecret: 'your_client_secret',
);
