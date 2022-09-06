// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5w7u84emU5UXRDgb0pHlwZrRHKdm5YX8',
    appId: '1:352364144955:android:54beea10929893ddcf2f1e',
    messagingSenderId: '352364144955',
    projectId: 'medlike-medotrade',
    databaseURL: 'https://medlike-medotrade.firebaseio.com',
    storageBucket: 'medlike-medotrade.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaM_tyvgyE34xKuCj-g-V_5ClxkkeQKXg',
    appId: '1:352364144955:ios:0e885db4fb89e13acf2f1e',
    messagingSenderId: '352364144955',
    projectId: 'medlike-medotrade',
    databaseURL: 'https://medlike-medotrade.firebaseio.com',
    storageBucket: 'medlike-medotrade.appspot.com',
    androidClientId: '352364144955-83je5lti98nckk1v5o1tpnbov8k1ub8j.apps.googleusercontent.com',
    iosClientId: '352364144955-87snoj8im1hqvghvp58rfmmmprvr2rns.apps.googleusercontent.com',
    iosBundleId: 'com.medotrade.medlike',
  );
}
