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
    apiKey: 'AIzaSyBxQuPP34JvaQNWnDbe0-a7dWSuAJ5ZGnU',
    appId: '1:287955580453:android:9b53b01b573d22453cf1cc',
    messagingSenderId: '287955580453',
    projectId: 'z-clinic-46d2c',
    storageBucket: 'z-clinic-46d2c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbV0y5JOVJYRm00A00rsVEZlC-SqiQZx0',
    appId: '1:287955580453:ios:066476695468d5033cf1cc',
    messagingSenderId: '287955580453',
    projectId: 'z-clinic-46d2c',
    storageBucket: 'z-clinic-46d2c.appspot.com',
    androidClientId: '287955580453-em5f05oaqgvhrjqn5438rur34v4rifd9.apps.googleusercontent.com',
    iosClientId: '287955580453-3nlefg1uhj7p1oulg1gpltsg3fu9n17b.apps.googleusercontent.com',
    iosBundleId: 'com.example.medlike',
  );
}
